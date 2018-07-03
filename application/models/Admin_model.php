<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * admin_model
 */
class Admin_model extends CI_Model
{
	function tampil_admin() {
		return $this->db->get('admins');
	}

	function tampil_admin_active() {
		return $this->db->get_where('admins', array('status_partisipasi' => 1));
	}

	function tampil_admin_no_active() {
		return $this->db->get_where('admins', array('status_partisipasi' => 0));
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