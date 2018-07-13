<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Start
 */
class Start extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		// Validasi jika user belum login
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('user_model');
		$this->load->model('login_model');
	}

	function online() {
		$data['format'] = mdate('%Y-%m-%d %H:%i:%s', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$where = array(
				'id_user' => $this->session->userdata('ses_id')
			);
			$que_exam = $this->user_model->check('users_exam', $where);
			$data['waktu'] = $que_exam->result();

			$where_user = array(
				'users.email' => $this->session->userdata('ses_nm'),
				'users.acc_status' => 1
			);
			$que_user = $this->login_model->auth_user('users', $where_user);
			$data['usr'] = $que_user->result();

			if ($que_exam->num_rows() == 0) {
				$end_exam = mdate('%Y-%m-%d %H:%i:%s', strtotime('+2 hours', strtotime($data['format'])));

				$data_exam = array(
					'id' => null,
					'start_online' => $data['format'],
					'end_online' => $end_exam,
					'id_user' => $this->session->userdata('ses_id')
				);
				$this->user_model->add_exam('users_exam', $data_exam);

				// update tahap user
				$current_id_stage = $que_user->row_array();
				$data_ar = array(
					'id_stage' => $current_id_stage['id']+1
				);
				$where_ar = array(
					'email' => $this->session->userdata('ses_nm')
				);
				$this->user_model->change_user('users', $where_ar, $data_ar);

				$this->load->view('user/v_header', $data);
				$this->load->view('user/v_online');
				$this->load->view('user/v_footer');
			}
			else {
				$this->load->view('user/v_header', $data);
				$this->load->view('user/v_online');
				$this->load->view('user/v_footer');
			}
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function f2f() {
		$data['format'] = mdate('%Y-%m-%d %H:%i:%s', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$end_exam = mdate('%Y-%m-%d %H:%i:%s', strtotime('+2 hours', strtotime($data['format'])));

			$data_exam = array(
				'start_f2f' => $data['format'],
				'end_f2f' => $end_exam,
			);
			$where_data_exam = array(
				'start_f2f' => '0000-00-00 00:00:00',
				'id_user' => $this->session->userdata('ses_id')
			);
			$this->user_model->update_exam('users_exam', $where_data_exam, $data_exam);

			$where_user = array(
				'users.email' => $this->session->userdata('ses_nm'),
				'users.acc_status' => 1
			);
			$que_user = $this->login_model->auth_user('users', $where_user);
			$data['usr'] = $que_user->result();

			$this->load->view('user/v_header', $data);
			$this->load->view('user/v_f2f');
			$this->load->view('user/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function submit_online() {
		$data['format'] = mdate('%Y-%m-%d %H:%i:%s', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$where_user = array(
				'users.email' => $this->session->userdata('ses_nm'),
				'users.acc_status' => 1
			);
			$que_user = $this->login_model->auth_user('users', $where_user);

			$nilai_online = 0;

			// update tahap user
			$current_id_stage = $que_user->row_array();
			$data_ar = array(
				'id_stage' => $current_id_stage['id']+1
			);
			$where_ar = array(
				'email' => $this->session->userdata('ses_nm')
			);
			$this->user_model->change_user('users', $where_ar, $data_ar);

			redirect('dashboard');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function submit_f2f() {
		$data['format'] = mdate('%Y-%m-%d %H:%i:%s', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$where_user = array(
				'users.email' => $this->session->userdata('ses_nm'),
				'users.acc_status' => 1
			);
			$que_user = $this->login_model->auth_user('users', $where_user);

			$nilai_online = 0;

			// update tahap user
			$current_id_stage = $que_user->row_array();
			$data_ar = array(
				'id_stage' => $current_id_stage['id']+1
			);
			$where_ar = array(
				'email' => $this->session->userdata('ses_nm')
			);
			$this->user_model->change_user('users', $where_ar, $data_ar);

			redirect('dashboard');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}