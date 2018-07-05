<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Kualifikasi_model
 */
class Kualifikasi_model extends CI_Model
{
	function tampil_kualifikasi() {
		return $this->db->get('standard_qualification');
	}

	function add_kualifikasi($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function add_required($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_kemampuan($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_umur($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_pengalaman($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_status($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_pendidikan($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_online($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_f2f($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_sikap($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_buta_warna($table, $data) {
		$this->db->insert_batch($table, $data);
	}
}