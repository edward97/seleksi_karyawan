<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Dataset
 */
class Dataset extends CI_Controller
{
	private $filename = "import_data"; // menentukan nama fix pada file upload

	function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('masuk') != TRUE) {
			redirect('login');
		}
		$this->load->model('dataset_model');
	}

	function index() {
		$data['format'] = mdate('%d-%M-%Y %H:%i %a', now('Asia/Jakarta'));

		if ($this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function form_preview() {
		$upload = $this->upload_file($this->filename);

		if ($upload['result'] == "success") {
			$this->import();
		}
		else {
			$data['upload_error'] = $upload['error']; // Ambil pesan error uploadnya untuk dikirim ke file form dan ditampilkan
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">'.$data['upload_error'].'</div>');
			redirect('sesi/next');
		}
	}

	function upload_file($filename) {
		$config['upload_path'] = './assets/files/';
		$config['allowed_types'] = 'csv';
		$config['max_size'] = '2048';
		$config['overwrite'] = true;
		$config['file_name'] = $filename;

		$this->upload->initialize($config);
		if ($this->upload->do_upload('file')) {
			$return = array('result' => 'success', 'file' => $this->upload->data(), 'error' => '');
		}
		else {
			$return = array('result' => 'failed', 'file' => '', 'error' => $this->upload->display_errors());
		}

		return $return;
	}

	function import() {
		// load plugin PHPExcel
		include APPPATH.'third_party/PHPExcel/PHPExcel.php';

		$csv_reader = PHPExcel_IOFactory::createReader('csv');
		$load_csv = $csv_reader->load('assets/files/'.$this->filename.'.csv'); // load file csv yg sudah di upload
		$sheet = $load_csv->getActiveSheet()->getRowIterator();

		// variabel array kosong untuk insert data
		$data = [];
		$numrow = 1;

		foreach ($sheet as $row) {
			// cek apakah baris lebih dari 1 [baris pertama adalah judul]
			if ($numrow > 1) {
				// script untuk mengambil value
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(false); // load all cells, even if it is not set

				$get = array(); // value akan di simpan dalam array [0]...
				foreach ($cellIterator as $cell) {
					array_push($get, $cell->getValue());
				}

				// ambil data value dari $get
				$nama_lengkap = $get[0]; // ambil data kolom A di csv
				$umur = $get[1];
				$experience = $get[2];
				$last_education = $get[3];
				$status = $get[4];
				$total_kemampuan = $get[5];
				$nilai_online = $get[6];
				$nilai_f2f = $get[7];
				$nilai_sikap = $get[8];
				$buta_warna = $get[9];

				// push (add)ke variabel data
				array_push($data, [
					'nama_lengkap' => $nama_lengkap,
					'umur' => $umur,
					'experience' => $experience,
					'last_education' => $last_education,
					'status' => $status,
					'total_kemampuan' => $total_kemampuan,
					'nilai_online' => $nilai_online,
					'nilai_f2f' => $nilai_f2f,
					'nilai_sikap' => $nilai_sikap,
					'buta_warna' => $buta_warna
				]);
			}
			$numrow++;
		}

		$this->dataset_model->add_dataset('dataset', $data);
		$this->session->set_flashdata('msg', '<div class="alert alert-success">Data berhasil diupload!</div>');
		redirect('sesi/next');
	}
}