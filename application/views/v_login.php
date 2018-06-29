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
	<body>
		<div class="page-wrapper flex-row align-items-center">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-5">
						<?php echo $this->session->flashdata('msg_login'); ?>

						<?php echo form_open('login/auth'); ?>
							<div class="card p-4">
								<div class="card-header text-center text-uppercase h4 font-weight-light">
									Login
								</div>

								<div class="card-body py-5">
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
										<input type="checkbox" class="custom-control-input" id="login" checked>
										<label class="custom-control-label" for="login">I agree to the <a href="#">Terms of User</a></label>
									</div>
								</div>

								<div class="card-footer">
									<div class="row">
										<div class="col-6">
											<button type="submit" name="submit" value="1" class="btn btn-primary px-5">Login</button>
										</div>

										<div class="col-6">
											<a href="#" class="btn btn-link">Forgot password?</a>
										</div>
									</div>
								</div>
							</div>
						<?php echo form_close(); ?>
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
