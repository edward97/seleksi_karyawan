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

		if ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1' || $this->session->userdata('akses') == '2') {
			
		}
		else {
			$this->load->view('errors/404.html');
		}
	}

	function form_preview() {
		$upload = $this->upload_file($this->filename);
		// id sesi yang di hitung
		$id_x = $this->input->post('sesi');

		if ($upload['result'] == "success") {
			$this->import($id_x);
		}
		else {
			$data['upload_error'] = $upload['error']; // Ambil pesan error uploadnya untuk dikirim ke file form dan ditampilkan
			$this->session->set_flashdata('msg', '<div class="alert alert-danger">'.$data['upload_error'].'</div>');
			redirect('algoritma');
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

	function import($id) {
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
				$age = $get[1];
				$experience = $get[2];
				$last_education = strtolower($get[3]);
				$status = strtolower($get[4]);
				$total_ability = $get[5];
				$nilai_online = $get[6];
				$nilai_f2f = $get[7];
				$nilai_sikap = strtolower($get[8]);
				$status_passed = strtolower($get[9]);

				$umur = $exp = $pendidikan = $stt = $ttl_abt = $onl = $f2f = $sikap = $pass = false;
				if (is_numeric($age) == true) {
					$umur = true;
				}
				if ($umur == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [age] baris '.$numrow.' => '.$age.'</div>');
					redirect('algoritma');
					break;
				}

				if (is_numeric($experience) == true) {
					$exp = true;
				}
				if ($exp == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [experience] baris '.$numrow.' => '.$experience.'</div>');
					redirect('algoritma');
					break;
				}

				if ($last_education == 'sma' || $last_education == 'akademi' || $last_education == 'sarjana' || $last_education == 'pasca') {
					$pendidikan = true;
				}
				if ($pendidikan == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [last_education] baris '.$numrow.' => '.$last_education.'</div>');
					redirect('algoritma');
					break;
				}

				if ($status == 'lajang' || $status == 'menikah') {
					$stt = true;
				}
				if ($stt == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [status] baris '.$numrow.' => '.$status.'</div>');
					redirect('algoritma');
					break;
				}

				if (is_numeric($total_ability) == true  && $total_ability >= 5 && $total_ability <= 10) {
					$ttl_abt = true;
				}
				if ($ttl_abt == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [total_ability] baris '.$numrow.' => '.$total_ability.'</div>');
					redirect('algoritma');
					break;
				}

				if (is_numeric($nilai_online) == true  && $nilai_online >= 70 && $nilai_online <= 100) {
					$onl = true;
				}
				if ($onl == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [nilai_online] baris '.$numrow.' => '.$nilai_online.'</div>');
					redirect('algoritma');
					break;
				}

				if (is_numeric($nilai_f2f) == true  && $nilai_f2f >= 70 && $nilai_f2f <= 100) {
					$f2f = true;
				}
				if ($f2f == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [nilai_f2f] baris '.$numrow.' => '.$nilai_f2f.'</div>');
					redirect('algoritma');
					break;
				}

				if ($nilai_sikap == 'cukup baik' || $nilai_sikap == 'baik' || $nilai_sikap == 'sangat baik') {
					$sikap = true;
				}
				if ($sikap == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [nilai_sikap] baris '.$numrow.' => '.$nilai_sikap.'</div>');
					redirect('algoritma');
					break;
				}

				if ($status_passed == 'lulus' || $status_passed == 'gagal') {
					$pass = true;
				}
				if ($pass == false) {
					$this->session->set_flashdata('msg', '<div class="alert alert-danger">Error [status_passed] baris '.$numrow.' => '.$status_passed.'</div>');
					redirect('algoritma');
					break;
				}

				// push (add)ke variabel data
				array_push($data, [
					'nama_lengkap' => $nama_lengkap,
					'age' => $age,
					'experience' => $experience,
					'last_education' => $last_education,
					'status' => $status,
					'total_ability' => $total_ability,
					'nilai_online' => $nilai_online,
					'nilai_f2f' => $nilai_f2f,
					'nilai_sikap' => $nilai_sikap,
					'status_passed' => $status_passed,
				]);
			}
			$numrow++;
		}
		echo "string";
		$this->dataset_model->delete_dataset('dataset');
		$this->dataset_model->add_dataset('dataset', $data);
		$this->session->set_flashdata('msg', '<div class="alert alert-success">Data berhasil diupload dan dihitung!</div>');
		redirect('algoritma/hitung/'.$id);
		redirect('algoritma');
	}
}