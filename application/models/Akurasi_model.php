<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Akurasi_model
 */
class Akurasi_model extends CI_Model
{
	function tampil_dataset() {
		return $this->db->get('dataset_hitung');
	}
}