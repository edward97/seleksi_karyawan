<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Kualifikasi_model
 */
class Kualifikasi_model extends CI_Model
{
	function tampil_kualifikasi() {
		$this->db->select('*');
		$this->db->from('standard_qualification');
		$this->db->join('job', 'job.id_job = standard_qualification.id_job', 'left');
		return $this->db->get();
	}

	function tampil_required_ability() {
		$this->db->select('*');
		$this->db->from('required_ability');
		$this->db->join('ability', 'ability.id_ability = required_ability.id_ability', 'left');
		$this->db->join('job', 'job.id_job = required_ability.id_job', 'left');
		return $this->db->get();
	}

	function add_kualifikasi($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function add_required($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_kemampuan($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_umur($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_pengalaman($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_status($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_pendidikan($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_online($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_f2f($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_sikap($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function add_buta_warna($table, $data) {
		$this->db->insert_batch($table, $data);
	}
}