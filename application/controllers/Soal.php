<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Soal
 */
class Soal extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		// Validasi jika user belum login
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('soal_model');
		$this->load->model('setting_model');
	}

	function list_online() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['divisi'] = $this->setting_model->tampil_job()->result();
			$data['online'] = $this->soal_model->tampil_online()->result();
			$data['judul'] = "List Soal Ujian Online";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_soal_online');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function list_f2f() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['divisi'] = $this->setting_model->tampil_job()->result();
			$data['f2f'] = $this->soal_model->tampil_f2f()->result();
			$data['judul'] = "List Soal Ujian Tatap Muka";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_soal_f2f');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function input_online_act() {
		if (($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2')) {
			$divisi = $this->input->post('divisi');
			$label = $this->input->post('nama_soal');

			$soal = $this->input->post('deskripsi');
			$pilA = $this->input->post('ans_a');
			$pilB = $this->input->post('ans_b');
			$pilC = $this->input->post('ans_c');
			$PilD = $this->input->post('ans_d');
			$weight = $this->input->post('bobot');
			$correct = $this->input->post('correct');

			if ($correct == "a") {
				$correct = $pilA;
			}
			elseif ($correct == "b") {
				$correct = $pilB;
			}
			elseif ($correct == "c") {
				$correct = $pilC;
			}
			else {
				$correct = $PilD;
			}

			$data = array(
				'id_question' => null,
				'question' => $soal,
				'answer_a' => $pilA,
				'answer_b' => $pilB,
				'answer_c' => $pilC,
				'answer_d' => $PilD,
				'correct_ans' => $correct,
				'weight' => $weight,
				'status' => 1,
				'label' => $label,
				'id_job' => $divisi
			);

			$this->soal_model->add_online('question_online', $data);
			$this->session->set_flashdata('msg_online', '<div class="alert alert-success">Data berhasil ditambah!</div>');

			redirect('soal/list_online');

		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function input_f2f_act() {
		if (($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2')) {
			$divisi = $this->input->post('divisi');
			$label = $this->input->post('nama_soal');

			$soal = $this->input->post('deskripsi');
			$pilA = $this->input->post('ans_a');
			$pilB = $this->input->post('ans_b');
			$pilC = $this->input->post('ans_c');
			$PilD = $this->input->post('ans_d');
			$weight = $this->input->post('bobot');
			$correct = $this->input->post('correct');

			if ($correct == "a") {
				$correct = $pilA;
			}
			elseif ($correct == "b") {
				$correct = $pilB;
			}
			elseif ($correct == "c") {
				$correct = $pilC;
			}
			else {
				$correct = $PilD;
			}

			$data = array(
				'id_question' => null,
				'question' => $soal,
				'answer_a' => $pilA,
				'answer_b' => $pilB,
				'answer_c' => $pilC,
				'answer_d' => $PilD,
				'correct_ans' => $correct,
				'weight' => $weight,
				'status' => 1,
				'label' => $label,
				'id_job' => $divisi
			);

			$this->soal_model->add_online('question_f2f', $data);
			$this->session->set_flashdata('msg_f2f', '<div class="alert alert-success">Data berhasil ditambah!</div>');

			redirect('soal/list_f2f');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit_online($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array('id_question' => $id);

			$data['divisi'] = $this->setting_model->tampil_job()->result();
			$data['soal'] = $this->soal_model->edit_online('question_online', $where)->result();
			$data['judul'] = "Edit Soal Online";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_soal_online_edit');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit_f2f($id) {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array('id_question' => $id);

			$data['divisi'] = $this->setting_model->tampil_job()->result();
			$data['soal'] = $this->soal_model->edit_f2f('question_f2f', $where)->result();
			$data['judul'] = "Edit Soal Tatap Muka";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_soal_f2f_edit');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function upt_online_act() {
		if (($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2')) {
			$id = $this->input->post('id');
			$divisi = $this->input->post('divisi');
			$label = $this->input->post('nama_soal');

			$soal = $this->input->post('deskripsi');
			$pilA = $this->input->post('ans_a');
			$pilB = $this->input->post('ans_b');
			$pilC = $this->input->post('ans_c');
			$PilD = $this->input->post('ans_d');
			$weight = $this->input->post('bobot');
			$correct = $this->input->post('correct');

			if ($correct == "a") {
				$correct = $pilA;
			}
			elseif ($correct == "b") {
				$correct = $pilB;
			}
			elseif ($correct == "c") {
				$correct = $pilC;
			}
			else {
				$correct = $PilD;
			}

			$data = array(
				'question' => $soal,
				'answer_a' => $pilA,
				'answer_b' => $pilB,
				'answer_c' => $pilC,
				'answer_d' => $PilD,
				'correct_ans' => $correct,
				'weight' => $weight,
				'status' => 1,
				'label' => $label,
				'id_job' => $divisi
			);
			$where = array('id_question' => $id);

			$this->soal_model->update_online('question_online', $data, $where);
			$this->session->set_flashdata('msg_online', '<div class="alert alert-info">Data berhasil diupdate!</div>');

			redirect('soal/edit_online/'.$id);

		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function upt_f2f_act() {
		if (($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2')) {
			$id = $this->input->post('id');
			$divisi = $this->input->post('divisi');
			$label = $this->input->post('nama_soal');

			$soal = $this->input->post('deskripsi');
			$pilA = $this->input->post('ans_a');
			$pilB = $this->input->post('ans_b');
			$pilC = $this->input->post('ans_c');
			$PilD = $this->input->post('ans_d');
			$weight = $this->input->post('bobot');
			$correct = $this->input->post('correct');

			if ($correct == "a") {
				$correct = $pilA;
			}
			elseif ($correct == "b") {
				$correct = $pilB;
			}
			elseif ($correct == "c") {
				$correct = $pilC;
			}
			else {
				$correct = $PilD;
			}

			$data = array(
				'question' => $soal,
				'answer_a' => $pilA,
				'answer_b' => $pilB,
				'answer_c' => $pilC,
				'answer_d' => $PilD,
				'correct_ans' => $correct,
				'weight' => $weight,
				'status' => 1,
				'label' => $label,
				'id_job' => $divisi
			);
			$where = array('id_question' => $id);

			$this->soal_model->update_f2f('question_f2f', $data, $where);
			$this->session->set_flashdata('msg_f2f', '<div class="alert alert-info">Data berhasil diupdate!</div>');

			redirect('soal/edit_f2f/'.$id);

		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}