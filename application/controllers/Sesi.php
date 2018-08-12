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
		$sekarang = mdate('%Y-%m-%d', now('Asia/Jakarta'));

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

			if ($start_pendaftaran < $sekarang || $start_online < $sekarang || $start_tatap < $sekarang || $start_interview < $sekarang) {
				$this->session->set_flashdata('msg', '<div class="alert alert-danger">Tanggal tidak boleh kurang dari hari ini!</div>');
				redirect('sesi');
			}
			if ($start_pendaftaran > $end_pendaftaran || $start_online > $end_online || $start_tatap > $end_tatap || $start_interview > $end_interview) {
				$this->session->set_flashdata('msg', '<div class="alert alert-danger">Tanggal berakhir tidak boleh kurang dari tanggal mulai!</div>');
				redirect('sesi');
			}
			if (($end_pendaftaran > $start_online || $end_pendaftaran > $start_tatap || $end_pendaftaran > $end_interview) || ($end_online > $start_tatap || $end_online > $start_interview) || ($end_tatap > $start_interview)) {
				$this->session->set_flashdata('msg', '<div class="alert alert-danger">Tanggal mulai tidak boleh kurang dari tanggal sesi sebelumnya!</div>');
				redirect('sesi');
			}

			$data_selection = array(
				'id_stage' => null,
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
				// array(
				// 	'id' => null,
				// 	'label' => 'Tahap 5',
				// 	'start_stage' => $start_interview,
				// 	'end_stage' => $end_interview,
				// 	'id_stage' => $idSelection
				// ),
				// array(
				// 	'id' => null,
				// 	'label' => 'Tahap 6',
				// 	'start_stage' => $start_interview,
				// 	'end_stage' => $end_interview,
				// 	'id_stage' => $idSelection
				// )
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

	function next($id) {
		$sekarang = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1') {
			$data = array('end_stage' => $sekarang);
			$where = array('id' => $id);

			$up = $this->sesi_model->update_tahapan_detail('selection_stage_detail', $where, $data);

			$where = array('id' => $id+1);
			$row = $this->sesi_model->update_tahapan_detail_where('selection_stage_detail', $where)->row_array();

			if ($row['label'] == 'Tahap 4') {
				$data = array(
					'start_stage' => $sekarang,
					'end_stage' => $sekarang
				);
				$where = array('id' => $id+1);
				$this->sesi_model->update_tahapan_detail('selection_stage_detail', $where, $data);
			}
			else {
				$data = array('start_stage' => $sekarang);
				$where = array('id' => $id+1);
				$this->sesi_model->update_tahapan_detail('selection_stage_detail', $where, $data);
			}
			$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diubah!</div>');
			redirect('dashboard');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit_sesi() {
		$check = $this->uri->segment(3);

		if ($check != NULL && $this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$where = array('id_stage' => $check);
			$data['judul_sesi'] = $this->sesi_model->edit_sesi('selection_stage', $where)->result();
			$data['edit'] = $this->sesi_model->edit_sesi_detail('selection_stage_detail', $where)->result();
			$this->session->set_userdata('ses_sesi', $check);

			$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

			$data['judul'] = "Edit Session";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_edit_session');
			$this->load->view('admin/v_footer');

		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit_act() {
		$sekarang = mdate('%Y-%m-%d', now('Asia/Jakarta'));

		$id_daftar = $this->input->post('id_sesi_daftar');
		$id_online = $this->input->post('id_sesi_online');
		$id_f2f = $this->input->post('id_sesi_f2f');
		$id_interview = $this->input->post('id_sesi_interview');



		$start_daftar = $this->input->post('sesi_pendaftaran1');
		$end_daftar = $this->input->post('sesi_pendaftaran2');
		

		$start_online = $this->input->post('sesi_online1');
		$end_online = $this->input->post('sesi_online2');
		

		$start_f2f = $this->input->post('sesi_tatap1');
		$end_f2f = $this->input->post('sesi_tatap2');
		

		$start_interview = $this->input->post('sesi_interview1');
		$end_interview = $this->input->post('sesi_interview2');

		if ($start_daftar < $sekarang || $start_online < $sekarang || $start_f2f < $sekarang || $start_interview < $sekarang) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Tanggal tidak boleh kurang dari hari ini!</div>');
			redirect('sesi/edit_sesi/'.$this->session->userdata('ses_sesi'));
			$this->session->unset_userdata('ses_sesi');
		}
		if ($start_daftar > $end_daftar || $start_online > $end_online || $start_f2f > $end_f2f || $start_interview > $end_interview) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Tanggal berakhir tidak boleh kurang dari tanggal mulai!</div>');
			redirect('sesi/edit_sesi/'.$this->session->userdata('ses_sesi'));
			$this->session->unset_userdata('ses_sesi');
		}
		if (($end_daftar > $start_online || $end_daftar > $start_f2f || $end_daftar > $end_interview) || ($end_online > $start_f2f || $end_online > $start_interview) || ($end_f2f > $start_interview)) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Tanggal mulai tidak boleh kurang dari tanggal sesi sebelumnya!</div>');
			redirect('sesi/edit_sesi/'.$this->session->userdata('ses_sesi'));
			$this->session->unset_userdata('ses_sesi');
		}

		$data = array(
			'start_stage' => $start_daftar,
			'end_stage' => $end_daftar
		);
		$where = array('id' => $id_daftar);
		$this->sesi_model->update_sesi('selection_stage_detail', $data, $where);

		$data = array(
			'start_stage' => $start_online,
			'end_stage' => $end_online
		);
		$where = array('id' => $id_online);
		$this->sesi_model->update_sesi('selection_stage_detail', $data, $where);

		$data = array(
			'start_stage' => $start_f2f,
			'end_stage' => $end_f2f
		);
		$where = array('id' => $id_f2f);
		$this->sesi_model->update_sesi('selection_stage_detail', $data, $where);

		$data = array(
			'start_stage' => $start_interview,
			'end_stage' => $end_interview
		);
		$where = array('id' => $id_interview);
		$this->sesi_model->update_sesi('selection_stage_detail', $data, $where);


		$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diubah!</div>');
		redirect('sesi/edit_sesi/'.$this->session->userdata('ses_sesi'));
		$this->session->unset_userdata('ses_sesi');
	}
}