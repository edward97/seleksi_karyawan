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
		$this->load->model('c45_model');
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
		$check = $this->uri->segment(3);
		# MENAMPILKAN HALAMAN DETAIL HASIL PERHITUNGAN
		if ($check == 'cart') {
			# HITUNG AKURASI
			$this->hitung_akurasi_cart();
			redirect('algoritma/hasil_detail/'.$check);
		}
		# MENAMPILKAN HALAMAN DETAIL HASIL PERHITUNGAN
		elseif ($check == 'c45') {
			# HITUNG AKURASI
			$this->hitung_akurasi_c45();
			redirect('algoritma/hasil_detail/'.$check);
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function hasil_detail($check) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		
		if ($check == 'cart') {
			$data['check'] = $check;
			$data['judul'] = "Detail Cart";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_algoritma_2');
			$this->load->view('admin/v_footer');
		}
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
		$this->cart_model->truncate('dataset_hitung');
		$where = array('flag' => 0);
		$data = $this->cart_model->tampil_data('dataset', $where)->result();
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
				'id' => NULL,
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
		# 	HITUNG CART
		$cart = $this->hitungCart($id);
		# HITUNG C4.5
		$c45 = $this->hitungC45($id);

		$this->session->set_userdata('data_testing_cart', $cart);
		$this->session->set_userdata('data_testing_c45', $c45);
		redirect('algoritma/tampil_hasil');
	}
	function tampil_hasil() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
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

		$where = array('flag' => 0);
		$this->cart_model->update_flag('dataset_hitung', $where);
		$this->cart_model->update_flag('atribut_detail', $where);
		
		$this->_hitungCart(NULL, NULL, NULL, NULL);

		# CEK APAKAH MASIH ADA TREE YANG BISA DI HITUNG
		$total_next = $this->cart_model->total_next('cart_rule', array('status_hitung' => 'next'))->num_rows();
		while ($total_next != 0) {
			$this->_loopTree();
			$total_next = $this->cart_model->total_next('cart_rule', array('status_hitung' => 'next'))->num_rows();
		}
	
		# HITUNG DATA TRAINING
		$where_training = array( 'selection_stage_detail.id_stage' => $id );
		$data_training = $this->user_model->tampil_detail_user_stage($where_training)->result();
		$hasil = [];

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
			$hasil[] = [$i->full_name, $age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap, $this->training_Cart($testing, 'ht_dataset')];
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
			'atribut_detail.flag' => 0
		);
		$atribut = $this->cart_model->tampil_atribut_detail('atribut_detail', $_atribut)->result();

		$temp_fix_keputusan_left = $temp_fix_keputusan_right = $pl = $pr = $pj_l_lulus = $pj_l_gagal = $pj_r_lulus = $pl_pr_2 = $q = $hasil = [];
		$skip_kiri = $skip_kanan = [];
		
		foreach ($atribut as $i) {

			$where_left = array(
				$i->attr => $i->detail,
				'flag' => 0
			);
			$where_right = array(
				$i->attr.' !=' => $i->detail,
				'flag' => 0
			);
			$x = $this->cart_model->tampil_data('dataset_hitung', $where_left)->num_rows();
			$y = $this->cart_model->tampil_data('dataset_hitung', $where_right)->num_rows();

			if ($total_data != 0) {
				$pl[$i->attr][] = $x/$total_data;
				$pr[$i->attr][] = $y/$total_data;
			}
			else {
				$pl[$i->attr][] = 0;
				$pr[$i->attr][] = 0;	
			}

			# LULUS ATAU GAGAL
			$where_left_lulus = array(
				$i->attr => $i->detail,
				'status_passed' => 'lulus',
				'flag' => 0
			);
			$where_left_gagal = array(
				$i->attr => $i->detail,
				'status_passed' => 'gagal',
				'flag' => 0
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
			if ($a_l == 0 && $b_l == 0) {
				$skip_kiri[$i->detail] = '#SKIP';
			}

			# --------------------------------------------------
			$where_right_lulus = array(
				$i->attr.' !=' => $i->detail,
				'status_passed' => 'lulus',
				'flag' => 0
			);
			$where_right_gagal = array(
				$i->attr.' !=' => $i->detail,
				'status_passed' => 'gagal',
				'flag' => 0
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
			if ($a_r == 0 && $b_r == 0) {
				$skip_kanan[$i->detail] = '#SKIP';
			}

			$dua = 0;
			if ($total_data != 0) {
				$dua = 2 * ($x/$total_data) * ($y/$total_data);
			}
			$pl_pr_2[] = $dua;

			$tiga = abs($a_l-$a_r)+abs($b_l-$b_r);
			$q[] = $tiga;

			$hasil[$i->attr][$i->detail] = $dua*$tiga;
		}

		$root = $root_id = $left = $right = NULL;
		$maxx = -999;
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

		$fix_left = $fix_right = [];
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

		$lanjut_kiri = '="'.$left.'"';
		$lab_kiri = $label.'~="'.$left.'"~';
		foreach ($skip_kiri as $key => $value) {
			if ($key == $left) {
				$lanjut_kiri = NULL;
				$lab_kiri = '';
			}
		}

		$lanjut_kanan = '!="'.$right.'"';
		$lab_kanan = $label.'~'.'!="'.$right.'"~';
		foreach ($skip_kanan as $key => $value) {
			if ($key == $right) {
				$lanjut_kanan = NULL;
				$lab_kanan = '';
			}
		}

		$kpt = 'next';
		if ($maxx == 0) {
			$kpt = '#DataTidakJelas';
		}
		if ($total_data == 0) {
			$kpt = '#SKIP';
		}

		# CEK APAKAH RULE KOSONG
		$rule = $this->cart_model->cek_rule('cart_rule')->num_rows();
		if ($rule == 0) {
			$root_ar = array(
				'atribut' => $root,
				'label' => $root,
				'left_keputusan' => $lanjut_kiri,
				'right_keputusan' => $lanjut_kanan,
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
					'left_keputusan' => $lanjut_kiri,
					'keputusan' => NULL,
					'link' => $id,
					'status_hitung' => $kpt,
					'atribut_cek' => $last_atribut.'~'.$root.'~',
					'label_kiri' => $lab_kiri,
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
						'right_keputusan' => $lanjut_kanan,
						'label_kanan' => $lab_kanan,
					);
					$yy = array( 'id' => $in_check );
					$in_check = $this->cart_model->update_rule('cart_rule', $yy, $right_ar);
				}
				else {
					$right_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'right_keputusan' => $lanjut_kanan,
						'keputusan' => NULL,
						'link' => $id,
						'status_hitung' => $kpt,
						'atribut_cek' => $last_atribut.'~'.$root.'~',
						'label_kanan' => $lab_kanan,
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
		$atr = $this->cart_model->tampil_atribut('atribut_detail')->result();

		foreach ($tree as $i) {
			if ($i->status_hitung == 'next') {
				if ($i->left_keputusan != NULL && $i->right_keputusan != NULL) {
					# HITUNG ROOT KIRI
					$this->resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}

					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$newarraynama);
					$this->_hitungCart($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# HITUNG ROOT KANAN
					$this->resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}

					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
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
				elseif ($i->left_keputusan != NULL && $i->right_keputusan == NULL) {
					# HITUNG ROOT KIRI
					$this->resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}

					foreach ($pecah_atribut as $key_1 => $value_1) { 
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
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
				elseif ($i->left_keputusan == NULL && $i->right_keputusan != NULL) {
					# HITUNG ROOT KANAN
					$this->resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}
					
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
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
				else {
					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE cart_rule SET status_hitung = "#SKIP" WHERE id = '.$i->id);
				}
			}
		}
	}

	/*
	* DATA TRAINING ALGORITMA CART
	* ----------------------------
	*/
	function training_Cart(array $data, $check) {
		if ($check == 'ht_dataset') {
			$tree = $this->cart_model->tampil_tree('cart_rule')->result();
		}
		if ($check == 'ht_akurasi') {
			$tree = $this->cart_model->tampil_tree('akurasi_cart_rule')->result();
		}

		$stop = FALSE;
		$temp_link = $temp_next = $hasil = NULL;

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
	* * INISIALISASI ALGORITMA C4.5 & TESTING
	* ---------------------------------------
	*/
	function hitungC45($id) {
		# KOSONGKAN TABEL
		$this->c45_model->truncate('c45_rule');

		# UPDATE FLAG DATA
		$where = array('flag' => 0);
		$this->c45_model->update_flag('dataset_hitung', $where);
		$this->c45_model->update_flag('atribut_detail', $where);
		$this->_hitungC45(NULL, NULL, NULL);

		# CEK APAKAH MASIH ADA TREE YANG BISA DI HITUNG
		$total_next = $this->c45_model->tampil_data('c45_rule', array('status_hitung' => 'next_child'))->num_rows();
		while ($total_next != 0) {
			$this->loopTree_C45();
			$total_next = $this->c45_model->tampil_data('c45_rule', array('status_hitung' => 'next_child'))->num_rows();
		}

		# HITUNG DATA TRAINING
		$where_training = array( 'selection_stage_detail.id_stage' => $id );
		$data_training = $this->user_model->tampil_detail_user_stage($where_training)->result();
		$hasil = [];

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
			$hasil[] = [$i->full_name, $age, $experience, $i->last_education, $i->status, $total_ability, $nilai_online, $nilai_f2f, $i->nilai_sikap, $this->training_C45($testing, 'ht_dataset')];
		}
		return $hasil;
	}
	/*
	* HITUNG ALGORITMA C4.5
	* ---------------------
	*/
	function _hitungC45($last_id, $last_atribut, $last_label) {
		$where = array('flag' => 0);
		$que = $this->c45_model->tampil_data('dataset_hitung', $where);

		$data = $que->result();
		$total_data = $que->num_rows();
		$attributes = $this->c45_model->tampil_atribut_detail('atribut_detail', $where)->result();
		
		$entropy_keseluruhan = $entropy_atribut = NULL;
		$gain = $fix_temp = [];

		foreach ($attributes as $i) {
			# TOTAL DATA LULUS
			$where_lulus = array('status_passed' => 'lulus', 'flag' => 0);
			$total_lulus = $this->c45_model->tampil_data('dataset_hitung', $where_lulus)->num_rows();
			# TOTAL DATA GAGAL
			$where_gagal = array('status_passed' => 'gagal', 'flag' => 0);
			$total_gagal = $this->c45_model->tampil_data('dataset_hitung', $where_gagal)->num_rows();

			# HITUNG ENTROPY SELURUH ATRIBUT
			if ($total_data != 0) {
				$entropy_keseluruhan = (-$total_lulus/$total_data) * log($total_lulus/$total_data, 2) + (-$total_gagal/$total_data) * log($total_gagal/$total_data, 2);	
			}
			else {
				$entropy_keseluruhan = 0;
			}

			# TOTAL KASUS PER ATRIBUT
			$where_atribut = array($i->attr => $i->detail, 'flag' => 0);
			$kasus_per_atribut = $this->c45_model->tampil_data('dataset_hitung', $where_atribut)->num_rows();

			# TOTAL KASUS PER ATRIBUT LULUS
			$where_atribut_lulus = array($i->attr => $i->detail, 'status_passed' => 'lulus', 'flag' => 0);
			$total_atribut_lulus = $this->c45_model->tampil_data('dataset_hitung', $where_atribut_lulus)->num_rows();

			# TOTAL KASUS PER ATRIBUT GAGAL
			$where_atribut_gagal = array($i->attr => $i->detail, 'status_passed' => 'gagal', 'flag' => 0);
			$total_atribut_gagal = $this->c45_model->tampil_data('dataset_hitung', $where_atribut_gagal)->num_rows();

			if ($total_atribut_lulus != 0 && $total_atribut_gagal == 0) {
				$fix_temp[$i->attr][$i->detail] = 'lulus';
			}
			elseif ($total_atribut_lulus == 0 && $total_atribut_gagal != 0) {
				$fix_temp[$i->attr][$i->detail] = 'gagal';
			}
			elseif ($total_atribut_lulus == 0 && $total_atribut_gagal == 0) {
				$fix_temp[$i->attr][$i->detail] = '#SKIP';
			}
			else {
				$fix_temp[$i->attr][$i->detail] = 'next_child';
			}

			# ENTROPY PER ATRIBUT
			if ($kasus_per_atribut != 0 && $total_atribut_lulus != 0 && $total_atribut_gagal != 0) {
				$entropy_atribut = (-$total_atribut_lulus / $kasus_per_atribut * log($total_atribut_lulus/$kasus_per_atribut, 2)) + (-$total_atribut_gagal / $kasus_per_atribut * log($total_atribut_gagal/$kasus_per_atribut, 2));
			}
			else {
				$entropy_atribut = 0;
			}

			# GAIN SEMENTARA & SPLIT
			if ($kasus_per_atribut != 0) {
				$temp_x = ($kasus_per_atribut / $total_data * $entropy_atribut);
				$temp_y = -($kasus_per_atribut / $total_data * log($kasus_per_atribut / $total_data, 2));
			}
			else {
				$temp_x = 0;
				$temp_y = 0;
			}
			$gain[$i->attr][$i->detail] = [$temp_x, $temp_y];
		}

		$_attributes = $this->c45_model->tampil_atribut('atribut_detail', $where)->result();
		$gains = [];
		foreach ($_attributes as $i) {
			$temp_gain = 0;
			$temp_split = 0;
			foreach ($gain as $temp_atribut => $temp_detail) {
				if ($i->attr == $temp_atribut) {
					foreach ($temp_detail as $key => $value) {
						$temp_gain += $value[0];
						$temp_split += $value[1];
					}
					if ($temp_split != 0) {
						$gains[$i->attr] = ($entropy_keseluruhan - $temp_gain) / $temp_split;
					}
					else {
						$gains[$i->attr] = 0;
					}
				}
			}
		}

		$max = -999;
		$root = NULL;
		foreach ($gains as $key => $value) {
			if ($value > $max) {
				$max = $value;
				$root = $key;
			}
		}

		$fix = [];
		foreach ($fix_temp as $temp_atribut => $temp_detail) {
			if ($temp_atribut == $root) {
				foreach ($temp_detail as $key => $value) {
					$fix[$key] = $value;
				}
			}
		}

		$que = $this->c45_model->tampil_tree('c45_rule');
		$check = $que->num_rows();
		if ($check == 0) {
			$data = array(
				'atribut' => $root,
				'label' => $root,
				'atribut_cek' => $root.'~',
				'status_hitung' => '#ROOT'
			);
			$id = $this->c45_model->add_rule('c45_rule', $data);

			foreach ($fix as $key => $value) {
				$t = NULL;
				if ($value != 'next_child') {
					$t = $value;
				}

				$data_child = array(
					'atribut' => $root,
					'label' => $key,
					'link' => $id,
					'keputusan' => $t,
					'atribut_cek' => $root.'~',
					'label_cek' => '="'.$key.'"~',
					'status_hitung' => $value
				);
				$this->c45_model->add_rule('c45_rule', $data_child);
			}
			$this->loopTree_C45();
		}
		else {
			$data = array(
				'atribut' => $root,
				'label' => $root,
				'link' => $last_id,
				'atribut_cek' => $last_atribut.$root.'~',
				'status_hitung' => '#ROOT'
			);
			$id = $this->c45_model->add_rule('c45_rule', $data);

			foreach ($fix as $key => $value) {
				$t = NULL;
				if ($value != 'next_child') {
					$t = $value;
				}

				$data_child = array(
					'atribut' => $root,
					'label' => $key,
					'link' => $id,
					'keputusan' => $t,
					'atribut_cek' => $last_atribut.$root.'~',
					'label_cek' => $last_label.'="'.$key.'"~',
					'status_hitung' => $value
				);
				$this->c45_model->add_rule('c45_rule', $data_child);
			}
		}
	}

	/*
	* LOOP TREE
	* ------------------------
	*/
	function loopTree_C45() {
		$tree = $this->c45_model->tampil_tree('c45_rule')->result();

		foreach ($tree as $i) {
			if ($i->status_hitung == 'next_child') {
				# RESET FLAG DATASET & ATRIBUT
				$this->resetData_1();

				# PECAH ATRIBUT DAN LABEL
				$pecah_atribut = explode('~', $i->atribut_cek);
				$pecah_label = explode('~', $i->label_cek);

				# UPDATE FLAG ATRIBUT YANG SUDAH JADI ROOT
				foreach ($pecah_atribut as $key => $value) {
					if ($value != NULL) {
						$data_atribut = array('flag' => 1);
						$where_atribut = array('attr' => $value);
						$this->c45_model->update_data('atribut_detail', $data_atribut, $where_atribut);
					}
				}

				# FETCH DATASET SESUAI ATRIBUT YANG DIDAPAT
				$str = '';
				foreach ($pecah_atribut as $key_1 => $value_1) {
					foreach ($pecah_label as $key_2 => $value_2) {
						if ($key_1 == $key_2 && $value_1 != NULL) {
							$str .= $value_1.$value_2.'AND ';
						}
					}
				}
				$str=rtrim($str,"AND ");
				$this->db->query('UPDATE dataset_hitung SET flag = 0 WHERE '.$str);

				# HITUNG C4.5
				$this->_hitungC45($i->id, $i->atribut_cek, $i->label_cek);

				# UPDATE STATUS ROOT YANG SUDAH DI HITUNG
				$data = array('status_hitung' => 'stop_child');
				$where = array('id' => $i->id);
				$this->c45_model->update_rule('c45_rule', $data, $where);
			}
		}
	}

	/*
	* DATA TRAINING ALGORITMA C4.5
	* ---------------------------
	*/
	function training_C45(array $data, $check) {
		if ($check == 'ht_dataset') {
			$tree = $this->c45_model->tampil_tree('c45_rule')->result();
		}
		if ($check == 'ht_akurasi') {
			$tree = $this->c45_model->tampil_tree('akurasi_c45_rule')->result();
		}

		$stop = FALSE;
		$hasil = NULL;
		foreach ($tree as $i) {
			if ($stop == FALSE) {
				foreach ($data as $key => $value) {
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_cek);

					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL && $key == $i->atribut && $i->label == $value && $i->keputusan != NULL) {
								$hasil = $i->keputusan;
								$stop = TRUE;
							}
						}
					}
				}
			}
		}
		return $hasil;
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
		$this->cart_model->update_atribut_detail('atribut_detail', $where_atribut, $data_atribut);
	}

	/*
	* HITUNG AKURASI
	* -------------------------------------
	*/
	function hitung_akurasi_cart() {
		# GANTI STATUS DATASET
		$_dataset = array('flag' => 0);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
		# GANTI STATUS ATRIBUT
		$data_atribut = array( 'flag' => 0);
		$where_atribut = array( 'id !=' => 0);
		$this->cart_model->update_atribut_detail('atribut_detail', $where_atribut, $data_atribut);

		$que = $this->akurasi_model->tampil_dataset('dataset_hitung');
		$data = $que->result();
		$total_data = $que->num_rows();

		$k = 10;
		$partisi = $total_data / $k;
		$end = $partisi;

		$data_fold = $hasil = [];
		$stop = 0;
		# MASUKKAN DATA U/ SETIAP FOLD
		for ($i=0; $i < $k; $i++) { 
			foreach ($data as $j) {
				if ($stop < $end) {
					$where = array('id' => $stop+1);
					$row = $this->akurasi_model->get_row('dataset_hitung', $where)->row_array();

					$data_fold[$i][$stop] =array(
						$row['nama_lengkap'],
						$row['age'],
						$row['experience'],
						$row['last_education'],
						$row['status'],
						$row['total_ability'],
						$row['nilai_online'],
						$row['nilai_f2f'],
						$row['nilai_sikap'],
						$row['status_passed']
					);
					$stop++;
				}
			}
			$end+=$partisi;
		}

		# PISAHKAN DATA TRAINING DAN DATA HITUNG
		for ($i=0; $i < $k; $i++) { 
			$testing = [];
			$this->akurasi_model->truncate_db('akurasi_data');
			$this->akurasi_model->truncate_db('akurasi_cart_rule');

			foreach ($data_fold as $key_1 => $value_1) {
				if ($i == $key_1) {
					foreach ($value_1 as $key_2 => $value_2) {
						$testing[] = array(
							$value_2[0],
							$value_2[1],
							$value_2[2],
							$value_2[3],
							$value_2[4],
							$value_2[5],
							$value_2[6],
							$value_2[7],
							$value_2[8],
							$value_2[9]
						);
					}
				}
				else {
					foreach ($value_1 as $key_2 => $value_2) {
						$in = array(
							'id' => null,
							'nama_lengkap' => $value_2[0],
							'age' => $value_2[1],
							'experience' => $value_2[2],
							'last_education' => $value_2[3],
							'status' => $value_2[4],
							'total_ability' => $value_2[5],
							'nilai_online' => $value_2[6],
							'nilai_f2f' => $value_2[7],
							'nilai_sikap' => $value_2[8],
							'flag' => 0,
							'status_passed' => $value_2[9]
						);
						$this->akurasi_model->add_data('akurasi_data', $in);
					}
				}
			}

			$this->akurasi__hitungCart(NULL, NULL, NULL, NULL);
			# CEK APAKAH MASIH ADA TREE YANG BISA DI HITUNG
			$total_next = $this->cart_model->total_next('akurasi_cart_rule', array('status_hitung' => 'next'))->num_rows();
			while ($total_next != 0) {
				$this->akurasi__loopTree();
				$total_next = $this->cart_model->total_next('akurasi_cart_rule', array('status_hitung' => 'next'))->num_rows();
			}

			foreach ($testing as $key => $value) {
				$tst = array(
					'age'				=> $value[1],
					'experience'		=> $value[2],
					'last_education'	=> $value[3],
					'status'			=> $value[4],
					'total_ability'		=> $value[5],
					'nilai_online'		=> $value[6],
					'nilai_f2f'			=> $value[7],
					'nilai_sikap'		=> $value[8]
				);

				$hasil[$i][] = array(
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
					$this->training_Cart($tst, 'ht_akurasi')
				);
			}
		}

		# $tp = $fn = $tn = $fp = $akurasi = 0;
		# foreach ($hasil as $key_1 => $value_1) {
		# 	foreach ($value_1 as $key_2 => $value_2) {
		# 		if ($value_2[9] == 'lulus' && $value_2[10] == 'lulus') {
		# 			$tp++;
		# 		}
		# 		elseif ($value_2[9] == 'lulus' && $value_2[10] == 'gagal') {
		# 			$fn++;
		# 		}
		# 		elseif ($value_2[9] == 'gagal' && $value_2[10] == 'lulus') {
		# 			$fp++;
		# 		}
		# 		elseif ($value_2[9] == 'gagal' && $value_2[10] == 'gagal') {
		# 			$tn++;
		# 		}
		# 	}
		# 	$akurasi += ($tp + $tn) / ($tp + $tn + $fp + $fn);
		# }
		# $akurasi = $akurasi / $k * 100;
		# return $akurasi;
		$this->session->set_userdata('akurasi_cart', $hasil);
	}

	/*
	* ALGORITMA CART
	* --------------
	*/
	function akurasi__hitungCart($id, $last_atribut, $label, $keputusan) {
		$where = array( 'flag' => 0 );
		$data_hitung = $this->cart_model->tampil_data('akurasi_data', $where)->result();
		$total_data = $this->cart_model->tampil_data('akurasi_data', $where)->num_rows();

		$_atribut = array(
			'atribut_detail.flag' => 0
		);
		$atribut = $this->cart_model->tampil_atribut_detail('atribut_detail', $_atribut)->result();

		$temp_fix_keputusan_left = $temp_fix_keputusan_right = $pl = $pr = $pj_l_lulus = $pj_l_gagal = $pj_r_lulus = $pl_pr_2 = $q = $hasil = [];
		$skip_kiri = $skip_kanan = [];

		foreach ($atribut as $i) {
			$where_left = array(
				$i->attr => $i->detail,
				'flag' => 0
			);
			$where_right = array(
				$i->attr.' !=' => $i->detail,
				'flag' => 0
			);
			$x = $this->cart_model->tampil_data('akurasi_data', $where_left)->num_rows();
			$y = $this->cart_model->tampil_data('akurasi_data', $where_right)->num_rows();

			if ($total_data != 0) {
				$pl[$i->attr][] = $x/$total_data;
				$pr[$i->attr][] = $y/$total_data;
			}
			else {
				$pl[$i->attr][] = 0;
				$pr[$i->attr][] = 0;	
			}

			# LULUS ATAU GAGAL
			$where_left_lulus = array(
				$i->attr => $i->detail,
				'status_passed' => 'lulus',
				'flag' => 0
			);
			$where_left_gagal = array(
				$i->attr => $i->detail,
				'status_passed' => 'gagal',
				'flag' => 0
			);
			if ($x != 0) {
				$a_l = $this->cart_model->tampil_data('akurasi_data', $where_left_lulus)->num_rows()/$x;
				$b_l = $this->cart_model->tampil_data('akurasi_data', $where_left_gagal)->num_rows()/$x;
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
			if ($a_l == 0 && $b_l == 0) {
				$skip_kiri[$i->detail] = '#SKIP';
			}
			# --------------------------------------------------
			$where_right_lulus = array(
				$i->attr.' !=' => $i->detail,
				'status_passed' => 'lulus',
				'flag' => 0
			);
			$where_right_gagal = array(
				$i->attr.' !=' => $i->detail,
				'status_passed' => 'gagal',
				'flag' => 0
			);
			if ($y != 0) {
				$a_r = $this->cart_model->tampil_data('akurasi_data', $where_right_lulus)->num_rows()/$y;
				$b_r = $this->cart_model->tampil_data('akurasi_data', $where_right_gagal)->num_rows()/$y;
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
			if ($a_r == 0 && $b_r == 0) {
				$skip_kanan[$i->detail] = '#SKIP';
			}

			$dua = 0;
			if ($total_data != 0) {
				$dua = 2 * ($x/$total_data) * ($y/$total_data);
			}
			$pl_pr_2[] = $dua;

			$tiga = abs($a_l-$a_r)+abs($b_l-$b_r);
			$q[] = $tiga;

			$hasil[$i->attr][$i->detail] = $dua*$tiga;
		}

		$root = $root_id = $left = $right = NULL;
		$maxx = -999;
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

		$fix_left = $fix_right = [];
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

		$lanjut_kiri = '="'.$left.'"';
		$lab_kiri = $label.'~="'.$left.'"~';
		foreach ($skip_kiri as $key => $value) {
			if ($key == $left) {
				$lanjut_kiri = NULL;
				$lab_kiri = '';
			}
		}

		$lanjut_kanan = '!="'.$right.'"';
		$lab_kanan = $label.'~'.'!="'.$right.'"~';
		foreach ($skip_kanan as $key => $value) {
			if ($key == $right) {
				$lanjut_kanan = NULL;
				$lab_kanan = '';
			}
		}

		$kpt = 'next';
		if ($maxx == 0) {
			$kpt = '#DataTidakJelas';
		}
		if ($total_data == 0) {
			$kpt = '#SKIP';
		}

		# CEK APAKAH RULE KOSONG
		$rule = $this->cart_model->cek_rule('akurasi_cart_rule')->num_rows();
		if ($rule == 0) {
			$root_ar = array(
				'atribut' => $root,
				'label' => $root,
				'left_keputusan' => $lanjut_kiri,
				'right_keputusan' => $lanjut_kanan,
				'status_hitung' => 'root'
			);
			$id = $this->cart_model->insert_rule('akurasi_cart_rule', $root_ar);
			$this->akurasi_loopTree();
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
					$this->cart_model->insert_rule('akurasi_cart_rule', $left_ar);
				}
			}
			if ($fix_left == NULL) {
				$left_ar = array(
					'atribut' => $root,
					'label' => $keputusan,
					'left_keputusan' => $lanjut_kiri,
					'keputusan' => NULL,
					'link' => $id,
					'status_hitung' => $kpt,
					'atribut_cek' => $last_atribut.'~'.$root.'~',
					'label_kiri' => $lab_kiri,
				);
				$in_check = $this->cart_model->insert_rule('akurasi_cart_rule', $left_ar);
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
					$this->cart_model->insert_rule('akurasi_cart_rule', $right_ar);
				}
			}
			if ($fix_right == NULL) {
				if ($in_check != 0) {
					$right_ar = array(
						'right_keputusan' => $lanjut_kanan,
						'label_kanan' => $lab_kanan,
					);
					$yy = array( 'id' => $in_check );
					$in_check = $this->cart_model->update_rule('akurasi_cart_rule', $yy, $right_ar);
				}
				else {
					$right_ar = array(
						'atribut' => $root,
						'label' => $keputusan,
						'right_keputusan' => '!="'.$right.'"',
						'keputusan' => NULL,
						'link' => $id,
						'status_hitung' => $kpt,
						'atribut_cek' => $last_atribut.'~'.$root.'~',
						'label_kanan' => $lab_kanan,
					);
					$in_check = $this->cart_model->insert_rule('akurasi_cart_rule', $right_ar);
				}
			}
		}
	}

	/*
	* INSERT TREE PERTAMA KALI DAN NEXT HITUNG
	* ----------------------------------------
	*/
	function akurasi_loopTree() {
		$tree = $this->cart_model->tampil_tree('akurasi_cart_rule')->result();
		foreach ($tree as $i) {
			if ($i->status_hitung == 'root') {
				# HITUNG ROOT KIRI
				$this->akurasi_resetData();
				$data = array( 'flag' => 0 );
				$l = '';
				$l .= $i->label.$i->left_keputusan;
				$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$l);
				$this->akurasi__hitungCart($i->id, $i->atribut, $i->left_keputusan, $i->left_keputusan);

				# HITUNG ROOT KANAN
				$this->akurasi_resetData();
				$r = '';
				$r .= $i->label.$i->right_keputusan;
				$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$r);
				$this->akurasi__hitungCart($i->id, $i->atribut, $i->right_keputusan, $i->right_keputusan);
				$this->akurasi__loopTree();
			}
		}
	}
	/*
	* CEK TREE YANG SUDAH DI BUAT PERTAMA KALI
	* ----------------------------------------
	*/
	function akurasi__loopTree() {
		$tree = $this->cart_model->tampil_tree('akurasi_cart_rule')->result();
		$atr = $this->cart_model->tampil_atribut('atribut_detail')->result();

		foreach ($tree as $i) {
			if ($i->status_hitung == 'next') {
				if ($i->left_keputusan != NULL && $i->right_keputusan != NULL) {
					# HITUNG ROOT KIRI
					$this->akurasi_resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$newarraynama);
					$this->akurasi__hitungCart($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# HITUNG ROOT KANAN
					$this->akurasi_resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$newarraynama);
					$this->akurasi__hitungCart($i->id, $i->atribut_cek, $i->label_kanan, $i->right_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				elseif ($i->left_keputusan != NULL && $i->right_keputusan == NULL) {
					# HITUNG ROOT KIRI
					$this->akurasi_resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kiri);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) { 
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$newarraynama);
					$this->akurasi__hitungCart($i->id, $i->atribut_cek, $i->label_kiri, $i->left_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				elseif ($i->left_keputusan == NULL && $i->right_keputusan != NULL) {
					# HITUNG ROOT KANAN
					$this->akurasi_resetData_1();
					$str = '';
					$pecah_atribut = explode('~', $i->atribut_cek);
					$pecah_label = explode('~', $i->label_kanan);

					foreach ($atr as $j) {
						foreach ($pecah_atribut as $key_1 => $value_1) {
							foreach ($pecah_label as $key_2 => $value_2) {
								if ($j->attr == $value_1 && $j->detail == $value_2 && $value_1 != NULL) {
									$_zz = array( 'flag' => 1 );
									$_tt = array( 'attr' => $value );
									$this->cart_model->update_atribut_detail('atribut_detail', $_tt, $_zz);
								}
							}
						}
					}
					foreach ($pecah_atribut as $key_1 => $value_1) {
						foreach ($pecah_label as $key_2 => $value_2) {
							if ($key_1 == $key_2 && $value_1 != NULL) {
								$str .= $value_1.$value_2.' AND ';
							}
						}
					}
					$newarraynama=rtrim($str,"AND ");
					$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$newarraynama);
					$this->akurasi__hitungCart($i->id, $i->atribut_cek, $i->label_kanan, $i->right_keputusan);

					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
				else {
					# STOP STATUS KETIKA LEFT ATAURIGHT SUDAH DI HITUNG
					$this->db->query('UPDATE akurasi_cart_rule SET status_hitung = "stop" WHERE id = '.$i->id);
				}
			}
		}
	}

	/*
	* HITUNG AKURASI
	* -------------------------------------
	*/
	function hitung_akurasi_c45() {
		# GANTI STATUS DATASET
		$_dataset = array('flag' => 0);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('dataset_hitung', $_where, $_dataset);
		# GANTI STATUS ATRIBUT
		$data_atribut = array( 'flag' => 0);
		$where_atribut = array( 'id !=' => 0);
		$this->cart_model->update_atribut_detail('atribut_detail', $where_atribut, $data_atribut);

		$que = $this->akurasi_model->tampil_dataset('dataset_hitung');
		$data = $que->result();
		$total_data = $que->num_rows();

		$k = 10;
		$partisi = $total_data / $k;
		$end = $partisi;

		$data_fold = $hasil = [];
		$stop = 0;
		# MASUKKAN DATA U/ SETIAP FOLD
		for ($i=0; $i < $k; $i++) { 
			foreach ($data as $j) {
				if ($stop < $end) {
					$where = array('id' => $stop+1);
					$row = $this->akurasi_model->get_row('dataset_hitung', $where)->row_array();

					$data_fold[$i][$stop] =array(
						$row['nama_lengkap'],
						$row['age'],
						$row['experience'],
						$row['last_education'],
						$row['status'],
						$row['total_ability'],
						$row['nilai_online'],
						$row['nilai_f2f'],
						$row['nilai_sikap'],
						$row['status_passed']
					);
					$stop++;
				}
			}
			$end+=$partisi;
		}

		# PISAHKAN DATA TRAINING DAN DATA HITUNG
		for ($i=0; $i < $k; $i++) { 
			$testing = [];
			$this->akurasi_model->truncate_db('akurasi_data');
			$this->akurasi_model->truncate_db('akurasi_c45_rule');

			foreach ($data_fold as $key_1 => $value_1) {
				if ($i == $key_1) {
					foreach ($value_1 as $key_2 => $value_2) {
						$testing[] = array(
							$value_2[0],
							$value_2[1],
							$value_2[2],
							$value_2[3],
							$value_2[4],
							$value_2[5],
							$value_2[6],
							$value_2[7],
							$value_2[8],
							$value_2[9]
						);
					}
				}
				else {
					foreach ($value_1 as $key_2 => $value_2) {
						$in = array(
							'id' => null,
							'nama_lengkap' => $value_2[0],
							'age' => $value_2[1],
							'experience' => $value_2[2],
							'last_education' => $value_2[3],
							'status' => $value_2[4],
							'total_ability' => $value_2[5],
							'nilai_online' => $value_2[6],
							'nilai_f2f' => $value_2[7],
							'nilai_sikap' => $value_2[8],
							'flag' => 0,
							'status_passed' => $value_2[9]
						);
						$this->akurasi_model->add_data('akurasi_data', $in);
					}
				}
			}
			$this->akurasi__hitungC45(NULL, NULL, NULL);

			# CEK APAKAH MASIH ADA TREE YANG BISA DI HITUNG
			$total_next = $this->c45_model->tampil_data('akurasi_c45_rule', array('status_hitung' => 'next_child'))->num_rows();
			while ($total_next != 0) {
				$this->akurasi_loopTree_C45();
				$total_next = $this->c45_model->tampil_data('akurasi_c45_rule', array('status_hitung' => 'next_child'))->num_rows();
			}

			foreach ($testing as $key => $value) {
				$tst = array(
					'age'				=> $value[1],
					'experience'		=> $value[2],
					'last_education'	=> $value[3],
					'status'			=> $value[4],
					'total_ability'		=> $value[5],
					'nilai_online'		=> $value[6],
					'nilai_f2f'			=> $value[7],
					'nilai_sikap'		=> $value[8]
				);

				$hasil[$i][] = array(
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
					$this->training_C45($tst, 'ht_akurasi')
				);
			}
		}
		# $tp = $fn = $tn = $fp = $akurasi = 0;
		# foreach ($hasil as $key_1 => $value_1) {
		# 	foreach ($value_1 as $key_2 => $value_2) {
		# 		if ($value_2[9] == 'lulus' && $value_2[10] == 'lulus') {
		# 			$tp++;
		# 		}
		# 		elseif ($value_2[9] == 'lulus' && $value_2[10] == 'gagal') {
		# 			$fn++;
		# 		}
		# 		elseif ($value_2[9] == 'gagal' && $value_2[10] == 'lulus') {
		# 			$fp++;
		# 		}
		# 		elseif ($value_2[9] == 'gagal' && $value_2[10] == 'gagal') {
		# 			$tn++;
		# 		}
		# 	}
		# 	$akurasi += ($tp + $tn) / ($tp + $tn + $fp + $fn);
		# }
		# $akurasi = $akurasi / $k * 100;
		# return $akurasi;
		$this->session->set_userdata('akurasi_c45', $hasil);
	}

	/*
	* HITUNG ALGORITMA C4.5
	* ---------------------
	*/
	function akurasi__hitungC45($last_id, $last_atribut, $last_label) {
		$where = array('flag' => 0);
		$que = $this->c45_model->tampil_data('akurasi_data', $where);

		$data = $que->result();
		$total_data = $que->num_rows();
		$attributes = $this->c45_model->tampil_atribut_detail('atribut_detail', $where)->result();
		
		$entropy_keseluruhan = $entropy_atribut = NULL;
		$gain = $fix_temp = [];

		foreach ($attributes as $i) {
			# TOTAL DATA LULUS
			$where_lulus = array('status_passed' => 'lulus', 'flag' => 0);
			$total_lulus = $this->c45_model->tampil_data('akurasi_data', $where_lulus)->num_rows();
			# TOTAL DATA GAGAL
			$where_gagal = array('status_passed' => 'gagal', 'flag' => 0);
			$total_gagal = $this->c45_model->tampil_data('akurasi_data', $where_gagal)->num_rows();

			# HITUNG ENTROPY SELURUH ATRIBUT
			if ($total_data != 0) {
				$entropy_keseluruhan = (-$total_lulus/$total_data) * log($total_lulus/$total_data, 2) + (-$total_gagal/$total_data) * log($total_gagal/$total_data, 2);	
			}
			else {
				$entropy_keseluruhan = 0;
			}

			# TOTAL KASUS PER ATRIBUT
			$where_atribut = array($i->attr => $i->detail, 'flag' => 0);
			$kasus_per_atribut = $this->c45_model->tampil_data('akurasi_data', $where_atribut)->num_rows();

			# TOTAL KASUS PER ATRIBUT LULUS
			$where_atribut_lulus = array($i->attr => $i->detail, 'status_passed' => 'lulus', 'flag' => 0);
			$total_atribut_lulus = $this->c45_model->tampil_data('akurasi_data', $where_atribut_lulus)->num_rows();

			# TOTAL KASUS PER ATRIBUT GAGAL
			$where_atribut_gagal = array($i->attr => $i->detail, 'status_passed' => 'gagal', 'flag' => 0);
			$total_atribut_gagal = $this->c45_model->tampil_data('akurasi_data', $where_atribut_gagal)->num_rows();

			if ($total_atribut_lulus != 0 && $total_atribut_gagal == 0) {
				$fix_temp[$i->attr][$i->detail] = 'lulus';
			}
			elseif ($total_atribut_lulus == 0 && $total_atribut_gagal != 0) {
				$fix_temp[$i->attr][$i->detail] = 'gagal';
			}
			elseif ($total_atribut_lulus == 0 && $total_atribut_gagal == 0) {
				$fix_temp[$i->attr][$i->detail] = '#SKIP';
			}
			else {
				$fix_temp[$i->attr][$i->detail] = 'next_child';
			}

			# ENTROPY PER ATRIBUT
			if ($kasus_per_atribut != 0 && $total_atribut_lulus != 0 && $total_atribut_gagal != 0) {
				$entropy_atribut = (-$total_atribut_lulus / $kasus_per_atribut * log($total_atribut_lulus/$kasus_per_atribut, 2)) + (-$total_atribut_gagal / $kasus_per_atribut * log($total_atribut_gagal/$kasus_per_atribut, 2));
			}
			else {
				$entropy_atribut = 0;
			}

			# GAIN SEMENTARA & SPLIT

			if ($kasus_per_atribut != 0) {
				$temp_x = ($kasus_per_atribut / $total_data * $entropy_atribut);
				$temp_y = -($kasus_per_atribut / $total_data * log($kasus_per_atribut / $total_data, 2));
			}
			else {
				$temp_x = 0;
				$temp_y = 0;
			}
			$gain[$i->attr][$i->detail] = [$temp_x, $temp_y];
		}

		$_attributes = $this->c45_model->tampil_atribut('atribut_detail', $where)->result();
		$gains = [];
		foreach ($_attributes as $i) {
			$temp_gain = 0;
			$temp_split = 0;
			foreach ($gain as $temp_atribut => $temp_detail) {
				if ($i->attr == $temp_atribut) {
					foreach ($temp_detail as $key => $value) {
						$temp_gain += $value[0];
						$temp_split += $value[1];
					}
					if ($temp_split != 0) {
						$gains[$i->attr] = ($entropy_keseluruhan - $temp_gain) / $temp_split;
					}
					else {
						$gains[$i->attr] = 0;
					}
				}
			}
		}

		$max = -999;
		$root = NULL;
		foreach ($gains as $key => $value) {
			if ($value > $max) {
				$max = $value;
				$root = $key;
			}
		}

		$fix = [];
		foreach ($fix_temp as $temp_atribut => $temp_detail) {
			if ($temp_atribut == $root) {
				foreach ($temp_detail as $key => $value) {
					$fix[$key] = $value;
				}
			}
		}

		$que = $this->c45_model->tampil_tree('akurasi_c45_rule');
		$check = $que->num_rows();
		if ($check == 0) {
			$data = array(
				'atribut' => $root,
				'label' => $root,
				'atribut_cek' => $root.'~',
				'status_hitung' => '#ROOT'
			);
			$id = $this->c45_model->add_rule('akurasi_c45_rule', $data);

			foreach ($fix as $key => $value) {
				$t = NULL;
				if ($value != 'next_child') {
					$t = $value;
				}

				$data_child = array(
					'atribut' => $root,
					'label' => $key,
					'link' => $id,
					'keputusan' => $t,
					'atribut_cek' => $root.'~',
					'label_cek' => '="'.$key.'"~',
					'status_hitung' => $value
				);
				$this->c45_model->add_rule('akurasi_c45_rule', $data_child);
			}
			$this->akurasi_loopTree_C45();
		}
		else {
			$data = array(
				'atribut' => $root,
				'label' => $root,
				'link' => $last_id,
				'atribut_cek' => $last_atribut.$root.'~',
				'status_hitung' => '#ROOT'
			);
			$id = $this->c45_model->add_rule('akurasi_c45_rule', $data);

			foreach ($fix as $key => $value) {
				$t = NULL;
				if ($value != 'next_child') {
					$t = $value;
				}

				$data_child = array(
					'atribut' => $root,
					'label' => $key,
					'link' => $id,
					'keputusan' => $t,
					'atribut_cek' => $last_atribut.$root.'~',
					'label_cek' => $last_label.'="'.$key.'"~',
					'status_hitung' => $value
				);
				$this->c45_model->add_rule('akurasi_c45_rule', $data_child);
			}
		}
	}

	/*
	* LOOP TREE
	* ------------------------
	*/
	function akurasi_loopTree_C45() {
		$tree = $this->c45_model->tampil_tree('akurasi_c45_rule')->result();

		foreach ($tree as $i) {
			if ($i->status_hitung == 'next_child') {
				# RESET FLAG DATASET & ATRIBUT
				$this->akurasi_resetData_1();

				# PECAH ATRIBUT DAN LABEL
				$pecah_atribut = explode('~', $i->atribut_cek);
				$pecah_label = explode('~', $i->label_cek);

				# UPDATE FLAG ATRIBUT YANG SUDAH JADI ROOT
				foreach ($pecah_atribut as $key => $value) {
					if ($value != NULL) {
						$data_atribut = array('flag' => 1);
						$where_atribut = array('attr' => $value);
						$this->c45_model->update_data('atribut_detail', $data_atribut, $where_atribut);
					}
				}

				# FETCH DATASET SESUAI ATRIBUT YANG DIDAPAT
				$str = '';
				foreach ($pecah_atribut as $key_1 => $value_1) {
					foreach ($pecah_label as $key_2 => $value_2) {
						if ($key_1 == $key_2 && $value_1 != NULL) {
							$str .= $value_1.$value_2.'AND ';
						}
					}
				}
				$str=rtrim($str,"AND ");
				$this->db->query('UPDATE akurasi_data SET flag = 0 WHERE '.$str);

				# HITUNG C4.5
				$this->akurasi__hitungC45($i->id, $i->atribut_cek, $i->label_cek);

				# UPDATE STATUS ROOT YANG SUDAH DI HITUNG
				$data = array('status_hitung' => 'stop_child');
				$where = array('id' => $i->id);
				$this->c45_model->update_rule('akurasi_c45_rule', $data, $where);
			}
		}
	}

	/*
	* RESET FLAG TABEL DATASET
	* ------------------------
	*/
	function akurasi_resetData() {
		$_dataset = array('flag' => 1);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('akurasi_data', $_where, $_dataset);
	}
	/*
	* RESET FLAG TABEL DATASET & ATRIBUT
	* ----------------------------------
	*/
	function akurasi_resetData_1() {
		$_dataset = array('flag' => 1);
		$_where = array('id !=' => 0);
		$this->cart_model->update_dataset('akurasi_data', $_where, $_dataset);

		# GANTI STATUS ATRIBUT
		$data_atribut = array( 'flag' => 0 );
		$where_atribut = array( 'id !=' => 0 );
		$this->cart_model->update_atribut_detail('atribut_detail', $where_atribut, $data_atribut);
	}
}