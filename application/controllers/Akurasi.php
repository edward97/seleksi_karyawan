<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Akurasi
 */
class Akurasi extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('akurasi_model');
	}

	function index() {
		$x = 20;
		$y = 200;
		$count=0;

		$arr = array();

		for ($i=1; $i <= $y; $i++) { 
			if ($i % $x != 0) {
				$arr[$count] = array(
					array(
						$i
					)
				);

				$count++;
			}
		}

		echo "<pre>";
		print_r($arr);
		echo "</pre>";
	}
}