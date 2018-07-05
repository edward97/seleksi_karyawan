<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * soal_model
 */
class Soal_model extends CI_Model
{
	function tampil_online() {
		$this->db->select('*');
		$this->db->from('question_online');
		$this->db->join('job', 'job.id_job = question_online.id_job', 'left');
		return $this->db->get();
	}

	function tampil_online_label() {
		$this->db->distinct();
		$this->db->select('label');
		return $this->db->get('question_online');
	}

	function tampil_f2f() {
		$this->db->select('*');
		$this->db->from('question_f2f');
		$this->db->join('job', 'job.id_job = question_f2f.id_job', 'left');
		return $this->db->get();
	}

	function tampil_f2f_label() {
		$this->db->distinct();
		$this->db->select('label');
		return $this->db->get('question_f2f');
	}

	function add_online($table, $data){
		$this->db->insert($table, $data);
	}

	function add_f2f($table, $data){
		$this->db->insert($table, $data);
	}

	function edit_online($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function edit_f2f($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function update_online($table, $data, $where) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}

	function update_f2f($table, $data, $where) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}
}
