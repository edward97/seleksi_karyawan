<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * register
 */
class Register extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('user_model');
		$this->load->model('sesi_model');
		$this->load->model('setting_model');
	}

	function index() {
		$data['format'] = mdate('%Y-%m-%d', now('Asia/Jakarta'));
		
		$data['open_sesi'] = $this->sesi_model->tampil_tahap_1()->result();
		$data['cek'] = $this->sesi_model->tampil_tahap_1()->num_rows();

		$data['ability'] = $this->setting_model->tampil_ability()->result();
		$data['job'] = $this->setting_model->tampil_job()->result();

		$this->load->view('v_register', $data);
	}

	function register_act() {
		$full_name = $this->input->post('nama_lengkap');
		$ktp = $this->input->post('no_ktp');
		$email = $this->input->post('email');
		$password = md5($this->input->post('password'));
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
		$job = $this->input->post('job');
		$stage = $this->input->post('stage');

		$target['tar'] = $this->input->post('kemampuan');

		if ($target['tar'] == null) {
			redirect('register');
		}
		// print_r($target);

		$data_user = array(
			'id_user' => null,
			'email' => $email,
			'password' => $password,
			'confirm_code' => null,
			'id_job' => $job,
			'id_stage' => $stage
		);
		// insert data user dan ambil last_id
		$idInsert = $this->user_model->add_user('users', $data_user);

		$detail_user = array(
			'id_d_user' => null,
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
			'nama_kerabat' => $nama_kerabat,
			'nomor_kerabat' => $no_kerabat,
			'hubungan_kerabat' => $hubungan_kerabat,
			'id_user' => $idInsert
		);

		// array 2D u/ simpan ability
		$val = array();
		foreach ($target['tar'] as $i) {
			array_push($val, array(
				'id' =>  null,
				'id_ability' => $i,
				'id_user' => $idInsert
			));
		}

		$this->user_model->add_user_detail('users_detail', $detail_user);
		$this->user_model->add_user_ability('users_ability', $val);
		$this->session->set_flashdata('msg', '<div class="alert alert-success"><strong>Register berhasil!</strong> Silahkan konfirmasi email anda terlebih dahulu.</div>');
		
		redirect('login');
	}
}