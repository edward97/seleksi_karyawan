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
		$this->load->model('sesi_model');
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
			$waktu = $que_exam->row_array();
			$interval1 = new DateTime($data['today_time']);
			$interval2 = new DateTime($waktu['end_online']);
			$data['waktu'] = $interval1->diff($interval2);


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
			$data['tahapan'] = $this->sesi_model->tampil_tahapan('selection_stage_detail', $row['id_stage'])->result();


			$this->load->view('user/v_header', $data);
			$this->load->view('user/v_online');
			$this->load->view('user/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function submit_online() {
		$where = array(
			'users.id_user' => $this->session->userdata('ses_id'),
			'users.acc_status' => 1,
		);
		$x = $this->login_model->auth_user($where);
		$row = $x->row_array();

		$soal = $this->soal_model->tampil_online()->result();

		foreach ($soal as $i) {
			if ($row['label_online'] == $i->label) {
				$tar[] = $this->input->post($i->id_question);
			}
		}
		// echo "<pre>";
		// print_r($tar);
		// echo "</pre>";

		$hasil = 0;
		$total_soal = 0;
		foreach ($tar as $i) {
			foreach ($soal as $j) {
				if ($i == $j->correct_ans) {
					$hasil ++;
				}
			}
			$total_soal++;
		}
		$hasil = ($hasil / $total_soal)*100;

		$data = array(
			'nilai_online' => $hasil
		);
		$where = array(
			'id_user' => $this->session->userdata('ses_id')
		);
		$this->user_model->change_user('users_detail', $where, $data);

		// get minimum req ujian online
		$min_ar = array(
			'id_std' => $row['id_std']
		);
		$min = $this->soal_model->min_total('standard_online', $min_ar)->row_array();

		if ($hasil < $min['nilai']) {
			$data_ar = array(
				'acc_status' => 2
			);
			$where_ar = array(
				'id_user' => $this->session->userdata('ses_id')
			);
			$this->user_model->change_user('users', $where_ar, $data_ar);
			
			redirect('dashboard/result');
		}
		redirect('dashboard');
	}

	function f2f($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$data['today_time'] = mdate('%Y-%m-%d %H:%i:%s', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$where = array(
				'id_user' => $this->session->userdata('ses_id')
			);
			$que_exam = $this->user_model->check('users_exam', $where);
			$check_null = $que_exam->row_array();
			$data['waktu'] = $que_exam->result();

			if ($check_null['start_f2f'] == null) {
				$end_exam = mdate('%Y-%m-%d %H:%i:%s', strtotime('+2 hours', strtotime($data['today_time'])));
				$data_exam = array(
					'id' => null,
					'start_f2f' => $data['today_time'],
					'end_f2f' => $end_exam,
				);
				$where_exam = array(
					'id_user' => $this->session->userdata('ses_id')
				);
				$this->user_model->update_exam('users_exam', $where_exam, $data_exam);

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
			$data['soal_f2f'] = $this->soal_model->tampil_f2f()->result();
			$data['tahapan'] = $this->sesi_model->tampil_tahapan('selection_stage_detail', $row['id_stage'])->result();

			$this->load->view('user/v_header', $data);
			$this->load->view('user/v_f2f');
			$this->load->view('user/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function submit_f2f() {
		$where = array(
			'users.id_user' => $this->session->userdata('ses_id'),
			'users.acc_status' => 1,
		);
		$x = $this->login_model->auth_user($where);
		$row = $x->row_array();

		$soal = $this->soal_model->tampil_f2f()->result();

		foreach ($soal as $i) {
			if ($row['label_f2f'] == $i->label) {
				$tar[] = $this->input->post($i->id_question);
			}
		}
		// echo "<pre>";
		// print_r($tar);
		// echo "</pre>";

		$hasil = 0;
		$total_soal = 0;
		foreach ($tar as $i) {
			foreach ($soal as $j) {
				if ($i == $j->correct_ans) {
					$hasil ++;
				}
			}
			$total_soal++;
		}
		$hasil = ($hasil / $total_soal)*100;

		$data = array(
			'nilai_f2f' => $hasil
		);
		$where = array(
			'id_user' => $this->session->userdata('ses_id')
		);
		$this->user_model->change_user('users_detail', $where, $data);

		// get minimum req ujian online
		$min_ar = array(
			'id_std' => $row['id_std']
		);
		$min = $this->soal_model->min_total('standard_f2f', $min_ar)->row_array();

		if ($hasil < $min['nilai']) {
			$data_ar = array(
				'acc_status' => 2
			);
			$where_ar = array(
				'id_user' => $this->session->userdata('ses_id')
			);
			$this->user_model->change_user('users', $where_ar, $data_ar);
			
			redirect('dashboard/result');
		}
		redirect('dashboard');
	}
}