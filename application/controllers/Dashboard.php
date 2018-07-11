<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * dasboard
 */
class Dashboard extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('sesi_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['judul'] = 'Dashboard';

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_dashboard');
			$this->load->view('admin/v_footer');
		}
		else {
			$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

			

			$this->load->view('user/v_dashboard', $data);
		}
	}

	function result() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
			$this->load->view('user/v_dashboard_tidak_lulus', $data);
	}
}