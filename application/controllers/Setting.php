<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Setting
 */
class Setting extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		// Validasi jika user belum login
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('setting_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['ability'] = $this->setting_model->tampil_ability()->result();
			$data['job'] = $this->setting_model->tampil_job()->result();
			$data['judul'] = "Abilites & Jobs";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_setting');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function add_act_abt() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$nm = $this->input->post('nm_abt');

			$data = array(
				'id_ability' => null,
				'nm_ability' => $nm
			);

			$this->setting_model->add_ability('ability', $data);
			$this->session->set_flashdata('msg_ability', '<div class="alert alert-success">Data berhasil ditambah!</div>');

			redirect('setting');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function add_act_job() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$nm = $this->input->post('nm_job');

			$data = array(
				'id_job' => null,
				'nm_job' => $nm
			);

			$this->setting_model->add_job('job', $data);
			$this->session->set_flashdata('msg_job', '<div class="alert alert-success">Data berhasil ditambah!</div>');

			redirect('setting');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function update_act_abt() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$id = $this->input->post('id');
			$nama = $this->input->post('nm_abt');

			$data = array(
				'nm_ability' => $nama
			);

			$where = array(
				'id_ability' => $id
			);

			$this->setting_model->update_ability('ability', $where, $data);
			$this->session->set_flashdata('msg_ability', '<div class="alert alert-info">Data berhasil diupdate!</div>');
			
			redirect('Setting');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function update_act_job() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$id = $this->input->post('id');
			$nama = $this->input->post('nm_job');

			$data = array(
				'nm_job' => $nama
			);

			$where = array(
				'id_job' => $id
			);

			$this->setting_model->update_job('job', $where, $data);
			$this->session->set_flashdata('msg_job', '<div class="alert alert-info">Data berhasil diupdate!</div>');
			
			redirect('Setting');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function delete_act_abt($id) {
		if ($this->session->userdata('akses') == '1') {
			$where = array('id_ability' => $id);

			$this->setting_model->delete_ability('ability', $where);
			$this->session->set_flashdata('msg_ability', '<div class="alert alert-danger">Data berhasil dihapus!</div>');
			
			redirect('setting');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function delete_act_job($id) {
		if ($this->session->userdata('akses') == '1') {
			$where = array('id_job' => $id);

			$this->setting_model->delete_job('job', $where);
			$this->session->set_flashdata('msg_job', '<div class="alert alert-danger">Data berhasil dihapus!</div>');

			redirect('setting');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}