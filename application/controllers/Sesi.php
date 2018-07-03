<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sesi
 */
class Sesi extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		// Validasi jika user belum login
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('setting_model');
		$this->load->model('admin_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['job'] = $this->setting_model->tampil_job()->result();
			$data['a_admin'] = $this->admin_model->tampil_admin_active()->result();
			$data['admin'] = $this->admin_model->tampil_admin_no_active()->result();
			$data['judul'] = "Open Session";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_open_session');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$id = $this->input->post('admin');
			$status = $this->input->post('partisipasi');
			$keterangan = $this->input->post('keterangan');

			$data = array(
				'status_partisipasi' => $status,
				'keterangan' => $keterangan
			);
			$where = array('id_admin' => $id);

			$this->admin_model->update_admin('admins', $where, $data);
			$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diubah!</div>');

			redirect('sesi');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function delete($id) {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data = array('status_partisipasi' => 0);
			$where = array('id_admin' => $id);

			$this->admin_model->update_admin('admins', $where, $data);
			$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diubah!</div>');

			redirect('sesi');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}