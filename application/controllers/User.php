<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User
 */
class User extends CI_Controller
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
		
		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			$data['user'] = $this->user_model->get_id_std_user()->result();
			$data['judul'] = "Users";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_users');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function edit() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));
		$check = $this->uri->segment(3);

		if ($check != NULL && $this->session->userdata('akses') == '1') {
			$where = array('users.id_user' => $check);
			$data['user'] = $this->user_model->edit_detail_user($where)->result();
			$data['judul'] = "Edit Users";

			$this->load->view('admin/v_header', $data);
			$this->load->view('admin/v_users_edit');
			$this->load->view('admin/v_footer');
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function update() {
		$id = $this->input->post('id_user');
		$full_name = $this->input->post('nama_lengkap');
		# CEK APAKAH USERNAME MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alpha(str_replace(' ', '', $full_name))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nama lengkap hanya boleh huruf!</div>');
			redirect('user/edit/'.$id);
		}

		$ktp = $this->input->post('no_ktp');
		# CEK APAKAH KTP SUDAH DIGUNAKAN ATAU BELUM
		$where_ktp = array(
			'no_ktp' => $ktp,
		);
		$cek_ktp = $this->user_model->check('users_detail', $where_ktp)->num_rows();
		# CEK KTP USER SEBELUMYA
		$where_before_ktp = array(
			'no_ktp' => $ktp,
			'id_user' => $id,
		);
		$cek_before = $this->user_model->check('users_detail', $where_before_ktp)->row_array();
		if ($cek_before['no_ktp'] != $ktp && $cek_ktp != 0) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! No. KTP sudah terdaftar!</div>');
			redirect('user/edit/'.$id);
		}

		$email = $this->input->post('email');
		# CEK APAKAH EMAIL SUDAH DIGUNAKAN ATAU BELUM
		$where_email = array(
			'email' => $email,
		);
		$cek_email = $this->user_model->check('users', $where_email)->num_rows();
		# CEK EMAIL USER SEBELUMYA
		$where_before_email = array(
			'email' => $email,
			'id_user' => $id,
		);
		$cek_before = $this->user_model->check('users', $where_before_email)->row_array();
		if ($cek_before['email'] != $email && $cek_email != 0) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Email sudah terdaftar!</div>');
			redirect('user/edit/'.$id);
		}

		$password = $this->input->post('password');
		$tempat_lahir = $this->input->post('tempat_lahir');
		# CEK APAKAH NAMA KERABAT MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alnum(str_replace(' ', '', $tempat_lahir))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Tempat lahir hanya boleh huruf & angka!</div>');
			redirect('user/edit/'.$id);
		}
		$tgl_lahir = $this->input->post('tgl_lahir');
		$post_time = strtotime($this->input->post('tgl_lahir'));

		$now = time();
		$units = 1;
		$year = timespan($post_time, $now, $units);
		$number = preg_replace("/[^0-9]/", '', $year);
		# CEK UMUR TIDAK LEBIH 50 TAHUN
		if ($number > 50) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Umur Maksimal hanya bisa 50 Tahun!</div>');
			redirect('user/edit/'.$id);
		}
		# END

		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$agama = $this->input->post('agama');
		$address = $this->input->post('address');
		$kota = $this->input->post('kota');
		$kota = $this->input->post('kota');
		# CEK APAKAH KOTA MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alnum(str_replace(' ', '', $kota))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nama Kota hanya boleh huruf & angka!</div>');
			redirect('user/edit/'.$id);
		}
		$pos = $this->input->post('pos');
		$no_hp = $this->input->post('no_hp');
		$no_telp = $this->input->post('no_telp');
		$nama_kerabat = $this->input->post('nama_kerabat');
		# CEK APAKAH NAMA KERABAT MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alpha(str_replace(' ', '', $nama_kerabat))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nama kerabat hanya boleh huruf!</div>');
			redirect('user/edit/'.$id);
		}
		$no_kerabat = $this->input->post('no_kerabat');
		$hubungan_kerabat = $this->input->post('hubungan_kerabat');
		$status = $this->input->post('status');
		$pendidikan = $this->input->post('pendidikan');
		$pengalaman = $this->input->post('pengalaman');
		$kemampuan = $this->input->post('kemampuan');

		if (strlen($ktp) != 16 || !is_numeric($ktp) ) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nomor KTP anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}
		if (strlen($no_hp) > 12 || strlen($no_hp) < 10) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nomor Hp anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}
		if ($no_telp != '' && strlen($no_telp) < 6) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nomor Telp anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}
		if (strlen($no_kerabat) < 6 || strlen($no_kerabat) > 12) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nomor Hp anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}
		if (strlen($password) != NULL && strlen($password) < 8) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Password anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}

		$where = array(
			'id_user' => $id
		);

		if ($password != '') {
			$data = array(
				'email' => $email,
				'password' => md5($password),
			);
		}
		else {
			$data = array(
				'email' => $email,
			);
		}
		$this->user_model->change_user('users', $where, $data);

		$detail_user = array(
			'full_name' => $full_name,
			'no_ktp' => $ktp,
			'birth_place' => $tempat_lahir,
			'birth_date' => $tgl_lahir,
			'address' => $address,
			'domisili' => $kota,
			'kode_pos' => $pos,
			'p_number' => $no_hp,
			't_number' => $no_telp,
			'age' => $number,
			'gender' => $jenis_kelamin,
			'religion' => $agama,
			'last_education' => $pendidikan,
			'status' => $status,
			'experience' => $pengalaman,
			'total_ability' => $kemampuan,
			'nama_kerabat' => $nama_kerabat,
			'nomor_kerabat' => $no_kerabat,
			'hubungan_kerabat' => $hubungan_kerabat,
		);
		$this->user_model->change_user('users_detail', $where, $detail_user);

		$this->session->set_flashdata('msg', '<div class="alert alert-info">Data berhasil diupdate!</div>');
		redirect('user/edit/'.$id);
	}
}