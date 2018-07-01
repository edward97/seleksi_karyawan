<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * user_model
 */
class user_model extends CI_Model
{
	function tampil_user() {
		return $this->db->get('users');
	}

	function add_user($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function add_user_detail($table, $data) {
		$this->db->insert($table, $data);
	}

	function add_user_ability($table, $data) {
		$this->db->insert_batch($table, $data);
	}
}