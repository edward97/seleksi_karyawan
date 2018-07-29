<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Akurasi_model
 */
class Akurasi_model extends CI_Model
{
	function tampil_dataset() {
		return $this->db->get('dataset_hitung');
	}

	function get_row($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function add_data($table, $data) {
		$this->db->insert($table, $data);
	}

	function truncate_db($table) {
		$this->db->truncate($table);
	}
}