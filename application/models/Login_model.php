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

	function auth_user($where) {
		$this->db->select('*, selection_stage_detail.id, selection_stage_detail.label, selection_stage_detail.end_stage');
		$this->db->from('users');
		$this->db->join('selection_stage_detail', 'selection_stage_detail.id = users.id_stage_detail', 'left');
		$this->db->join('users_detail', 'users_detail.id_user = users.id_user', 'left');
		$this->db->where($where);
		return $this->db->get();
	}
}