<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Akurasi
 */
class Akurasi extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('akurasi_model');
		$this->load->model('cart_model');
	}

	function hitung_akurasi() {
		$x = $this->akurasi_model->tampil_dataset();

		$dataset = $x->result();
		$total_data = $x->num_rows();

		$k = 5;
		$start_partisi = 0;
		$partisi = $total_data/$k;
		$end = $partisi;

		$arr = array();
		$hasil = array();

		$z = 0;
		for ($i=0; $i < $k; $i++) { 
			foreach ($dataset as $g) {
				if ($z < $end) {
					$where = array(
						'id' => $z+1
					);
					$row = $this->akurasi_model->get_row('dataset_hitung', $where)->row_array();

					# ---------------------------------------
					if ($row['age'] < 25)
						$age = '< 25';
					elseif ($row['age'] <= 30)
						$age = '25-30';
					else
						$age = '> 35';

					if ($row['experience'] == 0)
						$experience = '0 tahun';
					elseif ($row['experience'] <= 2)
						$experience = '1-2 tahun';
					else
						$experience = '> 2 tahun';

					if ($row['total_ability'] <= 7)
						$total_ability = '5-7';
					else
						$total_ability = '8-10';

					if ($row['nilai_online'] <= 79)
						$nilai_online = '70-79';
					elseif ($row['nilai_online'] <= 89)
						$nilai_online = '80-89';
					else
						$nilai_online = '90-100';

					if ($row['nilai_f2f'] <= 79)
						$nilai_f2f = '70-79';
					elseif ($row['nilai_f2f'] <= 89)
						$nilai_f2f = '80-89';
					else
						$nilai_f2f = '90-100';
					# ---------------------------------------

					$arr[$i][$z] = [$row['nama_lengkap'], $age, $experience, $row['last_education'], $row['status'], $total_ability, $nilai_online, $nilai_f2f, $row['nilai_sikap'], $row['status_passed']];

					// $hasil[$i][$z] = [$row['nama_lengkap'], $age, $experience, $row['last_education'], $row['status'], $total_ability, $nilai_online, $nilai_f2f, $row['nilai_sikap'], $row['status_passed'], $this->dataTesting($testing)];
					$z++;
				}
			}
			$end+=$partisi;
		}
		// echo "<pre>";
		// print_r($arr);
		// echo "</pre>";

		$hasilCart = $this->akurasiCart($k, $arr);
		$hasilC45 = $this->akurasiC45($k, $arr);

	}

	function akurasiCart($k, array $data) {
		$hasil_keseluruhan_cart = array();

		for ($i=0; $i < $k; $i++) {
			$testing = array();
			$where = array(
				'flag' => 0
			);

			$this->akurasi_model->truncate_db('akurasi_dataset');
			$this->akurasi_model->truncate_db('akurasi_rule');
			$this->cart_model->update_flag('dataset_hitung', $where);
			$this->cart_model->update_flag('cart_atribut_detail', $where);

			foreach ($data as $key => $next) {
				if ($i == $key) {
					foreach ($next as $j => $value) {
						$in = array(
							'id' => null,
							'nama_lengkap' => $value[0],
							'age' => $value[1],
							'experience' => $value[2],
							'last_education' => $value[3],
							'status' => $value[4],
							'total_ability' => $value[5],
							'nilai_online' => $value[6],
							'nilai_f2f' => $value[7],
							'nilai_sikap' => $value[8],
							'flag' => 0,
							'status_passed' => $value[9]
						);
						$this->akurasi_model->add_data('akurasi_dataset', $in);
					}
				}
				else {
					foreach ($next as $j => $value) {
						$testing[] = [$value[0], $value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
					}
				}
			}

			// hitung cart
			$total_data = $this->akurasi_model->get_row('akurasi_dataset', $where)->num_rows();
			do {
				$this->hitung_cart_akurasi();
				$total_data = $this->akurasi_model->get_row('akurasi_dataset', $where)->num_rows();
			} while ($total_data != 0);

			foreach ($testing as $key => $value) {
				$tst = [
					$value[1],
					$value[2],
					$value[3],
					$value[4],
					$value[5],
					$value[6],
					$value[7],
					$value[8]
				];

				$hasil_keseluruhan_cart[$i][] = [
					$value[0],
					$value[1],
					$value[2],
					$value[3],
					$value[4],
					$value[5],
					$value[6],
					$value[7],
					$value[8],
					$value[9],
					$this->data_testing_cart($tst)
				];
			}
		}
		// echo "<pre>";
		// print_r($hasil_keseluruhan_cart);
		// echo "</pre>";
		return $hasil_keseluruhan_cart;
	}


	function hitung_cart_akurasi() {
		$where = array(
			'flag' => 0
		);
		$data_hitung = $this->cart_model->tampil_data('akurasi_dataset', $where)->result();
		$total_data = $this->cart_model->tampil_data('akurasi_dataset', $where)->num_rows();

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
			$x = $this->cart_model->tampil_data('akurasi_dataset', $where_left)->num_rows();
			$y = $this->cart_model->tampil_data('akurasi_dataset', $where_right)->num_rows();


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
				$a_l = $this->cart_model->tampil_data('akurasi_dataset', $where_left_lulus)->num_rows()/$x;
				$b_l = $this->cart_model->tampil_data('akurasi_dataset', $where_left_gagal)->num_rows()/$x;
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
				$a_r = $this->cart_model->tampil_data('akurasi_dataset', $where_right_lulus)->num_rows()/$y;
				$b_r = $this->cart_model->tampil_data('akurasi_dataset', $where_right_gagal)->num_rows()/$y;
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
		$this->make_rule_akurasi($root_id, $root, $left, $right, $fix_left, $fix_right);
	}

	function make_rule_akurasi($root_id, $root, $left, $right, array $fix_left, array $fix_right) {
		$rule = $this->cart_model->cek_rule('akurasi_rule');
		$cek = $rule->num_rows();

		if ($cek == 0) {
			$root_ar = array(
				'atribut' => $root,
				'label' => $root,
				'left_keputusan' => $left,
				'right_keputusan' => '!'.$right
			);
			$id = $this->cart_model->insert_rule('akurasi_rule', $root_ar);

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
					$this->cart_model->insert_rule('akurasi_rule', $left_ar);

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
					$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
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
				$this->cart_model->insert_rule('akurasi_rule', $left_ar);
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
					$this->cart_model->insert_rule('akurasi_rule', $right_ar);

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
					$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
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
				$this->cart_model->insert_rule('akurasi_rule', $right_ar);
			}
		}
		else {
			$where_left = array(
				'left_keputusan' => null
			);
			$kiri = $this->cart_model->cek_keputusan('akurasi_rule', $where_left);
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
					$this->cart_model->update_rule('akurasi_rule', $node_where, $node_ar);

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
							$this->cart_model->insert_rule('akurasi_rule', $left_ar);

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
							$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
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
						$this->cart_model->insert_rule('akurasi_rule', $left_ar);
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
							$this->cart_model->insert_rule('akurasi_rule', $right_ar);

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
							$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
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
						$this->cart_model->insert_rule('akurasi_rule', $right_ar);
					}
				}
			}

			$where_right = array(
				'right_keputusan' => null
			);			
			$kanan = $this->cart_model->cek_keputusan('akurasi_rule', $where_right);
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
					$this->cart_model->update_rule('akurasi_rule', $node_where, $node_ar);

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
							$this->cart_model->insert_rule('akurasi_rule', $left_ar);

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
							$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
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
						$this->cart_model->insert_rule('akurasi_rule', $left_ar);
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
							$this->cart_model->insert_rule('akurasi_rule', $right_ar);

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
							$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
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
						$this->cart_model->insert_rule('akurasi_rule', $right_ar);
					}
				}
			}
		}
	}

	function data_testing_cart(array $data_testing) {
		$tree = $this->cart_model->tampil_tree('akurasi_rule')->result();
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
	function akurasiC45($k, array $data) {
		$this->load->library('C45');

		$attributes = [1 => "age", 2 => "experience", 3 => "last_education", 4 => "status", 5 => "total_ability", 6 => "nilai_online", 7 => "nilai_f2f", 8 => "nilai_sikap"];

		$hasil_keseluruhan_c45 = array();
		for ($i=0; $i < $k; $i++) {
			$data_arr = array();
			$testing = array();

			foreach ($data as $key => $next) {
				if ($i == $key) {
					foreach ($next as $j => $value) {
						$data_arr[] = [$value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
					}
				}
				else {
					foreach ($next as $j => $value) {
						$testing[] = [$value[0], $value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
					}
				}
			}

			// hitung c45
			$this->c45->setData($data_arr)->setAttributes($attributes);
			$this->c45->hitung();
			// $this->c45->printRules();

			foreach ($testing as $key => $value) {
				$tst = [
					$value[1],
					$value[2],
					$value[3],
					$value[4],
					$value[5],
					$value[6],
					$value[7],
					$value[8]
				];

				$hasil_keseluruhan_c45[$i][] = [
					$value[0],
					$value[1],
					$value[2],
					$value[3],
					$value[4],
					$value[5],
					$value[6],
					$value[7],
					$value[8],
					$value[9],
					$this->c45->predictDataTesting($tst)
				];
			}
		}

		// echo "<pre>";
		// print_r($hasil_keseluruhan_c45);
		// echo "</pre>";
		return $hasil_keseluruhan_c45;
	}
}