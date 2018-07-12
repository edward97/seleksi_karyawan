<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<title>:. Dashboard .:</title>
		<link rel="icon" type="image/png" href="<?php echo base_url('assets/img/icons/favicon.ico') ?>"/>

		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/simple-line-icons/css/simple-line-icons.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/font-awesome/css/fontawesome-all.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css">

		<style type="text/css">
			
		</style>
	</head>
	<body class="sidebar-hidden header-fixed">
		<div class="page-wrapper">
			<nav class="navbar page-header">
				<a class="navbar-brand" href="<?php echo site_url('dashboard'); ?>">
					<img src="<?php echo base_url(); ?>assets/img/logo.png" alt="logo">
				</a>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="<?php echo base_url(); ?>assets/img/avatar-2.png" class="avatar avatar-sm" alt="logo">
							<span class="small ml-1 d-md-down-none"><?php echo $this->session->userdata('ses_nm')." | ".$format; ?></span>
						</a>

						<div class="dropdown-menu dropdown-menu-right">
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
						</div>
					</li>
				</ul>
			</nav>

			<div class="main-container">
				<div class="content">
					<div class="container-fluid text-center">
						<div class="row">
							<?php if ($this->session->userdata('ses_label') == "Tahap 1"): ?>
								<div class="col-md-3">
									<div class="card text-white">
										<div class="card-body bg-danger">
											Tahap Register <i class="fas fa-times"></i>
										</div>
									</div>
								</div>

								<div class="col-md-3">
									<div class="card">
										<div class="card-body">
											Tahap Ujian
										</div>
									</div>
								</div>

								<div class="col-md-3">
									<div class="card">
										<div class="card-body">
											Tahap Interview
										</div>
									</div>
								</div>

								<div class="col-md-3">
									<div class="card">
										<div class="card-body">
											Result
										</div>
									</div>
								</div>
							<?php endif ?>
						</div>
					</div>

					<div class="container-fluid">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-md-6">
									<div class="card">
										<div class="card-header border border-top-0 border-right-0 border-left-0">
											Card Divded Header
										</div>

										<div class="card-body">
											<div class="row">
												<?php if ($this->session->userdata('ses_label') == "Tahap 1"): ?>
													<div class="col-md-12">
														<h4>Step 1</h4>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" id="defaultCheck1" checked disabled>
															<label class="form-check-label" for="defaultCheck1">
																Isi formulir pendaftaran
															</label>
														</div>

														<div class="form-check">
															<input class="form-check-input" type="checkbox" id="defaultCheck2" checked disabled>
															<label class="form-check-label" for="defaultCheck2">
																Maaf anda tidak lulus dalam tahapan registrasi, terima kasih.
															</label>
														</div>
														<hr>

														<p>Yang perlu dilakukan</p>
														<p class="text-center">Status</p>
														<div class="form-group text-center">
															<button type="button" class="form-control btn btn-danger" disabled>End</button>
														</div>
													</div>
												<?php endif ?>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="card">
										<div class="card-header border border-top-0 border-right-0 border-left-0">
											Card Divded Header
										</div>

										<div class="card-body">
											Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aperiam cupiditate dolore facere magnam, rerum sint velit voluptate voluptates? A assumenda consequuntur debitis eaque est in ipsam iure molestiae quam.
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/popper.js/popper.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>
