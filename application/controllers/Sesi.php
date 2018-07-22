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
		$this->load->model('sesi_model');
		$this->load->model('setting_model');
		$this->load->model('admin_model');
		$this->load->model('kualifikasi_model');
		$this->load->model('soal_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['job'] = $this->setting_model->tampil_job()->result();
			$data['admin'] = $this->admin_model->tampil_admin()->result();

			$idUser = $this->session->userdata('ses_id');
			$data['temp_admin'] = $this->admin_model->tampil_admin_sesi($idUser)->result();
			$data['kualifikasi'] = $this->kualifikasi_model->tampil_kualifikasi()->result();
			$data['s_online'] = $this->soal_model->tampil_online_label()->result();
			$data['s_f2f'] = $this->soal_model->tampil_f2f_label()->result();
			$data['judul'] = "Open Session";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_open_session');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function save_act() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$divisi = $this->input->post('divisi');
			$kualifikasi = $this->input->post('kualifikasi');
			$ujian_online = $this->input->post('ujian_online');
			$ujian_f2f = $this->input->post('ujian_f2f');
			$start_pendaftaran = $this->input->post('sesi_pendaftaran1');
			$end_pendaftaran = $this->input->post('sesi_pendaftaran2');
			$start_online = $this->input->post('sesi_online1');
			$end_online = $this->input->post('sesi_online2');
			$start_tatap = $this->input->post('sesi_tatap1');
			$end_tatap = $this->input->post('sesi_tatap2');
			$start_interview = $this->input->post('sesi_interview1');
			$end_interview = $this->input->post('sesi_interview2');

			$data_selection = array(
				'id_stage' => null,
				'nm_stage' => 'nama_stage',
				'label_online' => $ujian_online,
				'label_f2f' => $ujian_f2f,
				'status_selesai' => 0,
				'id_std' => $kualifikasi,
				'id_job' => $divisi
			);
			$idSelection = $this->sesi_model->add_session('selection_stage', $data_selection);

			$detail_stage = array(
				array(
					'id' => null,
					'label' => 'Tahap 1',
					'start_stage' => $start_pendaftaran,
					'end_stage' => $end_pendaftaran,
					'id_stage' => $idSelection
				),
				array(
					'id' => null,
					'label' => 'Tahap 2',
					'start_stage' => $start_online,
					'end_stage' => $end_online,
					'id_stage' => $idSelection
				),
				array(
					'id' => null,
					'label' => 'Tahap 3',
					'start_stage' => $start_tatap,
					'end_stage' => $end_tatap,
					'id_stage' => $idSelection
				),
				array(
					'id' => null,
					'label' => 'Tahap 4',
					'start_stage' => $start_interview,
					'end_stage' => $end_interview,
					'id_stage' => $idSelection
				),
				array(
					'id' => null,
					'label' => 'Tahap 5',
					'start_stage' => $start_interview,
					'end_stage' => $end_interview,
					'id_stage' => $idSelection
				),
				array(
					'id' => null,
					'label' => 'Tahap 6',
					'start_stage' => $start_interview,
					'end_stage' => $end_interview,
					'id_stage' => $idSelection
				)
			);
			$this->sesi_model->add_detail_selection('selection_stage_detail', $detail_stage);

			$data_admin = array( 'id_stage' => $idSelection );
			$data_admin_where = array( 
				'id_stage' => 0,
				'created_by' => $this->session->userdata('ses_id')
			);
			$this->sesi_model->update_admin_sesi('admins_sesi', $data_admin_where, $data_admin);

			$this->session->set_flashdata('msg', '<div class="alert alert-success">Data berhasil ditambah!</div>');
			redirect('dashboard');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit() {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$id = $this->input->post('admin');
			$keterangan = $this->input->post('keterangan');

			$data = array(
				'id' => null,
				'keterangan' => $keterangan,
				'id_admin' => $id,
				'id_stage' => 0,
				'created_by' => $this->session->userdata('ses_id')
			);
			$where = array('id_admin' => $id);

			$this->admin_model->add_admin('admins_sesi', $data);
			$this->session->set_flashdata('msg', '<div class="alert alert-success">Data berhasil ditambah!</div>');

			redirect('sesi');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function delete($id) {
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array('id' => $id);

			$this->admin_model->delete_admin('admins_sesi', $where);
			$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diubah!</div>');

			redirect('sesi');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function closing($id) {
		if ($this->session->userdata('akses') == '1') {
			$data = array('status_selesai' => 1);
			$where = array('id_stage' => $id);

			$this->sesi_model->update_seleksi('selection_stage', $where, $data);
			$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diubah!</div>');

			redirect('dashboard');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}
}