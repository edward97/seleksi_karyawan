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
		$this->load->model('setting_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['ability'] = $this->setting_model->tampil_ability()->result();
			$data['job'] = $this->setting_model->tampil_job()->result();
			$data['judul'] = 'List Kualifikasi';

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_input_kualifikasi');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}