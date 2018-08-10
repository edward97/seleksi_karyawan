<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User
 */
class User extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('user_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['user'] = $this->user_model->get_id_std_user()->result();
			$data['judul'] = "Users";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_users');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}