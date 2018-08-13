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
		$data['today'] = mdate('%Y-%m-%d %H:%i', now('Asia/Jakarta'));

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

				# +1 KETIKA ADA YANG ONLINE
				$get_id_selection = $this->sesi_model->tampil_seleksi_label('selection_stage_detail', array('id' => $id))->row_array();
				$label_selection = $this->sesi_model->tampil_seleksi_label('selection_stage', array('id_stage' => $get_id_selection['id_stage']))->row_array();
				if ($label_selection['lbl_online'] == NULL) {
					$data_label = array('lbl_online' => $this->session->userdata('ses_id'));
					$where_label = array('id_stage' => $label_selection['id_stage']);
				}
				else {
					$data_label = array('lbl_online' => $label_selection['lbl_online'].'~'.$this->session->userdata('ses_id'));
					$where_label = array('id_stage' => $label_selection['id_stage']);
				}
				$this->sesi_model->update_seleksi('selection_stage', $where_label, $data_label);
				# END
			}

			$where = array(
				'users.id_user' => $this->session->userdata('ses_id'),
				'users.acc_status' => 1,
			);
			$x = $this->login_model->auth_user($where);
			$row = $x->row_array();
			$data['usr'] = $x->result();

			$tampil_tahapan = $this->sesi_model->tampil_tahapan('selection_stage_detail', $row['id_stage']);
			$data['tahapan'] = $tampil_tahapan->result();


			$get_label = $tampil_tahapan->row_array();
			$this->session->set_userdata('label_ses_online', $get_label['label_online']);
			$get = array(
				'label' => $this->session->userdata('label_ses_online')
			);
			$data['soal_online'] = $this->soal_model->tampil_soal_user('question_online', $get)->result();

			if ($data['today'] > $interval2) {
				$data = array('nilai_online' => 0);
				$where = array('id_user' => $this->session->userdata('ses_id'));
				$this->user_model->change_user('users_detail', $where, $data);

				$data_ar = array('acc_status' => 2);
				$where_ar = array('id_user' => $this->session->userdata('ses_id'));
				$this->user_model->change_user('users', $where_ar, $data_ar);
				redirect('dashboard/result');
			}

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

		$get = array(
			'label' => $this->session->userdata('label_ses_online')
		);
		$soal = $this->soal_model->tampil_soal_user('question_online', $get)->result();

		$tar = [];
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
		// $min_ar = array(
		// 	'id_std' => $row['id_std']
		// );
		// $min = $this->soal_model->min_total('standard_online', $min_ar)->row_array();
		$min = 70;

		if ($hasil < $min) {
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
		$data['today'] = mdate('%Y-%m-%d %H:%i', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '3') {
			$where = array(
				'id_user' => $this->session->userdata('ses_id')
			);
			$que_exam = $this->user_model->check('users_exam', $where);
			$waktu = $que_exam->row_array();
			$check_null = $que_exam->row_array();
			$interval1 = new DateTime($data['today_time']);
			$interval2 = new DateTime($waktu['end_f2f']);
			$data['waktu'] = $interval1->diff($interval2);

			if ($check_null['start_f2f'] == null) {
				$end_exam = mdate('%Y-%m-%d %H:%i:%s', strtotime('+2 hours', strtotime($data['today_time'])));
				$data_exam = array(
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

				# +1 KETIKA ADA YANG F2F
				$get_id_selection = $this->sesi_model->tampil_seleksi_label('selection_stage_detail', array('id' => $id))->row_array();
				$label_selection = $this->sesi_model->tampil_seleksi_label('selection_stage', array('id_stage' => $get_id_selection['id_stage']))->row_array();
				if ($label_selection['lbl_f2f'] == NULL) {
					$data_label = array('lbl_f2f' => $this->session->userdata('ses_id'));
					$where_label = array('id_stage' => $label_selection['id_stage']);
				}
				else {
					$data_label = array('lbl_f2f' => $label_selection['lbl_f2f'].'~'.$this->session->userdata('ses_id'));
					$where_label = array('id_stage' => $label_selection['id_stage']);
				}
				$this->sesi_model->update_seleksi('selection_stage', $where_label, $data_label);
				# END
			}

			$where = array(
				'users.id_user' => $this->session->userdata('ses_id'),
				'users.acc_status' => 1,
			);
			$x = $this->login_model->auth_user($where);
			$row = $x->row_array();
			$data['usr'] = $x->result();

			$tampil_tahapan = $this->sesi_model->tampil_tahapan('selection_stage_detail', $row['id_stage']);
			$data['tahapan'] = $tampil_tahapan->result();

			$get_label = $tampil_tahapan->row_array();
			$this->session->set_userdata('label_ses_f2f', $get_label['label_f2f']);
			$get = array(
				'label' => $this->session->userdata('label_ses_f2f')
			);
			$data['soal_f2f'] = $this->soal_model->tampil_soal_user('question_f2f', $get)->result();

			if ($data['today'] > $interval2) {
				$data = array('nilai_f2f' => 0);
				$where = array('id_user' => $this->session->userdata('ses_id'));
				$this->user_model->change_user('users_detail', $where, $data);

				$data_ar = array('acc_status' => 2);
				$where_ar = array('id_user' => $this->session->userdata('ses_id'));
				$this->user_model->change_user('users', $where_ar, $data_ar);
				redirect('dashboard/result');
			}

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

		$get = array(
			'label' => $this->session->userdata('label_ses_f2f')
		);
		$soal = $this->soal_model->tampil_soal_user('question_f2f', $get)->result();

		$tar = [];
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
		// $min_ar = array(
		// 	'id_std' => $row['id_std']
		// );
		// $min = $this->soal_model->min_total('standard_f2f', $min_ar)->row_array();
		$min = 70;

		if ($hasil < $min) {
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