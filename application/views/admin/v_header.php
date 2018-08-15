<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<title>:. <?php echo $judul; ?> .:</title>
		<link rel="icon" type="image/png" href="<?php echo base_url('assets/img/icons/favicon.ico') ?>"/>

		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/simple-line-icons/css/simple-line-icons.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/font-awesome/css/fontawesome-all.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/icheck-bootstrap.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/datetimepicker/jquery.datetimepicker.css">

		<script type="text/javascript">
			function confirmDialog() {
				return confirm('Are you sure want to delete this record?')
			}
		</script>

		<style type="text/css">
			input[type=number]::-webkit-inner-spin-button, 
			input[type=number]::-webkit-outer-spin-button { 
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;
				margin: 0; 
			}
		</style>
	</head>
	<body class="sidebar-fixed header-fixed">
		<div class="page-wrapper">
			<nav class="navbar page-header">
				<a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
					<i class="fa fa-bars"></i>
				</a>

				<a class="navbar-brand" href="<?php echo site_url('dashboard'); ?>">
					<img src="<?php echo base_url(); ?>assets/img/logo.png" alt="logo">
				</a>

				<a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
					<i class="fa fa-bars"></i>
				</a>

				<ul class="navbar-nav ml-auto">
					<!-- <li class="nav-item d-md-down-none">
						<a href="#">
							<i class="fa fa-bell"></i>
							<span class="badge badge-pill badge-danger">5</span>
						</a>
					</li> -->

					<li class="nav-item dropdown">
						<!-- <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
						<a class="nav-link" href="#" role="button">
							<img src="<?php echo base_url(); ?>assets/img/avatar-1.png" class="avatar avatar-sm" alt="logo">
							<span class="small ml-1 d-md-down-none"><?php echo $this->session->userdata('ses_nm')." | ".$format; ?></span>
						</a>

						<!-- <div class="dropdown-menu dropdown-menu-right">
							<div class="dropdown-header">Account</div>

							<a href="#" class="dropdown-item">
								<i class="fa fa-user"></i> Profile
							</a>

							<a href="#" class="dropdown-item">
								<i class="fa fa-envelope"></i> Messages
							</a>

							<div class="dropdown-header">Settings</div>

							<a href="#" class="dropdown-item">
								<i class="fa fa-bell"></i> Notifications
							</a>

							<a href="#" class="dropdown-item">
								<i class="fa fa-wrench"></i> Settings
							</a>

							<a href="<?php echo site_url('login/logout') ?>" class="dropdown-item">
								<i class="fa fa-lock"></i> Logout
							</a>
						</div> -->
					</li>
				</ul>
			</nav>

			<div class="main-container">
				<div class="sidebar">
					<nav class="sidebar-nav">
						<ul class="nav">
							<li class="nav-title">Navigation</li>

							<li class="nav-item">
								<a href="<?php echo site_url('sesi'); ?>" class="nav-link <?php echo active_link('sesi'); ?>">
									<i class="icon icon-calendar"></i> Buka Sesi
								</a>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('admin'); ?>" class="nav-link <?php echo active_link('admin'); ?>">
									<i class="icon icon-user"></i> Mengelola Admin
								</a>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('user'); ?>" class="nav-link <?php echo active_link('user'); ?>">
									<i class="icon icon-people"></i> Profil Pelamar
								</a>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('algoritma'); ?>" class="nav-link <?php echo active_link('algoritma'); ?>">
									<i class="icon icon-speech"></i> Algoritma
								</a>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('interview'); ?>" class="nav-link <?php echo active_link('interview'); ?>">
									<i class="icon icon-pencil"></i> Input Nilai Interview
								</a>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('soal'); ?>" class="nav-link <?php echo active_link('soal'); ?>">
									<i class="icon icon-book-open"></i> Soal Ujian
								</a>
							</li>

							<li class="nav-item nav-dropdown">
								<a href="#" class="nav-link nav-dropdown-toggle">
									<i class="icon icon-graph"></i> Kualifikasi <i class="fa fa-caret-left"></i>
								</a>

								<ul class="nav-dropdown-items">
									<li class="nav-item">
										<a href="<?php echo site_url('kualifikasi/list'); ?>" class="nav-link <?php echo active_link('kualifikasi/list'); ?>">
											<i class="icon icon-doc"></i> List Kualifikasi
										</a>
									</li>

									<li class="nav-item">
										<a href="<?php echo site_url('kualifikasi'); ?>" class="nav-link <?php echo active_link('kualifikasi'); ?>">
											<i class="icon icon-doc"></i> Input Kualifikasi
										</a>
									</li>
								</ul>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('setting'); ?>" class="nav-link <?php echo active_link('setting'); ?>">
									<i class="icon icon-briefcase"></i> Kemampuan & Pekerjaan
								</a>
							</li>

							<li class="nav-title">More</li>

							<!-- <li class="nav-item">
								<a href="<?php echo site_url('cart'); ?>" class="nav-link">
									<i class="icon icon-logout"></i> Cart
								</a>
							</li>

							<li class="nav-item">
								<a href="<?php echo site_url('akurasi'); ?>" class="nav-link">
									<i class="icon icon-logout"></i> Akurasi
								</a>
							</li> -->

							<li class="nav-item">
								<a href="<?php echo site_url('login/logout'); ?>" class="nav-link">
									<i class="icon icon-logout"></i> Logout
								</a>
							</li>
						</ul>
					</nav>
				</div>
