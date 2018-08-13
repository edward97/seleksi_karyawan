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
		$data['today'] = mdate('%Y-%m-%d %H:%i', now('Asia/Jakarta'));
		$data['judul'] = "Dashboard";

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array(
				'status_selesai' => 0
			);
			$que = $this->sesi_model->tampil_seleksi($where);
			$count_user_per_tahap = $que->row_array();

			$data['total_register'] = 0;
			if ($count_user_per_tahap['lbl_register'] != null) {
				$total_register = explode('~', $count_user_per_tahap['lbl_register']);
				$data['total_register'] = count($total_register);
			}
			$data['total_online'] = 0;
			if ($count_user_per_tahap['lbl_online'] != null) {
				$total_online = explode('~', $count_user_per_tahap['lbl_online']);
				$data['total_online'] = count($total_online);
			}
			$data['total_f2f'] = 0;
			if ($count_user_per_tahap['lbl_f2f'] != null) {
				$total_f2f = explode('~', $count_user_per_tahap['lbl_f2f']);
				$data['total_f2f'] = count($total_f2f);
			}
			$data['total_interview'] = 0;
			if ($count_user_per_tahap['lbl_interview'] != null) {
				$total_interview = explode('~', $count_user_per_tahap['lbl_interview']);
				$data['total_interview'] = count($total_interview);
			}
			

			$data['seleksi_aktif_ar'] = $que->result();
			$data['seleksi_aktif_ar_detail'] = $this->sesi_model->tampil_tahapan_detail()->result();
			$data['count_user'] = $this->user_model->tampil_user()->result();
			$data['seleksi_aktif'] = $que->num_rows();

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_dashboard');
			$this->load->view('admin/v_footer');
		}
		else {
			$where = array(
				'users.id_user' => $this->session->userdata('ses_id'),
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
				elseif ($row['label'] == 'Tahap 2') {
					foreach ($data['tahapan'] as $i) {
						if ($row['label'] == 'Tahap 2' && $i->label == 'Tahap 3' && $i->end_stage < $data['today']) {
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
					$this->load->view('user/v_tahap_2');
					$this->load->view('user/v_footer');
				}
				elseif ($row['label'] == 'Tahap 3') {
					foreach ($data['tahapan'] as $i) {
						if ($row['label'] == 'Tahap 3' && $i->label == 'Tahap 4' && $i->end_stage < $data['today']) {
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
					$this->load->view('user/v_tahap_3');
					$this->load->view('user/v_footer');
				}
				elseif ($row['label'] == 'Tahap 4') {
					foreach ($data['tahapan'] as $i) {
						if ($row['label'] == 'Tahap 4' && $i->label == 'Tahap 5' && $i->end_stage < $data['today']) {
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
					$this->load->view('user/v_tahap_4');
					$this->load->view('user/v_footer');
				}
				elseif ($row['label'] == 'Tahap 5') {
					$this->load->view('user/v_header', $data);
					$this->load->view('user/v_tahap_5');
					$this->load->view('user/v_footer');
				}
				else {
					$this->load->view('errors/404.html');
				}
			}
			elseif ($row['acc_status'] == 2) {
				redirect('dashboard/result');
			}
			else {
				redirect('login');
			}
		}
	}

	function result() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$this->load->view('user/v_dashboard_tidak_lulus.php', $data);
	}
}