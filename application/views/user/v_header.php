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
							<?php foreach ($usr as $i): ?>
								<?php if ($i->label == 'Tahap 1' && $i->end_stage >= $today): ?>
									<div class="col-md-3">
										<div class="card text-white">
											<div class="card-body bg-warning">
												Tahap Register <i class="icon icon-hourglass"></i>
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

								<?php elseif ($i->label == 'Tahap 1' && $i->end_stage <= $today): ?>
									<div class="col-md-3">
										<div class="card text-white">
											<div class="card-body bg-success">
												Tahap Register <i class="icon icon-pin"></i>
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

								<?php elseif ($i->label == 'Tahap 2' && $i->end_stage >= $today): ?>
									<div class="col-md-3">
										<div class="card text-white">
											<div class="card-body bg-success">
												Tahap Register <i class="icon icon-pin"></i>
											</div>
										</div>
									</div>

									<div class="col-md-3">
										<div class="card">
											<div class="card-body bg-info">
												Tahap Ujian <i class="icon icon-pin"></i>
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
							<?php endforeach ?>
						</div>
					</div>