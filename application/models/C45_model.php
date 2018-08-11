<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * C45_model
 */
class C45_model extends CI_Model
{
	function truncate($table) {
		$this->db->truncate($table);
	}

	function update_flag($table, $data) {
		$this->db->update($table, $data);
	}

	function tampil_data($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function tampil_atribut_detail($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function tampil_atribut($table, $where) {
		$this->db->distinct();
		$this->db->select('attr');
		$this->db->where($where);
		return $this->db->get($table);
	}

	function tampil_tree($table) {
		return $this->db->get($table);
	}

	function add_rule($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function update_rule($table, $data, $where) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function update_data($table, $data, $where) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}
}