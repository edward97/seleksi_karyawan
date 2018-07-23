<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Cart
 */
class Cart extends CI_Controller
{

	// update cart_atribut_detail set flag = 0;
	// update dataset_hitung set flag = 0;
	// truncate cart_rule;
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('cart_model');
	}

	function index() {
		$this->hitungCart();
		// echo "testing";
	}

	function hitungCart() {
		// $this->cart_model->truncate('dataset_hitung');
		$where = array(
			'flag' => 0
		);
		// $data = $this->cart_model->tampil_data('dataset', $where)->result();

		// foreach ($data as $i) {
		// 	if ($i->experience == 0) {
		// 		$experience = '0 tahun';
		// 	}
		// 	elseif ($i->experience < 3) {
		// 		$experience = '1-2 tahun';
		// 	}
		// 	else {
		// 		$experience = '> 2 tahun';
		// 	}

		// 	if ($i->nilai_online <= 79) {
		// 		$nilai_online = '70 -79';
		// 	}
		// 	elseif ($i->nilai_online <= 89) {
		// 		$nilai_online = '80 - 89';
		// 	}
		// 	else {
		// 		$nilai_online = '90-100';
		// 	}

		// 	$data = array(
		// 		'id' => null,
		// 		'nama_lengkap' => $i->nama_lengkap,
		// 		'umur' => $i->umur,
		// 		'experience' => $experience,
		// 		'last_education' => $i->last_education,
		// 		'status' => $i->status,
		// 		'total_kemampuan' => $i->total_kemampuan,
		// 		'nilai_online' => $nilai_online,
		// 		'nilai_f2f' => $i->nilai_f2f,
		// 		'nilai_sikap' => $i->nilai_sikap,
		// 		'flag' => 0,
		// 		'status_passed' => $i->status_passed
		// 	);
		// 	$this->cart_model->add_dataset_hitung('dataset_hitung', $data);
		// }
		$data_hitung = $this->cart_model->tampil_data('dataset_hitung', $where)->result();
		$total_data = $this->cart_model->tampil_data('dataset_hitung', $where)->num_rows();

		$_atribut = array(
			'cart_atribut_detail.flag' => 0
		);
		$atribut = $this->cart_model->tampil_atribut_join($_atribut)->result();

		// echo $total_data;

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

		// echo "<p>PL</p>";
		// echo "<pre>";
		// print_r($pl);
		// echo "</pre>";

		// echo "<p>PR</p>";
		// echo "<pre>";
		// print_r($pr);
		// echo "</pre>";

		// echo "<p>PJ - L LULUS</p>";
		// echo "<pre>";
		// print_r($pj_l_lulus);
		// echo "</pre>";

		// echo "<p>PJ - L GAGAL</p>";
		// echo "<pre>";
		// print_r($pj_l_gagal);
		// echo "</pre>";

		// echo "<p>PJ - R LULUS</p>";
		// echo "<pre>";
		// print_r($pj_r_lulus);
		// echo "</pre>";

		// echo "<p>PJ - R GAGAL</p>";
		// echo "<pre>";
		// print_r($pj_r_gagal);
		// echo "</pre>";

		// echo "<p>2 * PL PR</p>";
		// echo "<pre>";
		// print_r($pl_pr_2);
		// echo "</pre>";

		// echo "<p>Q</p>";
		// echo "<pre>";
		// print_r($q);
		// echo "</pre>";

		// echo "<p>Hasil</p>";
		// echo "<pre>";
		// print_r($hasil);
		// echo "</pre>";

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
		echo $root."<br>";
		echo $left."<br>";
		echo $right."<br>";
		echo $maxx."<br>";

		$fix_left = array();
		$fix_right = array();
		foreach ($temp_fix_keputusan_left as $key => $value) {
			if ($key == $left) {
				$fix_left = array(
					$key => $value
				);

				echo "<br>fix left => ".$key." ".$value."<br>";
			}
		}
		foreach ($temp_fix_keputusan_right as $key => $value) {
			if ($key == $right) {
				$fix_right = array(
					$key => $value
				);
				echo "<br>fix right => ".$key." ".$value."<br>";
			}
		}

		$this->makeRule($root_id, $root, $left, $right, $fix_left, $fix_right);
	}







	function makeRule($root_id, $root, $left, $right, array $fix_left, array $fix_right) {
		$rule = $this->cart_model->cek_rule();
		$cek = $rule->num_rows();

		if ($cek == 0) {
			$root_ar = array(
				'label' => $root,
				'left_keputusan' => $left,
				'right_keputusan' => '!'.$right
			);
			$id = $this->cart_model->insert_rule('cart_rule', $root_ar);

			if ($fix_left != null) {
				foreach ($fix_left as $key => $value) {
					$left_ar = array(
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
					'label' => $left,
					'right_keputusan' => '-',
					'link' => $id
				);
				$this->cart_model->insert_rule('cart_rule', $left_ar);
			}

			if ($fix_right != null) {
				foreach ($fix_right as $key => $value) {
					$right_ar = array(
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
					'label' => '!'.$right,
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
							'label' => $left,
							'right_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $left_ar);
					}

					if ($fix_right != null) {
						echo $root_id;
						foreach ($fix_right as $key => $value) {
							$right_ar = array(
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
							'label' => '!'.$right,
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
							'label' => $left,
							'right_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $left_ar);
					}

					if ($fix_right != null) {
						foreach ($fix_right as $key => $value) {
							$right_ar = array(
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
							'label' => '!'.$right,
							'left_keputusan' => '-',
							'link' => $i->id
						);
						$this->cart_model->insert_rule('cart_rule', $right_ar);
					}
				}
			}
		}
	}
}