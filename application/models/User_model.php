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

	function change_user($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function add_user_detail($table, $data) {
		$this->db->insert($table, $data);
	}

	function add_user_ability($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function get_id_std_user() {
		$this->db->select('*');
		$this->db->from('users');
		$this->db->join('selection_stage_detail', 'selection_stage_detail.id = users.id_stage_detail', 'inner');
		$this->db->join('selection_stage', 'selection_stage.id_stage = selection_stage_detail.id_stage', 'inner');
		return $this->db->get();
	}

	function compare_ability() {
		$this->db->select('*');
		$this->db->from('required_ability');
		$this->db->join('users_ability', 'users_ability.id_ability = required_ability.id_ability', 'inner');
		return $this->db->get();
	}

	function get_id_std_user_spec($where) {
		$this->db->select('*');
		$this->db->from('users');
		$this->db->join('selection_stage_detail', 'selection_stage_detail.id = users.id_stage_detail', 'inner');
		$this->db->join('selection_stage', 'selection_stage.id_stage = selection_stage_detail.id_stage', 'inner');
		$this->db->where('users.id_user', $where);
		return $this->db->get();
	}

	function compare_ability_spec($where1, $where2) {
		$this->db->select('*');
		$this->db->from('required_ability');
		$this->db->join('users_ability', 'users_ability.id_ability = required_ability.id_ability', 'inner');
		$this->db->where('required_ability.id_std', $where1);
		$this->db->where('users_ability.id_user', $where2);
		return $this->db->get();
	}

	// exam
	function check($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function add_exam($table, $data) {
		$this->db->insert($table, $data);
	}

	function update_exam($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}
}