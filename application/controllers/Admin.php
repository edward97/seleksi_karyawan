<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * admin
 */
class Admin extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('admin_model');
	}

	function index() {
		$data['admin'] = $this->admin_model->tampil_admin()->result();
		$data['judul'] = "Admin";

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_admin');
			$this->load->view('admin/v_footer');

		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}