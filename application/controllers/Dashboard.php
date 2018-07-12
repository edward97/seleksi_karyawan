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
		$this->load->model('user_model');
		$this->load->model('login_model');
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

			$where_user = array(
				'users.email' => $this->session->userdata('ses_nm'),
				'users.acc_status' => 1,
			);
			$data['user'] = $this->login_model->auth_user('users', $where_user)->result();

			// status nya ntar di ganti utk cek apakah user lulus atau tidak
			if ($today > $data['end_stage'] && $data['label'] == 'Tahap 1') {
				$id_std_usr = $this->user_model->get_id_std_user_spec($data['id_user'])->row_array();
				$total_sama = $this->user_model->compare_ability_spec($id_std_usr['id_std'], $id_std_usr['id_user'])->num_rows();

				if ($total_sama < 5) {
					$data_ar = array(
						'acc_status' => 2
					);
					$where_ar = array(
						'id_user' => $data['id_user']
					);
					$this->user_model->change_active('users', $where_ar, $data_ar);
					redirect('dashboard/result');
				}
			}

			

			$this->load->view('user/v_dashboard', $data);
		}
	}

	function result() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
			$this->load->view('user/v_dashboard_tidak_lulus_tahap_1.php', $data);
	}
}