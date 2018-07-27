<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Dataset_model
 */
class Dataset_model extends CI_Model
{
	function tampil_dataset() {
		return $this->db->get('dataset_hitung');
	}

	function add_dataset($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function delete_dataset($table) {
		$this->db->truncate($table);
	}
}