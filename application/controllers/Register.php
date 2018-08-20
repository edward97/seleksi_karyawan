<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Register
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

	public function random_code($length = 100) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}

	function index() {
		$data['format'] = mdate('%Y-%m-%d %H:%i', now('Asia/Jakarta'));
		
		$data['open_sesi'] = $this->sesi_model->tampil_tahap_1($data['format'])->result();
		$data['cek'] = $this->sesi_model->tampil_tahap_1($data['format'])->num_rows();
		
		$data['ability'] = $this->setting_model->tampil_ability()->result();
		$data['job'] = $this->setting_model->tampil_job()->result();

		$this->load->view('v_register', $data);
	}

	function register_act() {
		$full_name = $this->input->post('nama_lengkap');
		# CEK APAKAH USERNAME MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alpha(str_replace(' ', '', $full_name))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nama lengkap hanya boleh huruf!</div>');
			redirect('register');
		}

		$ktp = $this->input->post('no_ktp');
		# CEK APAKAH KTP SUDAH DIGUNAKAN ATAU BELUM
		$where_ktp = array(
			'no_ktp' => $ktp,
		);
		$cek_ktp = $this->user_model->check('users_detail', $where_ktp)->num_rows();
		if ($cek_ktp != 0) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! No. KTP sudah terdaftar!</div>');
			redirect('register');
		}

		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$tempat_lahir = $this->input->post('tempat_lahir');
		# CEK APAKAH NAMA KERABAT MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alnum(str_replace(' ', '', $tempat_lahir))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Tempat lahir hanya boleh huruf & angka!</div>');
			redirect('register');
		}
		$tgl_lahir = $this->input->post('tgl_lahir');
		$post_time = strtotime($this->input->post('tgl_lahir'));
		# GET AGE
		$now = time();
		$units = 1;
		$year = timespan($post_time, $now, $units);
		$number = preg_replace("/[^0-9]/", '', $year);
		# CEK UMUR TIDAK LEBIH 50 TAHUN
		if ($number > 50) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Umur Maksimal hanya bisa 50 Tahun!</div>');
			redirect('register');
		}
		# END

		$jenis_kelamin = $this->input->post('jenis_kelamin');
		$agama = $this->input->post('agama');
		$address = $this->input->post('address');
		$kota = $this->input->post('kota');
		# CEK APAKAH KOTA MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alnum(str_replace(' ', '', $kota))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nama Kota hanya boleh huruf & angka!</div>');
			redirect('register');
		}

		$pos = $this->input->post('pos');
		$no_hp = $this->input->post('no_hp');
		$no_telp = $this->input->post('no_telp');
		$nama_kerabat = $this->input->post('nama_kerabat');
		# CEK APAKAH NAMA KERABAT MENGANDUNG KARAKTER KHUSUS
		if (!ctype_alpha(str_replace(' ', '', $nama_kerabat))) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nama kerabat hanya boleh huruf!</div>');
			redirect('register');
		}
		$no_kerabat = $this->input->post('no_kerabat');
		$hubungan_kerabat = $this->input->post('hubungan_kerabat');
		$status = $this->input->post('status');
		$pendidikan = $this->input->post('pendidikan');
		$pengalaman = $this->input->post('pengalaman');
		$job = $this->input->post('job');
		$stage = $this->input->post('stage');

		$target['tar'] = $this->input->post('kemampuan');

		# CEK EMAIL SUDAH DIGUNAKAN ATAU BELUM
		$where_email = array(
			'email' => $email,
			'acc_status !=' => 3
		);
		$cek_email = $this->user_model->check('users', $where_email)->num_rows();
		if ($cek_email != 0) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Email sudah terdaftar!</div>');
			redirect('register');
		}

		# VALIDASI FORM
		# -------------
		if (strlen($ktp) != 16 || !is_numeric($ktp) ) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nomor KTP anda tidak valid!</div>');
			redirect('register');
		}
		if (strlen($no_hp) > 12 || strlen($no_hp) < 10) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nomor Hp anda tidak valid!</div>');
			redirect('register');
		}
		if ($no_telp != '' && strlen($no_telp) < 6) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nomor Telp anda tidak valid!</div>');
			redirect('register');
		}
		if (strlen($no_kerabat) < 6 || strlen($no_kerabat) > 12) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Nomor Hp anda tidak valid!</div>');
			redirect('register');
		}
		if (strlen($password) != NULL && strlen($password) < 8) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Gagal register! Password anda tidak valid!</div>');
			redirect('user/edit/'.$id);
		}
		if (count($target['tar']) < 5) {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">Jumlah kemampuan minimal 5!</div>');
			redirect('register');
		}

		$confirm_code = $this->random_code();
		$data_user = array(
			'id_user' => NULL,
			'email' => $email,
			'password' => md5($password),
			'confirm_code' => $confirm_code,
			'id_job' => $job,
			'id_stage_detail' => $stage
		);
		# INSERT DATA USER DAN AMBIL LAST_ID
		$idInsert = $this->user_model->add_user('users', $data_user);

		# ARRAY 2D U/ INSERT ABILITY
		$val = array();
		foreach ($target['tar'] as $i) {
			array_push($val, array(
				'id' =>  NULL,
				'id_ability' => $i,
				'id_user' => $idInsert
			));
		}
		$this->user_model->add_user_ability('users_ability', $val);

		# TOTAL ABILITY USER YANG SAMA DENGAN REQUIRED ABILITY
		$id_std_usr = $this->user_model->get_id_std_user_spec($idInsert)->row_array();
		$total_sama = $this->user_model->compare_ability_spec($id_std_usr['id_std'], $id_std_usr['id_user'])->num_rows();

		$detail_user = array(
			'id_d_user' => NULL,
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
			'total_ability' => $total_sama,
			'nama_kerabat' => $nama_kerabat,
			'nomor_kerabat' => $no_kerabat,
			'hubungan_kerabat' => $hubungan_kerabat,
			'id_user' => $idInsert
		);
		$this->user_model->add_user_detail('users_detail', $detail_user);

		# +1 KETIKA ADA YANG REGISTER
		$get_id_selection = $this->sesi_model->tampil_seleksi_label('selection_stage_detail', array('id' => $stage))->row_array();
		$label_selection = $this->sesi_model->tampil_seleksi_label('selection_stage', array('id_stage' => $get_id_selection['id_stage']))->row_array();

		if ($label_selection['lbl_register'] == NULL) {
			$data_label = array('lbl_register' => $idInsert);
			$where_label = array('id_stage' => $label_selection['id_stage']);
		}
		else {
			$data_label = array('lbl_register' => $label_selection['lbl_register'].'~'.$idInsert);
			$where_label = array('id_stage' => $label_selection['id_stage']);
		}
		$this->sesi_model->update_seleksi('selection_stage', $where_label, $data_label);

		$config = [
			'useragent' => 'CodeIgniter',
			'protocol'  => 'smtp',
			'mailpath'  => '/usr/sbin/sendmail',
			# 'smtp_host' => 'ssl://smtp.gmail.com',
			'smtp_host' => 'ssl://smtp.mail.yahoo.com',
			'smtp_user' => 'edw_shen@yahoo.com', # email
			'smtp_pass' => 'esj04121972', # password
			'smtp_port' => 465,
			'smtp_keepalive' => TRUE,
			'smtp_crypto' => 'SSL',
			'wordwrap'  => TRUE,
			'wrapchars' => 80,
			'mailtype'  => 'html',
			'charset'   => 'utf-8',
			'validate'  => TRUE,
			'crlf'      => "\r\n",
			'newline'   => "\r\n",
		];

		$this->email->initialize($config);
		$this->email->from('edw_shen@yahoo.com', 'Edward');
		$this->email->to($email);
		$this->email->subject('Verifikasi Akun');
		$this->email->message('Terima kasih telah melakukan pendaftaran. Silahkan klik link verifikasi berikut.<br>'.site_url('register/verification/'.$confirm_code)."<br><br><br>Selamat Beraktivitas, Edward Surya Jaya - Selection Team");

		if ($this->email->send()) {
			$this->session->set_flashdata('msg', '<div class="alert alert-success"><strong>Register berhasil!</strong> Silahkan konfirmasi email anda terlebih dahulu.</div>');
			redirect('login');
		}
		else {
			$this->session->set_flashdata('msg', '<div class="alert alert-danger"><strong>Register berhasil!</strong> Email tidak terkirim.</div>');
			redirect('login');
		}
	}

	function verification($key) {
		$data = array('acc_status' => 1);
		$where = array('confirm_code' => $key);
		$this->user_model->change_user('users', $where, $data);

		$this->session->set_flashdata('msg', '<div class="alert alert-info"><strong>Verifikasi berhasil!</strong> Silahkan Login.</div>');
		redirect('login');
	}
}