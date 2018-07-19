<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Interview
 */
class Interview extends CI_Controller
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
		$data['judul'] = "Interview";

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['usr'] = $this->user_model->tampil_detail_user()->result();

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_interview');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function update_act() {
		$id = $this->input->post('id');
		$stage = $this->input->post('id_stage');
		$n_sikap = $this->input->post('n_sikap');

		$where = array(
			'id_user' => $id
		);

		$data['usr'] = $this->user_model->tampil_detail_user()->result();
		foreach ($data['usr'] as $i) {
			if ($i->id_user == $id && $i->nilai_sikap == null) {
				$data_1 = array(
					'id_stage_detail' => $stage+1
				);
				$this->user_model->change_user('users', $where, $data_1);
			}
		}

		$data_2 = array(
			'nilai_sikap' => $n_sikap
		);
		$this->user_model->change_user('users_detail', $where, $data_2);


		$this->session->set_flashdata('msg_interview', '<div class="alert alert-info">Data berhasil diupdate!</div>');
		redirect('interview');
	}

}