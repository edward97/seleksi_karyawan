<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Soal_model
 */
class Soal_model extends CI_Model
{
	function tampil_online($where) {
		$this->db->select('*');
		$this->db->from('question_online');
		$this->db->join('job', 'job.id_job = question_online.id_job', 'left');
		// $this->db->like($where);
		$this->db->where($where);
		return $this->db->get();
	}

	function tampil_soal_user($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function tampil_online_label() {
		$this->db->distinct('label');
		$this->db->select('label, id_job');
		return $this->db->get('question_online');
	}

	function tampil_f2f($where) {
		$this->db->select('*');
		$this->db->from('question_f2f');
		$this->db->join('job', 'job.id_job = question_f2f.id_job', 'left');
		// $this->db->like($where);
		$this->db->where($where);
		return $this->db->get();
	}

	function tampil_f2f_label() {
		$this->db->distinct('label');
		$this->db->select('label, id_job');
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

	function min_total($table, $where) {
		$this->db->where($where);
		$this->db->limit(1);
		return $this->db->get($table);
	}

	function delete_question($table, $where) {
		$this->db->where($where);
		$this->db->delete($table);
	} 
}
