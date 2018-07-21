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

								<p style="text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
								consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
								cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
								proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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
								<h3>Lorem Ipsum</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
							</div>

							<div class="col-md-4">
								<h3>Lorem Ipsum</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
							</div>

							<div class="col-md-4">
								<h3>Lorem Ipsum</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
								tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
								quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
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
