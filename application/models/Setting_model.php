<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Setting_model
 */
class Setting_model extends CI_Model
{
	function tampil_ability() {
		return $this->db->get('ability');
	}
	
	function tampil_job() {
		return $this->db->get('job');
	}

	function add_ability($table, $data) {
		$this->db->insert($table, $data);
	}

	function add_job($table, $data) {
		$this->db->insert($table, $data);
	}

	function update_ability($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function update_job($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function delete_ability($table, $where) {
		$this->db->where($where);
		$this->db->delete($table);
	}

	function delete_job($table, $where) {
		$this->db->where($where);
		$this->db->delete($table);
	}
}
