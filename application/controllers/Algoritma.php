<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Algoritma
 */
class Algoritma extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('dataset_model');
		$this->load->model('user_model');
		$this->load->model('sesi_model');
		$this->load->model('cart_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array(
				'status_selesai' => 1
			);
			$que = $this->sesi_model->tampil_seleksi($where);
			$data['seleksi_aktif_ar'] = $que->result();
			$data['judul'] = "Algoritma";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_algoritma');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function hitung($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		// hitung cart
		$data['data_testing_cart'] = $this->hitungCart($id);
		$data['data_testing_c45'] = $this->hitungC45($id);

		$data['judul'] = "Hitung Algoritma";

		$this->load->view('admin/v_header', $data);
		$this->load->view('admin/v_algoritma_1');
		$this->load->view('admin/v_footer');
	}

	# ------------------------------------------------------------------------------------ #

	// ALGORITMA CART
	function hitungCart($id) {
		$this->cart_model->truncate('cart_rule');
		$this->cart_model->truncate('dataset_hitung');

		$where = array(
			'flag' => 0
		);
		$data = $this->cart_model->tampil_data('dataset', $where)->result();
		$this->cart_model->update_flag('dataset_hitung', $where);
		$this->cart_model->update_flag('cart_atribut_detail', $where);

		foreach ($data as $i) {
			if ($i->age < 25)
				$age = '< 25';
			elseif ($i->age <= 25)
				$age = '25-30';
			else
				$age = '> 35';

			if ($i->experience == 0)
				$experience = '0 tahun';
			elseif ($i->experience < 3)
				$experience = '1-2 tahun';
			else
				$experience = '> 2 tahun';

			if ($i->total_ability <= 7)
				$total_ability = '5-7';
			else
				$total_ability = '8-10';

			if ($i->nilai_online <= 79)
				$nilai_online = '70-79';
			elseif ($i->nilai_online <= 89)
				$nilai_online = '80-89';
			else
				$nilai_online = '90-100';

			if ($i->nilai_f2f <= 79)
				$nilai_f2f = '70-79';
			elseif ($i->nilai_f2f <= 89)
				$nilai_f2f = '80-89';
			else
				$nilai_f2f = '90-100';

			$data = array(
				'id' => null,
				'nama_lengkap' => $i->nama_lengkap,
				'age' => $age,
				'experience' => $experience,
				'last_education' => $i->last_education,
				'status' => $i->status,
				'total_ability' => $total_ability,
				'nilai_online' => $nilai_online,
				'nilai_f2f' => $nilai_f2f,
				'nilai_sikap' => $i->nilai_sikap,
				'flag' => 0,
				'status_passed' => $i->status_passed
			);
			$this->cart_model->add_dataset_hitung('dataset_hitung', $data);
		}

		$total_data = $this->cart_model->tampil_data('dataset_hitung', $where)->num_rows();
		do {
			$this->_hitungCart();
			$total_data = $this->cart_model->tampil_data('dataset_hitung', $where)->num_rows();
		} while ($total_data != 0);



		// hitung data training
		$where_training = array(
			'selection_stage_detail.id_stage' => $id
		);
		$data_training = $this->user_model->tampil_detail_user_stage($where_training)->result();
		$hasil = array();

		foreach ($data_training as $i) {
			if ($i->age < 25)
				$age = '< 25';
			elseif ($i->age <= 25)
				$age = '25-30';
			else
				$age = '> 35';

			if ($i->experience == 0)
				$experience = '0 tahun';
			elseif ($i->experience < 3)
				$experience = '1-2 tahun';
			else
				$experience = '> 2 tahun';

			if ($i->total_ability <= 7)
				$total_ability = '5-7';
			else
				$total_ability = '8-10';

			if ($i->nilai_online <= 79)
				$nilai_online = '70-79';
			elseif ($i->nilai_online <= 89)
				$nilai_online = '80-89';
			else
				$nilai_online = '90-100';

			if ($i->nilai_f2f <= 79)
				$nilai_f2f = '70-79';
			elseif ($i->nilai_f2f <= 89)
				$nilai_f2f = '80-89';
			else
				$nilai_f2f = '90-100';

			$testing = [$age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap];

			$hasil[] = [$i->full_name, $age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap, $this->dataTesting($testing)];
		}
		return $hasil;
	}

	function _hitungCart() {
		$where = array(
			'flag' => 0
		);
		$data_hitung = $this->cart_model->tampil_data('dataset_hitung', $where)->result();
		$total_data = $this->cart_model->tampil_data('dataset_hitung', $where)->num_rows();

		$_atribut = array(
			'cart_atribut_detail.flag' => 0
		);
		$atribut = $this->cart_model->tampil_atribut_join($_atribut)->result();

		$root = '';
		$root_id = '';
		$left = '';
		$right = '';

		$temp_fix_keputusan_left = array();
		$temp_fix_keputusan_right = array();

		$pl = array();
		$pr = array();
		$pj_l_lulus = array();
		$pj_l_gagal = array();
		$pj_r_lulus = array();
		$pl_pr_2 = array();
		$q = array();
		$hasil = array();
		foreach ($atribut as $i) {
			$where_left = array(
				$i->nm_atribut => $i->detail
			);
			$where_right = array(
				$i->nm_atribut.' !=' => $i->detail
			);
			$x = $this->cart_model->tampil_data('dataset_hitung', $where_left)->num_rows();
			$y = $this->cart_model->tampil_data('dataset_hitung', $where_right)->num_rows();


			$pl[$i->nm_atribut][] = $x/$total_data;
			$pr[$i->nm_atribut][] = $y/$total_data;


			// yang lulus dan gagal
			$where_left_lulus = array(
				$i->nm_atribut => $i->detail,
				'status_passed' => 'lulus'
			);
			$where_left_gagal = array(
				$i->nm_atribut => $i->detail,
				'status_passed' => 'gagal'
			);
			if ($x != 0) {
				$a_l = $this->cart_model->tampil_data('dataset_hitung', $where_left_lulus)->num_rows()/$x;
				$b_l = $this->cart_model->tampil_data('dataset_hitung', $where_left_gagal)->num_rows()/$x;
			}
			else {
				$a_l = 0;
				$b_l = 0;
			}
			

			$pj_l_lulus[] = $a_l;
			$pj_l_gagal[] = $b_l;

			if ($a_l != 0 && $b_l == 0) {
				$temp_fix_keputusan_left[$i->detail] = 'lulus';
			}
			if ($a_l == 0 && $b_l != 0) {
				$temp_fix_keputusan_left[$i->detail] = 'gagal';
			}
			// --------------------------------------------------
			$where_right_lulus = array(
				$i->nm_atribut.' !=' => $i->detail,
				'status_passed' => 'lulus'
			);
			$where_right_gagal = array(
				$i->nm_atribut.' !=' => $i->detail,
				'status_passed' => 'gagal'
			);
			if ($y != 0) {
				$a_r = $this->cart_model->tampil_data('dataset_hitung', $where_right_lulus)->num_rows()/$y;
				$b_r = $this->cart_model->tampil_data('dataset_hitung', $where_right_gagal)->num_rows()/$y;
			}
			else {
				$a_r = 0;
				$b_r = 0;
			}

			$pj_r_lulus[] = $a_r;
			$pj_r_gagal[] = $b_r;

			if ($a_r != 0 && $b_r == 0) {
				$temp_fix_keputusan_right[$i->detail] = 'lulus';
			}
			if ($a_r == 0 && $b_r != 0) {
				$temp_fix_keputusan_right[$i->detail] = 'gagal';
			}

			$dua = 2 * ($x/$total_data) * ($y/$total_data);
			$pl_pr_2[] = $dua;

			$tiga = abs($a_l-$a_r)+abs($b_l-$b_r);
			$q[] = $tiga;

			$hasil[$i->nm_atribut][$i->detail] = $dua*$tiga;
		}

		$maxx = -1;
		foreach ($hasil as $_aa => $key) {
			foreach ($key as $detail => $value) {
				if ($value > $maxx) {
					$maxx = $value;
					$root = $_aa;
					$left = $detail;
					$right = $detail;
				}
			}
		}

		foreach ($atribut as $i) {
			if ($root == $i->nm_atribut) {
				$root_id = $i->id;
			}
		}

		$fix_left = array();
		$fix_right = array();
		foreach ($temp_fix_keputusan_left as $key => $value) {
			if ($key == $left) {
				$fix_left = array(
					$key => $value
				);
			}
		}
		foreach ($temp_fix_keputusan_right as $key => $value) {
			if ($key == $right) {
				$fix_right = array(
					$key => $value
				);
			}
		}
		// echo "--------------------------------------<br>";
		$this->makeRule($root_id, $root, $left, $right, $fix_left, $fix_right);
	}

	function makeRule($root_id, $root, $left, $right, array $fix_left, array $fix_right) {
		$rule = $this->cart_model->cek_rule();
		$cek = $rule->num_rows();

		if ($cek == 0) {
			$root_ar = array(
				'atribut' => $root,
				'label' => $root,
				'left_keputusan' => $left,
				'right_keputusan' => '!'.$right
			);
			$id = $this->cart_model->insert_rule('cart_rule', $root_ar);

			if ($fix_left != null) {
				foreach ($fix_left as $key => $value) {
					$left_ar = array(
						'atribut' => $root,
						'label' => $key,
						'left_keputusan' => '-',
						'right_keputusan' => '-',
						'keputusan' => $value,
						'link' => $id
					);
					$this->cart_model->insert_rule('cart_rule', $left_ar);

					// ganti status atribut
					$data_atribut = array(
						'flag' => 1
					);
					$where_atribut = array(
						'detail' => $left
					);
					$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

					$_dataset = array('flag' => 1);
					$_where = array($root => $key);
					$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
				}
			}
			else {
				$left_ar = array(
					'atribut' => $root,
					'label' => $left,
					// 'label' => $root,
					'right_keputusan' => '-',
					'link' => $id
				);
				$this->cart_model->insert_rule('cart_rule', $left_ar);
			}

			if ($fix_right != null) {
				foreach ($fix_right as $key => $value) {
					$right_ar = array(
						'atribut' => $root,
						'label' => '!'.$key,
						'right_keputusan' => '-',
						'left_keputusan' => '-',
						'keputusan' => $value,
						'link' => $id
					);
					$this->cart_model->insert_rule('cart_rule', $right_ar);

					// ganti status atribut
					$data_atribut = array(
						'flag' => 1
					);
					$where_atribut = array(
						'detail !=' => $right,
						'id_atribut' => $root_id
					);
					$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

					$_dataset = array('flag' => 1);
					$_where = array($root.' !=' => $key);
					$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
				}
			}
			else {
				$right_ar = array(
					'atribut' => $root,
					'label' => '!'.$right,
					// 'label' => $root,
					'left_keputusan' => '-',
					'link' => $id
				);
				$this->cart_model->insert_rule('cart_rule', $right_ar);
			}
		}
		else {
			$where_left = array(
				'left_keputusan' => null
			);
			$kiri = $this->cart_model->cek_keputusan('cart_rule', $where_left);
			$cek_kiri = $kiri->num_rows();
			$data_kiri = $kiri->result();

			if ($cek_kiri != 0) {
				foreach ($data_kiri as $i) {
					$node_ar = array(
						// 'label' => $root,
						'left_keputusan' => $left,
						'right_keputusan' => '!'.$right
					);
					$node_where = array(
						'id' => $i->id
					);
					$this->cart_model->update_rule('cart_rule', $node_where, $node_ar);

					if ($fix_left != null) {
						foreach ($fix_left as $key => $value) {
							$left_ar = array(
								'atribut' => $root,
								'label' => $key,
								'left_keputusan' => '-',
								'right_keputusan' => '-',
								'keputusan' => $value,
								'link' => $i->id
							);
							$this->cart_model->insert_rule('cart_rule', $left_ar);

							// ganti status atribut
							$data_atribut = array(
								'flag' => 1
							);
							$where_atribut = array(
								'detail' => $left
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

							$_dataset = array('flag' => 1);
							$_where = array($root => $key);
							$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
						}
					}
					else {
						$left_ar = array(
							'label' => $root,
							'label' => $left,
							// 'label' => $root,
							'right_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $left_ar);
					}

					if ($fix_right != null) {
						foreach ($fix_right as $key => $value) {
							$right_ar = array(
								'atribut' => $root,
								'label' => '!'.$key,
								'right_keputusan' => '-',
								'left_keputusan' => '-',
								'keputusan' => $value,
								'link' => $i->id
							);
							$this->cart_model->insert_rule('cart_rule', $right_ar);

							// ganti status atribut
							$data_atribut = array(
								'flag' => 1
							);
							$where_atribut = array(
								'detail !=' => $right,
								'id_atribut' => $root_id
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

							$_dataset = array('flag' => 1);
							$_where = array($root.' !=' => $key);
							$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
						}
					}
					else {
						$right_ar = array(
							'label' => $root,
							'label' => '!'.$right,
							// 'label' => $root,
							'left_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $right_ar);
					}
				}
			}

			$where_right = array(
				'right_keputusan' => null
			);			
			$kanan = $this->cart_model->cek_keputusan('cart_rule', $where_right);
			$cek_kanan = $kanan->num_rows();
			$data_kanan = $kanan->result();

			if ($cek_kanan != 0) {
				foreach ($data_kanan as $i) {
					$node_ar = array(
						// 'label' => $root,
						'left_keputusan' => $left,
						'right_keputusan' => '!'.$right
					);
					$node_where = array(
						'id' => $i->id
					);
					$this->cart_model->update_rule('cart_rule', $node_where, $node_ar);

					if ($fix_left != null) {
						foreach ($fix_left as $key => $value) {
							$left_ar = array(
								'atribut' => $root,
								'label' => $key,
								'left_keputusan' => '-',
								'right_keputusan' => '-',
								'keputusan' => $value,
								'link' => $i->id
							);
							$this->cart_model->insert_rule('cart_rule', $left_ar);

							// ganti status atribut
							$data_atribut = array(
								'flag' => 1
							);
							$where_atribut = array(
								'detail' => $left
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

							$_dataset = array('flag' => 1);
							$_where = array($root => $key);
							$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
						}
					}
					else {
						$left_ar = array(
							'atribut' => $root,
							'label' => $left,
							// 'label' => $root,
							'right_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $left_ar);
					}

					if ($fix_right != null) {
						foreach ($fix_right as $key => $value) {
							$right_ar = array(
								'atribut' => $root,
								'label' => '!'.$key,
								'right_keputusan' => '-',
								'left_keputusan' => '-',
								'keputusan' => $value,
								'link' => $i->id
							);
							$this->cart_model->insert_rule('cart_rule', $right_ar);

							// ganti status atribut
							$data_atribut = array(
								'flag' => 1
							);
							$where_atribut = array(
								'detail !=' => $right,
								'id_atribut' => $root_id
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

							$_dataset = array('flag' => 1);
							$_where = array($root.' !=' => $key);
							$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
						}
					}
					else {
						$right_ar = array(
							'atribut' => $root,
							'label' => '!'.$right,
							// 'label' => $root,
							'left_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $right_ar);
					}
				}
			}
		}
	}

	function dataTesting(array $data_testing) {
		$tree = $this->cart_model->tampil_tree()->result();
		$link = null;
		$temp_left = null;
		$temp_right = null;
		$stop = false;
		$hasil = null;

		foreach ($tree as $i) {
			if ($stop == false) {
				foreach ($data_testing as $key => $value) {
					if ($i->id == 1) {
						$root = $i->atribut;
						$link = $i->id;
						$temp_left = $i->left_keputusan;
						$temp_right = $i->right_keputusan;
					}

					if ($i->atribut == $key && $i->link == $link) {
						if ($temp_left == $value && $temp_left == $i->label) {
							if ($i->keputusan != null) {
								$hasil = $i->keputusan;
								// echo $i->label;
								$stop = true;
							}
							else {
								$root = $i->atribut;
								$link = $i->id;
								$temp_left = $i->left_keputusan;
								$temp_right = $i->right_keputusan;
							}
						}
						if ($temp_right != $value && $temp_right == $i->label) {
							if ($i->keputusan != null) {
								$hasil = $i->keputusan;
								// echo $i->label;
								$stop = true;
							}
							else {
								$root = $i->atribut;
								$link = $i->id;
								$temp_left = $i->left_keputusan;
								$temp_right = $i->right_keputusan;
							}
						}
					}
				}
			}
		}
		return $hasil;
	}

	// ALGORITMA C4.5
	function hitungC45($id) {
		$this->load->library('C45');

		$attributes = [1 => "age", 2 => "experience", 3 => "last_education", 4 => "status", 5 => "total_ability", 6 => "nilai_online", 7 => "nilai_f2f", 8 => "nilai_sikap"];
		$dataset_hitung = $this->dataset_model->tampil_dataset()->result();

		$data_arr = array();
		foreach ($dataset_hitung as $i) {
			$data_arr[] = [$i->age, $i->experience, $i->last_education, $i->status, $i->total_ability, $i->nilai_online, $i->nilai_f2f, $i->nilai_sikap, $i->status_passed];
		}

		$this->c45->setData($data_arr)->setAttributes($attributes);
		$this->c45->hitung();
		// $this->c45->printRules();

		$where_training = array(
			'selection_stage_detail.id_stage' => $id
		);
		$data_training = $this->user_model->tampil_detail_user_stage($where_training)->result();
		$hasil = array();

		foreach ($data_training as $i) {
			if ($i->age < 25)
				$age = '< 25';
			elseif ($i->age <= 25)
				$age = '25-30';
			else
				$age = '> 35';

			if ($i->experience == 0)
				$experience = '0 tahun';
			elseif ($i->experience < 3)
				$experience = '1-2 tahun';
			else
				$experience = '> 2 tahun';

			if ($i->total_ability <= 7)
				$total_ability = '5-7';
			else
				$total_ability = '8-10';

			if ($i->nilai_online <= 79)
				$nilai_online = '70-79';
			elseif ($i->nilai_online <= 89)
				$nilai_online = '80-89';
			else
				$nilai_online = '90-100';

			if ($i->nilai_f2f <= 79)
				$nilai_f2f = '70-79';
			elseif ($i->nilai_f2f <= 89)
				$nilai_f2f = '80-89';
			else
				$nilai_f2f = '90-100';

			$testing = [$age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap];

			$hasil[] = [$i->full_name, $age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap, $this->c45->predictDataTesting($testing)];
		}
		return $hasil;
	}
}