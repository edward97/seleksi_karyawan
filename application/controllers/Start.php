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
		$this->load->model('soal_model');
	}

	function online($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$data['today_time'] = mdate('%Y-%m-%d %H:%i:%s', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$where = array(
				'id_user' => $this->session->userdata('ses_id')
			);
			$que_exam = $this->user_model->check('users_exam', $where);
			$data['waktu'] = $que_exam->result();

			if ($que_exam->num_rows() == 0) {
				$end_exam = mdate('%Y-%m-%d %H:%i:%s', strtotime('+2 hours', strtotime($data['today_time'])));

				$data_exam = array(
					'id' => null,
					'start_online' => $data['today_time'],
					'end_online' => $end_exam,
					'id_user' => $this->session->userdata('ses_id')
				);
				$this->user_model->add_exam('users_exam', $data_exam);

				// update tahap user
				$data_ar = array(
					'id_stage_detail' => $id
				);
				$where_ar = array(
					'id_user' => $this->session->userdata('ses_id')
				);
				$this->user_model->change_user('users', $where_ar, $data_ar);
			}

			$where = array(
				'users.id_user' => $this->session->userdata('ses_id'),
				'users.acc_status' => 1,
			);
			$x = $this->login_model->auth_user($where);
			$row = $x->row_array();
			$data['usr'] = $x->result();
			$data['soal_online'] = $this->soal_model->tampil_online()->result();


			$this->load->view('user/v_header', $data);
			$this->load->view('user/v_online');
			$this->load->view('user/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function submit_online() {

	}
}