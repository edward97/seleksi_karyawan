<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sesi_model
 */
class Sesi_model extends CI_Model
{
	function tampil_kualifikasi() {

	}

	function add_session($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function add_detail_selection($table, $data) {
		$this->db->insert_batch($table, $data);
	}
}