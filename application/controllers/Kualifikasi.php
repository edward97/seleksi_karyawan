<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Kualifikasi
 */
class Kualifikasi extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('kualifikasi_model');
		$this->load->model('setting_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['ability'] = $this->setting_model->tampil_ability()->result();
			$data['atribut'] = $this->setting_model->tampil_atribut()->result();
			$data['job'] = $this->setting_model->tampil_job()->result();
			$data['judul'] = 'Input Kualifikasi';

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_input_kualifikasi');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function list() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['ability'] = $this->kualifikasi_model->tampil_required_ability()->result();
			$data['list'] = $this->kualifikasi_model->tampil_kualifikasi()->result();
			$data['judul'] = 'List Kualifikasi';

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_list_kualifikasi');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function save_act() {
		$nama_kualifikasi = $this->input->post('nm_kualifikasi');
		$divisi = $this->input->post('divisi');

		$data_kualifikasi = array(
			'id_std' => null,
			'nm_std' => $nama_kualifikasi,
			'id_job' => $divisi
		);
		$std_qua = $this->kualifikasi_model->add_kualifikasi('standard_qualification', $data_kualifikasi);

		$target['tar'] = $this->input->post('kemampuan'); // array
		// print_r($target);
		
		// array 2D
		$val = array();
		foreach ($target['tar'] as $i) {
			array_push($val, array(
				'id' =>  null,
				'id_ability' => $i,
				'id_job' => $divisi,
				'id_std' => $std_qua
			));
		}
		$this->kualifikasi_model->add_required('required_ability', $val);

		// $jumlah_kemampuan_1 = $this->input->post('jlh_kemampuan1');
		// $jumlah_kemampuan_2 = $this->input->post('jlh_kemampuan2');
		// $jumlah_kemampuan_3 = $this->input->post('jlh_kemampuan3');
		// $jumlah_kemampuan_4 = $this->input->post('jlh_kemampuan4');
		// $data1 = array(
		// 	array(
		// 		'id' => null,
		// 		'kemampuan' => $jumlah_kemampuan_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'kemampuan' => $jumlah_kemampuan_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'kemampuan' => $jumlah_kemampuan_3,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'kemampuan' => $jumlah_kemampuan_4,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_kemampuan('standard_ability', $data1);

		// $range_umur_1 = $this->input->post('range_umur1');
		// $range_umur_2 = $this->input->post('range_umur2');
		// $range_umur_3 = $this->input->post('range_umur3');
		// $range_umur_4 = $this->input->post('range_umur4');
		// $data2 = array(
		// 	array(
		// 		'id' => null,
		// 		'umur' => $range_umur_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'umur' => $range_umur_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'umur' => $range_umur_3,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'umur' => $range_umur_4,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_umur('standard_age', $data2);

		// $pengalaman_1 = $this->input->post('pengalaman1');
		// $pengalaman_2 = $this->input->post('pengalaman2');
		// $pengalaman_3 = $this->input->post('pengalaman3');
		// $pengalaman_4 = $this->input->post('pengalaman4');
		// $data3 = array(
		// 	array(
		// 		'id' => null,
		// 		'pengalaman' => $pengalaman_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'pengalaman' => $pengalaman_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'pengalaman' => $pengalaman_3,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'pengalaman' => $pengalaman_4,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_pengalaman('standard_experience', $data3);

		// $status_1 = $this->input->post('status1');
		// $status_2 = $this->input->post('status2');
		// $data4 = array(
		// 	array(
		// 		'id' => null,
		// 		'status' => $status_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'status' => $status_2,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_status('standard_status', $data4);

		// $pendidikan_1 = $this->input->post('pendidikan1');
		// $pendidikan_2 = $this->input->post('pendidikan2');
		// $pendidikan_3 = $this->input->post('pendidikan3');
		// $pendidikan_4 = $this->input->post('pendidikan4');
		// $data5 = array(
		// 	array(
		// 		'id' => null,
		// 		'pendidikan' => $pendidikan_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'pendidikan' => $pendidikan_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'pendidikan' => $pendidikan_3,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'pendidikan' => $pendidikan_4,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_pendidikan('standard_education', $data5);

		// $nilai_online_1 = $this->input->post('n_online1');
		// $nilai_online_2 = $this->input->post('n_online2');
		// $nilai_online_3 = $this->input->post('n_online3');
		// $nilai_online_4 = $this->input->post('n_online4');
		// $nilai_online_5 = $this->input->post('n_online5');
		// $nilai_online_6 = $this->input->post('n_online6');
		// $data6 = array(
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_3,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_4,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_5,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_6,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_online('standard_online', $data6);


		// $nilai_f2f_1 = $this->input->post('n_langsung1');
		// $nilai_f2f_2 = $this->input->post('n_langsung2');
		// $nilai_f2f_3 = $this->input->post('n_langsung3');
		// $nilai_f2f_4 = $this->input->post('n_langsung4');
		// $nilai_f2f_5 = $this->input->post('n_langsung5');
		// $nilai_f2f_6 = $this->input->post('n_langsung6');
		// $data7 = array(
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_f2f_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_online_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_f2f_3,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_f2f_4,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_f2f_5,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_f2f_6,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_f2f('standard_f2f', $data7);

		// $nilai_sikap_1 = $this->input->post('n_sikap1');
		// $nilai_sikap_2 = $this->input->post('n_sikap2');
		// $nilai_sikap_3 = $this->input->post('n_sikap3');
		// $data8 = array(
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_sikap_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_sikap_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'nilai' => $nilai_sikap_3,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_sikap('standard_sikap', $data8);

		// $buta_warna_1 = $this->input->post('b_warna1');
		// $buta_warna_2 = $this->input->post('b_warna2');
		// $buta_warna_3 = $this->input->post('b_warna3');
		// $data9 = array(
		// 	array(
		// 		'id' => null,
		// 		'buta_warna' => $buta_warna_1,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'buta_warna' => $buta_warna_2,
		// 		'id_std' => $std_qua,
		// 	),
		// 	array(
		// 		'id' => null,
		// 		'buta_warna' => $buta_warna_3,
		// 		'id_std' => $std_qua,
		// 	)
		// );
		// $this->kualifikasi_model->add_buta_warna('standard_buta_warna', $data9);
		$this->session->set_flashdata('msg', '<div class="alert alert-success">Standar Kualifikasi berhasil ditambah!</div>');
		redirect('sesi/list');
	}
}