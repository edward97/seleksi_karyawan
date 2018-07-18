<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Dashboard
 */
class Dashboard extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('sesi_model');
		$this->load->model('user_model');
		$this->load->model('login_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$data['today'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));
		$data['judul'] = "Dashboard";

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_dashboard');
			$this->load->view('admin/v_footer');
		}
		else {
			$where = array(
				'users.email' => $this->session->userdata('ses_nm'),
				'users.acc_status' => 1,
			);
			$x = $this->login_model->auth_user($where);
			$row = $x->row_array();
			$data['usr'] = $x->result();

			$data['tahapan'] = $this->sesi_model->tampil_tahapan('selection_stage_detail', $row['id_stage'])->result();

			if ($row['acc_status'] == 1) {
				if ($row['label'] == 'Tahap 1') {
					if (($row['end_stage'] < $data['today']) && ($row['total_ability'] < 5)) {
						$data_ar = array(
							'acc_status' => 2
						);
						$where_ar = array(
							'id_user' => $this->session->userdata('ses_id')
						);
						$this->user_model->change_user('users', $where_ar, $data_ar);

						redirect('dashboard/result');
					}
					else {
						foreach ($data['tahapan'] as $i) {
							if ($row['label'] == 'Tahap 1' && $i->label == 'Tahap 2' && $i->end_stage < $data['today']) {
								$data_ar = array(
									'acc_status' => 2
								);
								$where_ar = array(
									'id_user' => $this->session->userdata('ses_id')
								);
								$this->user_model->change_user('users', $where_ar, $data_ar);

								redirect('dashboard/result');
							}
						}
						$this->load->view('user/v_header', $data);
						$this->load->view('user/v_tahap_1');
						$this->load->view('user/v_footer');
					}
				}
				elseif ($row['acc_status'] == 'Tahap 2') {

				}
				elseif ($row['acc_status'] == 'Tahap 3') {
					
				}
				elseif ($row['acc_status'] == 'Tahap 4') {
					
				}
				else {
					$this->load->view('errors/404.html');
				}
			}
			elseif ($row['acc_status'] == 2) {
				redirect('dashboard/result');
			}
			else {
				$this->load->view('errors/404.html');
			}
		}
	}

	function result() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
			$this->load->view('user/v_dashboard_tidak_lulus_tahap_1.php', $data);
	}
}