<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Login
 */
class Login extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('login_model');
		$this->load->model('sesi_model');
	}

	function index() {
		$this->load->view('v_login');
	}

	function auth() {
		if ($this->input->post('submit')) {
			$this->form_validation->set_rules('email', 'Email', 'trim|required');
			$this->form_validation->set_rules('password', 'Password', 'trim|required');

			if ($this->form_validation->run() == FALSE) {
				$this->load->view('v_login');
			}
			else {
				$email = htmlspecialchars($this->input->post('email', TRUE), ENT_QUOTES);
				$password = htmlspecialchars($this->input->post('password', TRUE), ENT_QUOTES);

				$where = array(
					'email' => $email,
					'password' => md5($password)
				);
				$cek_admin = $this->login_model->auth_admin('admins', $where);

				if ($cek_admin->num_rows() > 0) {
					$this->session->set_userdata('masuk', TRUE);
					$data = $cek_admin->row_array();

					if ($data['level'] == '1') {
						$this->session->set_userdata('akses', '1');
						$this->session->set_userdata('ses_id', $data['id_admin']);
						$this->session->set_userdata('ses_nm', $data['nm_admin']);

						redirect('dashboard');
					}
					else {
						$this->session->set_userdata('akses', '2');
						$this->session->set_userdata('ses_id', $data['id_admin']);
						$this->session->set_userdata('ses_nm', $data['nm-admin']);

						redirect('dashboard');
					}
				}
				else {
					$today = mdate('%Y-%m-%d', now('Asia/Jakarta'));

					$where_user = array(
						'users.email' => $email,
						'users.password' => md5($password),
					);
					$cek_user = $this->login_model->auth_user($where_user);

					if ($cek_user->num_rows() > 0) {
						$data = $cek_user->row_array();

						$this->session->set_userdata('masuk', TRUE);
						$this->session->set_userdata('akses', '3');
						$this->session->set_userdata('ses_id', $data['id_user']);
						$this->session->set_userdata('ses_nm', $data['email']);

						if ($data['acc_status'] == '0') {
							$this->session->set_flashdata('msg', '<div class="alert alert-warning">Silahkan konfirmasi email anda!</div>');
							redirect('login');
						}
						elseif ($data['acc_status'] == '1') {
							redirect('dashboard');
						}
						elseif ($data['acc_status'] == '2') {
							redirect('dashboard/result');
						}
						else {
							$this->load->view('errors/404.html');
						}
					}
					else {
						$this->session->set_flashdata('msg', '<div class="alert alert-danger">Email or password is Incorrect!</div>');
						redirect('login');
					}
				}
			}
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function logout() {
		$this->session->sess_destroy();
		redirect('login');
	}
}