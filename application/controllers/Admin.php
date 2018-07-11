<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Admin
 */
class Admin extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('admin_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['admin'] = $this->admin_model->tampil_admin()->result();
			$data['judul'] = "Admin";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_admin');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function add_act() {
		if (($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') && $this->input->post('submit') == 'save') {
			$name = $this->input->post('username');
			$email = htmlspecialchars($this->input->post('email', TRUE), ENT_QUOTES);
			$pass = htmlspecialchars($this->input->post('password', TRUE), ENT_QUOTES);
			$level = $this->input->post('level');
			$profesi = $this->input->post('profesi');

			if ($pass != '') {
				$data = array(
					'id_admin' => null,
					'nm_admin' => $name,
					'email' => $email,
					'profesi' => $profesi,
					'password' => md5($pass),
					'level' => $level,
				);
			}
			else {
				$data = array(
					'id_admin' => null,
					'nm_admin' => $name,
					'email' => $email,
					'profesi' => $profesi,
					'level' => $level
				);
			}
			
			$this->admin_model->add_admin('admins', $data);
			$this->session->set_flashdata('msg_admin', '<div class="alert alert-success">Data berhasil ditambah!</div>');
			
			redirect('admin');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function update_act() {
		if (($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') && $this->input->post('submit') == 'update') {
			$id = $this->input->post('id');
			$name = $this->input->post('username');
			$email = htmlspecialchars($this->input->post('email', TRUE), ENT_QUOTES);
			$pass = htmlspecialchars($this->input->post('password', TRUE), ENT_QUOTES);
			$level = $this->input->post('level');
			$profesi = $this->input->post('profesi');

			if ($pass != '') {
				$data = array(
					'nm_admin' => $name,
					'email' => $email,
					'password' => md5($pass),
					'level' => $level,
				);
			}
			else {
				$data = array(
					'nm_admin' => $name,
					'email' => $email,
					'level' => $level,
					'profesi' => $profesi
				);
			}
			
			$where = array(
				'id_admin' => $id
			);

			$this->admin_model->update_admin('admins', $where, $data);
			$this->session->set_flashdata('msg_admin', '<div class="alert alert-info">Data berhasil diubah!</div>');

			redirect('admin');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function delete($id) {
		$where = array('id_admin' => $id);
		$this->admin_model->delete_admin('admins', $where);
		$this->session->set_flashdata('msg_admin', '<div class="alert alert-danger">Data berhasil dihapus!</div>');

		redirect('admin');
	}
}