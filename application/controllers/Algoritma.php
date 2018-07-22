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

	function hitungC45($id) {
		$this->load->library('C45');

		// $data  = [
		// 	["> 2 tahun",			'pasca',	'90-100',	'baik',			'lulus'],
		// 	["tidak pengalaman",	'sarjana',	'80-89',	'cukup baik',	'lulus'],
		// 	["> 2 tahun",			'sma',		'70-79',	'cukup baik',	'gagal'],
		// 	["tidak pengalaman",	'pasca',	'70-79',	'baik',			'lulus'],
		// 	["> 2 tahun",			'pasca',	'80-89',	'cukup baik',	'gagal'],
		// 	["1-2 tahun",			'akademi',	'70-79',	'cukup baik',	'lulus'],
		// 	["> 2 tahun",			'sarjana',	'70-79',	'baik',			'lulus'],
		// 	["1-2 tahun",			'sma',		'70-79',	'baik', 		'gagal'],
		// 	["1-2 tahun",			'sma',		'70-79',	'sangat baik',	'gagal'],
		// 	["> 2 tahun",			'pasca',	'90-100',	'cukup baik',	'gagal'],
		// ];

		$attributes = [1 => "pengalaman", 2 => "pendidikan", 3 => "nilai ujian", 4 => "nilai sikap"];

		$dataset = $this->dataset_model->tampil_dataset()->result();

		$data_arr = array();
		foreach ($dataset as $i) {
			if ($i->experience == 0)
				$pengalaman = 'tidak pengalaman';
			if ($i->experience <= 2)
				$pengalaman = '1-2 tahun';
			if ($i->experience > 2)
				$pengalaman = '> 2 tahun';

			if ($i->nilai_online >= 90 && $i->nilai_online <= 100)
				$nilai_online = '90-100';
			if ($i->nilai_online >= 80 && $i->nilai_online <= 89)
				$nilai_online = '80-89';
			if ($i->nilai_online >= 70 && $i->nilai_online <= 79)
				$nilai_online = '70-79';


			$data_arr[] = [$pengalaman, $i->last_education, $nilai_online, $i->nilai_sikap, $i->status_passed];
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
			if ($i->experience == 0)
				$pengalaman = 'tidak pengalaman';
			if ($i->experience <= 2)
				$pengalaman = '1-2 tahun';
			if ($i->experience > 2)
				$pengalaman = '> 2 tahun';

			if ($i->nilai_online >= 90 && $i->nilai_online <= 100)
				$nilai_online = '90-100';
			if ($i->nilai_online >= 80 && $i->nilai_online <= 89)
				$nilai_online = '80-89';
			if ($i->nilai_online >= 70 && $i->nilai_online <= 79)
				$nilai_online = '70-79';

			$testing = [$pengalaman, $i->last_education, $nilai_online, $i->nilai_sikap];

			$hasil[] = [$i->full_name, $pengalaman, $i->last_education, $nilai_online, $i->nilai_sikap, $this->c45->predictDataTesting($testing)];
		}

		return $hasil;
	}

	function hitung($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$data['data_testing'] = $this->hitungC45($id);

		$data['judul'] = "Hitung Algoritma";

		$this->load->view('admin/v_header', $data);
		$this->load->view('admin/v_algoritma_1');
		$this->load->view('admin/v_footer');

	}
}