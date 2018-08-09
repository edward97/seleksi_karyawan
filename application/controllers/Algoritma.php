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
		$this->load->model('akurasi_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array( 'status_selesai' => 1 );
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

	function detail() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$data['dataset'] = $this->dataset_model->tampil_dataset('dataset_hitung')->result();

		$check = $this->uri->segment(3);
		# MENAMPILKAN HALAMAN DETAIL HASIL PERHITUNGAN
		if ($check == 'cart') {
			$data['check'] = $check;
			$data['judul'] = "Detail Cart";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_algoritma_2');
			$this->load->view('admin/v_footer');
		}
		# MENAMPILKAN HALAMAN DETAIL HASIL PERHITUNGAN
		elseif ($check == 'c45') {
			$data['check'] = $check;
			$data['judul'] = "Detail C45";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_algoritma_2');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}


	function hitung($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		# 	HITUNG CART
		$data['data_testing_cart'] = $this->hitungCart($id);
		# HITUNG C45
		$data['data_testing_c45'] = $this->hitungC45($id);

		# --------------------------------------------------------------------------------------------------- #
		$data_atribut = array( 'flag' => 0 );
		$where_atribut = array( 'id !=' => 0 );
		$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);

		# HITUNG AKURASI
		$x = $this->akurasi_model->tampil_dataset('dataset_hitung');

		$dataset = $x->result();
		$total_data = $x->num_rows();

		$k = 10;
		$this->session->set_userdata('k', $k);

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
					$row = $this->akurasi_model->get_row('dataset', $where)->row_array();

					# ---------------------------------------
					if ($row['age'] < 25)
						$age = '< 25';
					elseif ($row['age'] <= 35)
						$age = '25-35';
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
					# --------------------------------------- #
					$arr[$i][$z] = [$row['nama_lengkap'], $age, $experience, $row['last_education'], $row['status'], $total_ability, $nilai_online, $nilai_f2f, $row['nilai_sikap'], $row['status_passed']];

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

		$this->session->set_userdata('konversi_dataset', $arr);
		$this->session->set_userdata('hasilcart', $hasilCart);
		$this->session->set_userdata('hasilc45', $hasilC45);

		$cart_accuracy = [];
		$cart_recall = [];
		$cart_precision = [];

		$data['akurasi_cart'] = 0;
		$data['akurasi_c45'] = 0;

		for ($i=0; $i < $k; $i++) {
			$cart_tp = 0;
			$cart_fn = 0;
			$cart_tn = 0;
			$cart_fp = 0;
			foreach ($hasilCart as $key => $next) {
				foreach ($next as $j => $value) {
					if ($value[9] == 'lulus' && $value[10] == 'lulus') {
						$cart_tp++;
					}
					elseif ($value[9] == 'lulus' && $value[10] == 'gagal') {
						$cart_fn++;
					}
					elseif ($value[9] == 'gagal' && $value[10] == 'lulus') {
						$cart_fp++;
					}
					else {
						$cart_tn++;
					}
				}
			}
			$akurasi = ($cart_tp + $cart_tn) / ($cart_tp + $cart_tn + $cart_fp + $cart_fn);
			$cart_accuracy[] = $akurasi;
			$cart_recall[] = $cart_tp / ($cart_tp + $cart_fn);
			$cart_precision[] = $cart_tp / ($cart_tp + $cart_fp);

			$data['akurasi_cart']+= $akurasi;
		}

		$c45_accuracy = [];
		$c45_recall = [];
		$c45_precision = [];

		for ($i=0; $i < $k; $i++) {
			$c45_tp = 0;
			$c45_fn = 0;
			$c45_tn = 0;
			$c45_fp = 0;

			foreach ($hasilC45 as $key => $next) {
				foreach ($next as $j => $value) {
					if ($value[9] == 'lulus' && $value[10] == 'lulus') {
						$c45_tp++;
					}
					elseif ($value[9] == 'lulus' && $value[10] == 'gagal') {
						$c45_fn++;
					}
					elseif ($value[9] == 'gagal' && $value[10] == 'lulus') {
						$c45_fp++;
					}
					else {
						$c45_tn++;
					}
				}
			}
			$akurasi = ($c45_tp + $c45_tn) / ($c45_tp + $c45_tn + $c45_fp + $c45_fn);
			$c45_accuracy[] = $akurasi;
			$c45_recall[] = $c45_tp / ($c45_tp + $c45_fn);
			$c45_precision[] = $c45_tp / ($c45_tp + $c45_fp);

			$data['akurasi_c45']+= $akurasi;
		}

		$data['akurasi_cart'] = $data['akurasi_cart'] / $k * 100;
		$data['akurasi_c45'] = $data['akurasi_c45'] / $k * 100;

		$data['judul'] = "Hitung Algoritma";

		$this->load->view('admin/v_header', $data);
		$this->load->view('admin/v_algoritma_1');
		$this->load->view('admin/v_footer');
	}

	/*
	* INISIALISASI ALGORITMA CART & TESTING
	* -------------------------------------
	*/
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
			elseif ($i->age <= 35)
				$age = '25-35';
			else
				$age = '> 35';

			if ($i->experience == 0)
				$experience = '0 tahun';
			elseif ($i->experience <= 2)
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
			# UBAH ATRIBUT DATASET
			$this->cart_model->add_dataset_hitung('dataset_hitung', $data);
		}
		$this->_hitungCart(null, null, null, null);

		# CEK APAKAH MASIH ADA TREE YANG BISA DI HITUNG
		$total_next = $this->cart_model->total_next('cart_rule', array('status_hitung' => 'next'))->num_rows();
		while ($total_next != 0) {
			$this->_loopTree();
			$total_next = $this->cart_model->total_next('cart_rule', array('status_hitung' => 'next'))->num_rows();
		}
	
		# HITUNG DATA TRAINING
		$where_training = array( 'selection_stage_detail.id_stage' => $id );
		$data_training = $this->user_model->tampil_detail_user_stage($where_training)->result();
		$hasil = array();

		foreach ($data_training as $i) {
			if ($i->age < 25)
				$age = '< 25';
			elseif ($i->age <= 35)
				$age = '25-35';
			else
				$age = '> 35';

			if ($i->experience == 0)
				$experience = '0 tahun';
			elseif ($i->experience <= 2)
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

			$testing = array(
				'age' => $age,
				'experience' => $experience,
				'last_education' => $i->last_education,
				'status' => $i->status,
				'total_ability' => $total_ability,
				'nilai_online' => $nilai_online,
				'nilai_f2f' => $nilai_f2f,
				'nilai_sikap' => $i->nilai_sikap
			);
			$hasil[] = [$i->full_name, $age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap, $this->dataTraining($testing, 'ht_dataset')];
		}
		return $hasil;
	}

	/*
	* ALGORITMA CART
	* --------------
	*/
	function _hitungCart($id, $last_atribut, $label, $keputusan) {
		$where = array( 'flag' => 0 );
		$data_hitung = $this->cart_model->tampil_data('dataset_hitung', $where)->result();
		$total_data = $this->cart_model->tampil_data('dataset_hitung', $where)->num_rows();

		$_atribut = array(
			'cart_atribut_detail.flag' => 0
		);
		$atribut = $this->cart_model->tampil_atribut_detail()->result();

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
				$i->attr => $i->detail
			);
			$where_right = array(
				$i->attr.' !=' => $i->detail
			);
			$x = $this->cart_model->tampil_data('dataset_hitung', $where_left)->num_rows();
			$y = $this->cart_model->tampil_data('dataset_hitung', $where_right)->num_rows();


			$pl[$i->attr][] = $x/$total_data;
			$pr[$i->attr][] = $y/$total_data;

			# LULUS ATAU GAGAL
			$where_left_lulus = array(
				$i->attr => $i->detail,
				'status_passed' => 'lulus'
			);
			$where_left_gagal = array(
				$i->attr => $i->detail,
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
			# --------------------------------------------------
			$where_right_lulus = array(
				$i->attr.' !=' => $i->detail,
				'status_passed' => 'lulus'
			);
			$where_right_gagal = array(
				$i->attr.' !=' => $i->detail,
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

			$hasil[$i->attr][$i->detail] = $dua*$tiga;
		}

		$root = NULL;
		$root_id = NULL;
		$left = NULL;
		$right = NULL;
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
			if ($root == $i->attr) {
				$root_id = $i->id;
			}
		}

		$fix_left = array();
		$fix_right = array();
		foreach ($temp_fix_keputusan_left as $key => $value) {
			if ($key == $left) {
				$fix_left = array( $key => $value );
			}
		}
		foreach ($temp_fix_keputusan_right as $key => $value) {
			if ($key == $right) {
				$fix_right = array( $key => $value );
			}
		}

		# CEK APAKAH RULE KOSONG
		$rule = $this->cart_model->cek_rule('cart_rule')->num_rows();
		if ($rule == 0) {
			$root_ar = array(
				'atribut' => $root,
				'label' => $root,
				'left_keputusan' => '="'.$left.'"',
				'right_keputusan' => '!="'.$right.'"',
				'status_hitung' => 'root'
			);
			$id = $this->cart_model->insert_rule('cart_rule', $root_ar);
			$this->loopTree();
		}
		else {
			$in_check = 0;
			# CEK APAKAH HASIL MEMILIKI CHILD ATAU TIDAK [LEFT]
			if ($fix_left != NULL) {
				foreach ($fix_left as $key => $value) {
					$left_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'keputusan' => $value,
						'link' => $id,
						'left_keputusan' => $left,
						'status_hitung' => 'stop',
					);
					$this->cart_model->insert_rule('cart_rule', $left_ar);
				}
			}
			if ($fix_left == NULL) {
				$left_ar = array(
					'atribut' => $root,
					'label' => $keputusan,
					'left_keputusan' => '="'.$left.'"',
					'keputusan' => NULL,
					'link' => $id,
					'status_hitung' => 'next',
					'atribut_cek' => $last_atribut.'~'.$root.'~',
					'label_kiri' => $label.'~="'.$left.'"~',
				);
				$in_check = $this->cart_model->insert_rule('cart_rule', $left_ar);
			}

			# CEK APAKAH HASIL MEMILIKI CHILD ATAU TIDAK [RIGHT]
			if ($fix_right != NULL) {
				foreach ($fix_right as $key => $value) {
					$right_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'keputusan' => $value,
						'link' => $id,
						'right_keputusan' => $right,
						'status_hitung' => 'stop',
					);
					$this->cart_model->insert_rule('cart_rule', $right_ar);
				}
			}
			if ($fix_right == NULL) {
				if ($in_check != 0) {
					$right_ar = array(
						'right_keputusan' => '!="'.$right.'"',
						'label_kanan' => $label.'~'.'!="'.$right.'"~',
					);
					$yy = array( 'id' => $in_check );
					$in_check = $this->cart_model->update_rule('cart_rule', $yy, $right_ar);
				}
				else {
					$right_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'right_keputusan' => '!="'.$right.'"',
						'keputusan' => NULL,
						'link' => $id,
						'status_hitung' => 'next',
						'atribut_cek' => $last_atribut.'~'.$root.'~',
						'label_kanan' => $label.'~!="'.$right.'"~',
					);
					$in_check = $this->cart_model->insert_rule('cart_rule', $right_ar);
				}
			}
		}
	}

	/*
	* INSERT TREE PERTAMA KALI DAN NEXT HITUNG
	* ----------------------------------------
	*/
	function loopTree() {
		$tree = $this->cart_model->tampil_tree('cart_rule')->result();
		foreach ($tree as $i) {
			if ($i->status_hitung == 'root') {
				# HITUNG ROOT KIRI
				$this->resetData();
				$data = array( 'flag' => 0 );
				$l = '';
				$l .= $i->label.$i->left_keputusan;
				$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$l);
				$this->_hitungCart($i->id, $i->atribut, $i->left_keputusan, $i->left_keputusan);

				# HITUNG ROOT KANAN
				$this->resetData();
				$r = '';
				$r .= $i->label.$i->right_keputusan;
				$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$r);
				$this->_hitungCart($i->id, $i->atribut, $i->right_keputusan, $i->right_keputusan);
				$this->_loopTree();
			}
		}
	}
	/*
	* CEK TREE YANG SUDAH DI BUAT PERTAMA KALI
	* ----------------------------------------
	*/
	function _loopTree() {
		$tree = $this->cart_model->tampil_tree('cart_rule')->result();
		foreach ($tree as $i) {
			if ($i->status_hitung == 'next') {
				if ($i->left_keputusan != null && $i->right_keputusan != null) {
					# HITUNG ROOT KIRI
					$this->resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array( 'flag' => 1 );
							$_tt = array( 'attr' => $value );
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# HITUNG ROOT KANAN
					$this->resetData();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array(
								'flag' => 1
							);
							$_tt = array(
								'attr' => $value
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart($i->id, $i->atribut_cek, $i->label_kanan, $i->right_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				elseif ($i->left_keputusan != null && $i->right_keputusan == null) {
					# HITUNG ROOT KIRI
					$this->resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array(
								'flag' => 1
							);
							$_tt = array(
								'attr' => $value
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) { # 0 1  2 
						foreach ($pecah_label as $key_2 => $value_2) { # 0 1 2
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				elseif ($i->left_keputusan == null && $i->right_keputusan != null) {
					# HITUNG ROOT KANAN
					$this->resetData();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array(
								'flag' => 1
							);
							$_tt = array(
								'attr' => $value
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart($i->id, $i->atribut_cek, $i->label_kanan, $i->right_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
			}
		}
	}

	/*
	* RESET FLAG TABEL DATASET
	* ------------------------
	*/
	function resetData() {
		$_dataset = array('flag' => 1);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
	}
	/*
	* RESET FLAG TABEL DATASET & ATRIBUT
	* ----------------------------------
	*/
	function resetData_1() {
		$_dataset = array('flag' => 1);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);

		# GANTI STATUS ATRIBUT
		$data_atribut = array( 'flag' => 0 );
		$where_atribut = array( 'id !=' => 0 );
		$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);
	}

	/*
	* DATA TRAINING ALGORITMA CART
	* ----------------------------
	*/
	function dataTraining(array $data, $check) {
		if ($check == 'ht_dataset') {
			$tree = $this->cart_model->tampil_tree('cart_rule')->result();
		}
		if ($check == 'ht_akurasi') {
			$tree = $this->cart_model->tampil_tree('cart_rule')->result();
		}

		$stop = FALSE;
		$temp_link = NULL;
		$temp_next = NULL;
		$hasil = NULL;

		foreach ($tree as $i) {
			if ($stop == FALSE) {
				foreach ($data as $tr_atribut => $tr_value) {
					$rep_left = str_replace(array('"', '='), '', $i->left_keputusan);
					$rep_right = str_replace(array('"', '=', '!'), '', $i->right_keputusan);

					if ($i->status_hitung == 'root' && $tr_atribut == $i->atribut) {
						if ($rep_left == $tr_value) {
							$temp_link = $i->id;
							$temp_next = $i->left_keputusan;
						}
						if ($rep_right != $tr_value) {
							$temp_link = $i->id;
							$temp_next = $i->right_keputusan;
						}
					}
					if ($i->link == $temp_link && $i->atribut == $tr_atribut && $i->label == $temp_next) {
						if ($i->keputusan != NULL) {
							if ($tr_value == $i->left_keputusan && $i->left_keputusan != NULL) {
								$hasil = $i->keputusan;
								$stop = TRUE;
							}
							if ($tr_value != $i->right_keputusan && $i->right_keputusan != NULL) {
								$hasil = $i->keputusan;
								$stop = TRUE;
							}
						}
						if ($i->keputusan == NULL) {
							if ($rep_left == $tr_value && $i->left_keputusan != NULL) {
								$temp_link = $i->id;
								$temp_next = $i->left_keputusan;
							}
							if ($rep_right != $tr_value && $i->right_keputusan != NULL) {
								$temp_link = $i->id;
								$temp_next = $i->right_keputusan;
							}
						}
					}
				}
			}
		}
		return $hasil;
	}

	/*
	* ALGORITMA C4.5
	* --------------
	*/
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
		# $this->c45->printRules();

		$where_training = array(
			'selection_stage_detail.id_stage' => $id
		);
		$data_training = $this->user_model->tampil_detail_user_stage($where_training)->result();
		$hasil = array();

		foreach ($data_training as $i) {
			if ($i->age < 25)
				$age = '< 25';
			elseif ($i->age <= 35)
				$age = '25-35';
			else
				$age = '> 35';

			if ($i->experience == 0)
				$experience = '0 tahun';
			elseif ($i->experience <= 2)
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

	/*
	* AKURASI ALGORITMA CART
	* ----------------------
	*/
	function akurasiCart($k, array $data) {

		for ($i=0; $i < $k; $i++) {
			$where = array( 'flag' => 0 );
			$this->akurasi_model->truncate_db('akurasi_dataset');
			$this->akurasi_model->truncate_db('akurasi_rule');
			$this->cart_model->update_flag('cart_atribut_detail', $where);
	
			$testing = array();
			foreach ($data as $key => $next) {
				if ($i == $key) {
					foreach ($next as $j => $value) {
						$testing[] = [$value[0], $value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
					}
				}
				else {
					foreach ($next as $j => $value) {
						$in = array(
							'id' => NULL,
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
			}
			// echo "<pre>";
			// print_r($testing);
			// echo "</pre>";

			$this->_hitungCart_acc(null, null, null, null);
			$total_next = $this->cart_model->total_next('akurasi_rule', array('status_hitung' => 'next'))->num_rows();
			while ($total_next != 0) {
				$this->_loopTree_acc();
				$total_next = $this->cart_model->total_next('akurasi_rule', array('status_hitung' => 'next'))->num_rows();
			}

			$hasil_keseluruhan_cart = array();
			# TESTING DATA
			foreach ($testing as $key => $value) {
				$tst = [
					'age' => $value[1],
					'experience' => $value[2],
					'last_education' => $value[3],
					'status' => $value[4],
					'total_ability' => $value[5],
					'nilai_online' => $value[6],
					'nilai_f2f' => $value[7],
					'nilai_sikap' => $value[8]
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
					$this->dataTraining($tst, 'ht_akurasi')
				];
			}
		}
		return $hasil_keseluruhan_cart;
	}

	/*
	* ALGORITMA CART
	* --------------
	*/
	function _hitungCart_acc($id, $last_atribut, $label, $keputusan) {
		$where = array( 'flag' => 0 );
		$data_hitung = $this->cart_model->tampil_data('akurasi_dataset', $where)->result();
		$total_data = $this->cart_model->tampil_data('akurasi_dataset', $where)->num_rows();

		$_atribut = array(
			'cart_atribut_detail.flag' => 0
		);
		$atribut = $this->cart_model->tampil_atribut_detail()->result();

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
				$i->attr => $i->detail
			);
			$where_right = array(
				$i->attr.' !=' => $i->detail
			);
			$x = $this->cart_model->tampil_data('akurasi_dataset', $where_left)->num_rows();
			$y = $this->cart_model->tampil_data('akurasi_dataset', $where_right)->num_rows();


			$pl[$i->attr][] = $x/$total_data;
			$pr[$i->attr][] = $y/$total_data;

			# LULUS ATAU GAGAL
			$where_left_lulus = array(
				$i->attr => $i->detail,
				'status_passed' => 'lulus'
			);
			$where_left_gagal = array(
				$i->attr => $i->detail,
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
			# --------------------------------------------------
			$where_right_lulus = array(
				$i->attr.' !=' => $i->detail,
				'status_passed' => 'lulus'
			);
			$where_right_gagal = array(
				$i->attr.' !=' => $i->detail,
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

			$hasil[$i->attr][$i->detail] = $dua*$tiga;
		}

		$root = NULL;
		$root_id = NULL;
		$left = NULL;
		$right = NULL;
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
			if ($root == $i->attr) {
				$root_id = $i->id;
			}
		}

		$fix_left = array();
		$fix_right = array();
		foreach ($temp_fix_keputusan_left as $key => $value) {
			if ($key == $left) {
				$fix_left = array( $key => $value );
			}
		}
		foreach ($temp_fix_keputusan_right as $key => $value) {
			if ($key == $right) {
				$fix_right = array( $key => $value );
			}
		}

		# CEK APAKAH RULE KOSONG
		$rule = $this->cart_model->cek_rule('akurasi_rule')->num_rows();
		if ($rule == 0) {
			$root_ar = array(
				'atribut' => $root,
				'label' => $root,
				'left_keputusan' => '="'.$left.'"',
				'right_keputusan' => '!="'.$right.'"',
				'status_hitung' => 'root'
			);
			$id = $this->cart_model->insert_rule('akurasi_rule', $root_ar);
			$this->loopTree_acc();
		}
		else {
			$in_check = 0;
			# CEK APAKAH HASIL MEMILIKI CHILD ATAU TIDAK [LEFT]
			if ($fix_left != NULL) {
				foreach ($fix_left as $key => $value) {
					$left_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'keputusan' => $value,
						'link' => $id,
						'left_keputusan' => $left,
						'status_hitung' => 'stop',
					);
					$this->cart_model->insert_rule('akurasi_rule', $left_ar);
				}
			}
			if ($fix_left == NULL) {
				$left_ar = array(
					'atribut' => $root,
					'label' => $keputusan,
					'left_keputusan' => '="'.$left.'"',
					'keputusan' => NULL,
					'link' => $id,
					'status_hitung' => 'next',
					'atribut_cek' => $last_atribut.'~'.$root.'~',
					'label_kiri' => $label.'~="'.$left.'"~',
				);
				$in_check = $this->cart_model->insert_rule('akurasi_rule', $left_ar);
			}

			# CEK APAKAH HASIL MEMILIKI CHILD ATAU TIDAK [RIGHT]
			if ($fix_right != NULL) {
				foreach ($fix_right as $key => $value) {
					$right_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'keputusan' => $value,
						'link' => $id,
						'right_keputusan' => $right,
						'status_hitung' => 'stop',
					);
					$this->cart_model->insert_rule('akurasi_rule', $right_ar);
				}
			}
			if ($fix_right == NULL) {
				if ($in_check != 0) {
					$right_ar = array(
						'right_keputusan' => '!="'.$right.'"',
						'label_kanan' => $label.'~'.'!="'.$right.'"~',
					);
					$yy = array( 'id' => $in_check );
					$in_check = $this->cart_model->update_rule('akurasi_rule', $yy, $right_ar);
				}
				else {
					$right_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'right_keputusan' => '!="'.$right.'"',
						'keputusan' => NULL,
						'link' => $id,
						'status_hitung' => 'next',
						'atribut_cek' => $last_atribut.'~'.$root.'~',
						'label_kanan' => $label.'~!="'.$right.'"~',
					);
					$in_check = $this->cart_model->insert_rule('akurasi_rule', $right_ar);
				}
			}
		}
	}

	/*
	* INSERT TREE PERTAMA KALI DAN NEXT HITUNG
	* ----------------------------------------
	*/
	function loopTree_acc() {
		$tree = $this->cart_model->tampil_tree('akurasi_rule')->result();
		foreach ($tree as $i) {
			if ($i->status_hitung == 'root') {
				# HITUNG ROOT KIRI
				$this->resetData_acc();
				$data = array( 'flag' => 0 );
				$l = '';
				$l .= $i->label.$i->left_keputusan;
				$this->db->query('UPDATE akurasi_dataset SET flag = 0 WHERE '.$l);
				$this->_hitungCart_acc($i->id, $i->atribut, $i->left_keputusan, $i->left_keputusan);

				# HITUNG ROOT KANAN
				$this->resetData_acc();
				$r = '';
				$r .= $i->label.$i->right_keputusan;
				$this->db->query('UPDATE akurasi_dataset SET flag = 0 WHERE '.$r);
				$this->_hitungCart_acc($i->id, $i->atribut, $i->right_keputusan, $i->right_keputusan);
				$this->_loopTree_acc();
			}
		}
	}
	/*
	* CEK TREE YANG SUDAH DI BUAT PERTAMA KALI
	* ----------------------------------------
	*/
	function _loopTree_acc() {
		$tree = $this->cart_model->tampil_tree('akurasi_rule')->result();
		foreach ($tree as $i) {
			if ($i->status_hitung == 'next') {
				if ($i->left_keputusan != null && $i->right_keputusan != null) {
					# HITUNG ROOT KIRI
					$this->resetData_1_acc();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array( 'flag' => 1 );
							$_tt = array( 'attr' => $value );
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_dataset SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart_acc($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# HITUNG ROOT KANAN
					$this->resetData_acc();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array(
								'flag' => 1
							);
							$_tt = array(
								'attr' => $value
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_dataset SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart_acc($i->id, $i->atribut_cek, $i->label_kanan, $i->right_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				elseif ($i->left_keputusan != null && $i->right_keputusan == null) {
					# HITUNG ROOT KIRI
					$this->resetData_1_acc();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array(
								'flag' => 1
							);
							$_tt = array(
								'attr' => $value
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) { # 0 1  2 
						foreach ($pecah_label as $key_2 => $value_2) { # 0 1 2
							if ($key_1 == $key_2 && $value_1 != null) { # 0 0 nilai sikap != null 1 1 last_education != null 2 2 null == ''
								$str .= $value_1.$value_2.' AND '; # nilai_sikap = sangat baik AND last_education = sma AND
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_dataset SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart_acc($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				elseif ($i->left_keputusan == null && $i->right_keputusan != null) {
					# HITUNG ROOT KANAN
					$this->resetData_acc();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($pecah_atribut as $key => $value) {
						if ($value != null) {
							$_zz = array(
								'flag' => 1
							);
							$_tt = array(
								'attr' => $value
							);
							$this->cart_model->update_atribut_detail('cart_atribut_detail', $_tt, $_zz);
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != null) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_dataset SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart_acc($i->id, $i->atribut_cek, $i->label_kanan, $i->right_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
			}
		}
	}

	/*
	* RESET FLAG TABEL DATASET
	* ------------------------
	*/
	function resetData_acc() {
		$_dataset = array('flag' => 1);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);
	}
	/*
	* RESET FLAG TABEL DATASET & ATRIBUT
	* ----------------------------------
	*/
	function resetData_1_acc() {
		$_dataset = array('flag' => 1);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('akurasi_dataset', $_where, $_dataset);

		# GANTI STATUS ATRIBUT
		$data_atribut = array( 'flag' => 0 );
		$where_atribut = array( 'id !=' => 0 );
		$this->cart_model->update_atribut_detail('cart_atribut_detail', $where_atribut, $data_atribut);
	}

	/*
	* AKURASI ALGORITMA C4.5
	* ----------------------
	*/
	function akurasiC45($k, array $data) {
		$this->load->library('C45');
		$attributes = [
			1 => "age",
			2 => "experience",
			3 => "last_education",
			4 => "status",
			5 => "total_ability",
			6 => "nilai_online",
			7 => "nilai_f2f",
			8 => "nilai_sikap"
		];

		$hasil_keseluruhan_c45 = array();
		for ($i=0; $i < $k; $i++) {
			$data_arr = array();
			$testing = array();

			foreach ($data as $key => $next) {
				if ($i == $key) {
					foreach ($next as $j => $value) {
						// $data_arr[] = [$value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
						$testing[] = [$value[0], $value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
					}
				}
				else {
					foreach ($next as $j => $value) {
						// $testing[] = [$value[0], $value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
						$data_arr[] = [$value[1], $value[2], $value[3], $value[4], $value[5], $value[6], $value[7], $value[8], $value[9]];
					}
				}
			}

			# HITUNG C4.5
			$this->c45->setData($data_arr)->setAttributes($attributes);
			$this->c45->hitung();
			# $this->c45->printRules();

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
		return $hasil_keseluruhan_c45;
	}
}