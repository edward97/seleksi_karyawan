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
}