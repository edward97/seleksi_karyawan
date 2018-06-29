<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * login_model
 */
class Login_model extends CI_Model
{
	function auth_admin($table, $where) {
		return $this->db->get_where($table, $where);
	}

	function auth_user($table, $where) {
		return $this->db->get_where($table, $where);
	}

}