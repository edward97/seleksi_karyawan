<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Admin_model
 */
class Admin_model extends CI_Model
{
	function tampil_admin() {
		return $this->db->get('admins');
	}

	function check($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function tampil_admin_sesi($where) {
		$this->db->select('*');
		$this->db->from('admins_sesi');
		$this->db->join('admins', 'admins.id_admin = admins_sesi.id_admin', 'left');

		$arr = array('admins_sesi.id_stage' => 0, 'created_by' => $where);
		$this->db->where($arr);
		return $this->db->get();
	}

	function add_admin($table, $data) {
		return $this->db->insert($table, $data);
	}

	function update_admin($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function delete_admin($table, $where) {
		$this->db->where($where);
		$this->db->delete($table);
	}
}