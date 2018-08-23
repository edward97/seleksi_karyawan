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
							<!-- <div class="dropdown-header">Account</div>

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
							</a> -->

							<a href="<?php echo site_url('login/logout') ?>" class="dropdown-item">
								<i class="fa fa-lock"></i> Logout
							</a>
						</div>
					</li>
				</ul>
			</nav>

			<div class="main-container">
				<div class="content">
					<div class="container">
						<div class="row">
							<?php foreach ($user as $i): ?>
								<?php if ($i->id_user == $this->session->userdata('ses_id') && $i->label == 'Tahap 1'): ?>
									<div class="col-md-4">
										<div class="card">
											<div class="card-body">
												<h4 class="text-center">Step 1</h4>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked disabled>
													<label class="form-check-label" for="defaultCheck1">
														Isi formulir pendaftaran
													</label>
												</div>

												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
													<label class="form-check-label" for="defaultCheck2">
														Tunggu hasil pendafataran
													</label>
												</div>
												<hr>

												<p class="text-center">Status</p>
												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-danger" disabled>Register Failed</button>
												</div>
											</div>

											<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
												Maaf anda tidak lulus pada Tahap Register !
											</div>
										</div>
									</div>

								<?php elseif ($i->id_user == $this->session->userdata('ses_id') && $i->label == 'Tahap 2'): ?>
									<div class="col-md-4">
										<div class="card">
											<div class="card-body">
												<h4 class="text-center">Step 1</h4>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked disabled>
													<label class="form-check-label" for="defaultCheck1">
														Isi formulir pendaftaran
													</label>
												</div>

												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
													<label class="form-check-label" for="defaultCheck2">
														Tunggu hasil pendafataran
													</label>
												</div>
												<hr>

												<p class="text-center">Status</p>

												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
												</div>
											</div>

											<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
												Lulus!
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<div class="card">
											<div class="card-body">
												<h4 class="text-center">Step 2</h4>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
													<label class="form-check-label" for="defaultCheck2">
														Ujian Periode I
													</label>
												</div>
												<div>&nbsp;</div>
												<hr>

												<p class="text-center">Status</p>
												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-danger" disabled>Ujian Periode I - Failed</button>
												</div>
											</div>

											<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
												Maaf anda tidak lulus pada Tahap Ujian Periode I !
											</div>
										</div>
									</div>

								<?php elseif ($i->id_user == $this->session->userdata('ses_id') && $i->label == 'Tahap 3'): ?>
									<div class="col-md-4">
										<div class="card">
											<div class="card-body">
												<h4 class="text-center">Step 1</h4>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked disabled>
													<label class="form-check-label" for="defaultCheck1">
														Isi formulir pendaftaran
													</label>
												</div>

												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
													<label class="form-check-label" for="defaultCheck2">
														Tunggu hasil pendafataran
													</label>
												</div>
												<hr>

												<p class="text-center">Status</p>
												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
												</div>
											</div>

											<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
												Lulus!
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<div class="card">
											<div class="card-body">
												<h4 class="text-center">Step 2</h4>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
													<label class="form-check-label" for="defaultCheck2">
														Ujian Periode I (Selesai)
													</label>
												</div>
												<div>&nbsp;</div>
												<hr>

												<p class="text-center">Status</p>

												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Ujian Periode I - Success</button>
												</div>

											</div>

											<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
												Lulus!
											</div>
										</div>
									</div>

									<div class="col-md-4">
										<div class="card">
											<div class="card-body">
												<h4 class="text-center">Step 3</h4>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
													<label class="form-check-label" for="defaultCheck2">
														Ujian Periode II
													</label>
												</div>
												<div>&nbsp;</div>
												<hr>

												<p class="text-center">Status</p>
												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-danger" disabled>Ujian Periode II - Failed</button>
												</div>
											</div>

											<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
												Maaf anda tidak lulus pada Tahap Ujian Periode II !

											</div>
										</div>
									</div>
								<?php endif ?>
							<?php endforeach ?>
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
