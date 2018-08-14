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

		if ($check != NULL && ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2')) {
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
		$ktp = $this->input->post('no_ktp');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$tempat_lahir = $this->input->post('tempat_lahir');
		$tgl_lahir = $this->input->post('tgl_lahir');
		$post_time = strtotime($this->input->post('tgl_lahir'));

		// get age
		$now = time();
		$units = 1;
		$year = timespan($post_time, $now, $units);
		$number = preg_replace("/[^0-9]/", '', $year);
		// end

		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$agama = $this->input->post('agama');
		$address = $this->input->post('address');
		$kota = $this->input->post('kota');
		$pos = $this->input->post('pos');
		$no_hp = $this->input->post('no_hp');
		$no_telp = $this->input->post('no_telp');
		$nama_kerabat = $this->input->post('nama_kerabat');
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
		if (strlen($no_hp) > 12 || strlen($no_hp) < 6) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal update! Nomor Hp anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}
		if ($no_telp != '' && strlen($no_telp) != 6) {
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