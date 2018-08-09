<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Cart_model
 */
class Cart_model extends CI_Model
{
	function tampil_data($table, $where) {
		$this->db->where($where);
		$this->db->where('flag', 0);
		return $this->db->get($table);
	}

	function add_dataset_hitung($table, $data) {
		$this->db->insert($table, $data);
	}

	function tampil_atribut_detail() {
		return $this->db->get('cart_atribut_detail');
	}

	function truncate($table) {
		$this->db->truncate($table);
	}

	function update_flag($table, $data) {
		$this->db->update($table, $data);
	}

	function cek_rule($table) {
		return $this->db->get($table);
	}

	function insert_rule($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function update_rule($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function update_atribut_detail($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function update_dataset($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function cek_keputusan($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function tampil_tree($table) {
		return $this->db->get($table);
	}

	function tampil_cek($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function total_next($table, $where) {
		$this->db->where($where);
		return $this->db->get($table);
	}
}