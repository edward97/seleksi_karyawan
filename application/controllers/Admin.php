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
		echo "halaman admin";
	}
}