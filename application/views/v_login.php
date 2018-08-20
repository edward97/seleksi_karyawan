<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<title>:. Login .:</title>
		<link rel="icon" type="image/png" href="<?php echo base_url('assets/img/icons/favicon.ico') ?>"/>

		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/simple-line-icons/css/simple-line-icons.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/font-awesome/css/fontawesome-all.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css">
	</head>
	<body class="sidebar-hidden header-fixed">
		<div class="page-wrapper">
			<nav class="navbar page-header">
				<a class="navbar-brand" href="<?php echo site_url('dashboard'); ?>">
					<img src="<?php echo base_url(); ?>assets/img/logo.png" alt="logo">
				</a>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="<?php echo site_url('login'); ?>"><i class="fa fa-sign-in-alt"></i> Login</a>
					</li>
				</ul>
			</nav>

			<div class="main-container">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-8" style="padding: 50px;">
								<h1>Seleksi Karyawan</h1>
								  <div class="quote" style="background:#fff;padding:10px;border-left:5px solid black;">
								    <h5 style="font-style:italic;color:gray;">Pleasure in the job puts perfection in the work.</h5>
								    <p style="color:lightgray;">- Aristotle</p>
								  </div>
							</div>
							
							<div class="col-md-4">
								<?php echo $this->session->flashdata('msg'); ?>
								<?php echo form_open('login/auth'); ?>
									<div class="card">
										<div class="card-header text-center text-uppercase h4 font-weight-light">
											Login
										</div>

										<div class="card-body">
											<div class="form-group">
												<label class="form-control-label" for="email">Email</label>
												<input type="text" class="form-control" name="email" id="email" <?php echo set_value('email'); ?> placeholder="Email">
												<?php echo form_error('email', '<small class="form-tex text-danger">', '</small>') ?>
											</div>

											<div class="form-group">
												<label class="form-control-label" for="password">Password</label>
												<input type="password" class="form-control" name="password" id="password" placeholder="Password">
												<?php echo form_error('password', '<small class="form-text text-danger">', '</small>') ?>
											</div>

											<div class="custom-control custom-checkbox mt-4">
												<input type="checkbox" class="custom-control-input" id="login">
												<label class="custom-control-label" for="login">Remember me!</label>
											</div>
										</div>

										<div class="card-footer">
											<div class="row text-center">
												<div class="col-md-6">
													<button type="submit" name="submit" value="1" class="btn btn-success px-5">Login</button>
												</div>

												<div class="col-md-6">
													<a href="<?php echo site_url('register') ?>" class="btn btn-info px-5">Register</a>
												</div>
											</div>
										</div>
									</div>
								<?php echo form_close(); ?>
							</div>
						</div>
						<hr>

						<div class="row">
							<div class="col-md-4">
								<h3 class="text-center"><strong>Daftar dimana saja</strong></h3>
								<p>Seleksi Karyawan memudahkan pelamar untuk mendaftarkan dirinya dimanapun dan kapanpun.
								</p>
							</div>

							<div class="col-md-4">
								<h3 class="text-center"><strong>Mudah dan Cepat</strong></h3>
								<p>Pelamar cukup mengisi formulir data diri, lalu mengikuti proses perekrutan sesuai yang telah dijadwalkan</p>
							</div>

							<div class="col-md-4">
								<h3 class="text-center"><strong>Penyeleksian yang Adil</strong></h3>
								<p>Hasil penyeleksian calon karyawan diproses oleh sistem, sehingga tidak akan ada kecurangan yang disebabkan oleh pihak perusahaan </p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/popper.js/popper.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/js/carbon.js"></script>
	</body>
</html>
