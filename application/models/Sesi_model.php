<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Sesi_model
 */
class Sesi_model extends CI_Model
{
	function tampil_kualifikasi() {

	}

	function tampil_tahap_1() {
		$this->db->select('job.id_job, job.nm_job, selection_stage_detail.id, selection_stage_detail.start_stage, selection_stage_detail.end_stage');
		$this->db->from('job');
		$this->db->join('selection_stage', 'selection_stage.id_job = job.id_job', 'inner');
		$this->db->join('selection_stage_detail', 'selection_stage_detail.id_stage = selection_stage.id_stage', 'inner');
		$this->db->where('selection_stage_detail.label', 'Tahap 1');
		return $this->db->get();
	}

	function add_session($table, $data) {
		$this->db->insert($table, $data);
		$id = $this->db->insert_id();
		return (isset($id)) ? $id : FALSE;
	}

	function add_detail_selection($table, $data) {
		$this->db->insert_batch($table, $data);
	}

	function update_admin_sesi($table, $where, $data) {
		$this->db->where($where);
		$this->db->update($table, $data);
	}
}