<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Login_model
 */
class Login_model extends CI_Model
{
	function auth_admin($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function auth_user($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function get_label($email) {
		$this->db->select('selection_stage_detail.id, selection_stage_detail.label');
		$this->db->from('selection_stage_detail');
		$this->db->join('users', 'users.id_stage = selection_stage_detail.id', 'inner');
		$this->db->where('users.email', $email);
		return $this->db->get();
	}
}