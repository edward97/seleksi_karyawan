<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">

		<title>:. Register .:</title>
		<link rel="icon" type="image/png" href="<?php echo base_url('assets/img/icons/favicon.ico') ?>"/>

		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/simple-line-icons/css/simple-line-icons.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/font-awesome/css/fontawesome-all.min.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/vendor/icheck-bootstrap.min.css">



		<style type="text/css">
			.stepwizard-step p {
				margin-top: 0px;
				color:#666;
			}
			.stepwizard-row {
				display: table-row;
			}
			.stepwizard {
				display: table;
				width: 100%;
				position: relative;
			}
			.stepwizard-step button[disabled] {
			/*opacity: 1 !important;
			filter: alpha(opacity=100) !important;*/
			}
			.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
				opacity:1 !important;
				color:#bbb;
			}
			.stepwizard-row:before {
				top: 14px;
				bottom: 0;
				position: absolute;
				content:" ";
				width: 100%;
				height: 1px;
				background-color: #ccc;
				z-index: 0;
			}
			.stepwizard-step {
				display: table-cell;
				text-align: center;
				position: relative;
			}
			.btn-circle {
				width: 30px;
				height: 30px;
				text-align: center;
				padding: 6px 0;
				font-size: 12px;
				line-height: 1.428571429;
				border-radius: 15px;
			}
		</style>
	</head>
	<body class="sidebar-hidden header-fixed">
		<div class="page-wrapper">
			<nav class="navbar page-header">
				<a class="navbar-brand" href="<?php echo site_url('dashboard'); ?>">
					<img src="<?php echo base_url(); ?>assets/img/logo.png" alt="logo">
				</a>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="<?php echo site_url('login') ?>"><i class="fa fa-sign-in-alt"></i> Login</a>
					</li>
				</ul>
			</nav>

			<div class="main-container">
				<div class="content">
					<?php if ($cek != 0): ?>
					<div class="container">
						<div class="stepwizard">
							<div class="stepwizard-row setup-panel">
								<div class="stepwizard-step col-xs-3"> 
									<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
									<p><small>Register 1</small></p>
								</div>

								<div class="stepwizard-step col-xs-3"> 
									<a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
									<p><small>Register 2</small></p>
								</div>
							</div>
						</div>

						<?php echo form_open('register/register_act'); ?>
							<div class="card setup-content" id="step-1">
								<div class="card-header border text-uppercase h4 font-weight-light border-top-0 border-right-0 border-left-0 text-center">
									REGISTER
								</div>

								<div class="card-body">
									<fieldset class="form-group">
										<div class="row">
											<legend class="col-form-label col-sm-3 pt-0">Pilih Sesi yang ingin diikuti</legend>
											<div class="col-sm-9">
												<?php foreach ($open_sesi as $i): ?>
													<input type="hidden" name="stage" value="<?php echo $i->id ?>">
													<div class="form-check">
														<input class="form-check-input" type="radio" name="job" id="<?php $i->id_job; ?>" value="<?php echo $i->id_job; ?>">
														<label class="form-check-label" for="<?php $i->id_job ?>">
															<?php echo $i->nm_job ?> <br> <?php echo $i->start_stage." - ".$i->end_stage ?>
														</label>
													</div>
												<?php endforeach ?>
											</div>
										</div>
									</fieldset>
								</div>

								<div class="modal-footer">
									<button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
								</div>
							</div>

							<div class="card setup-content" id="step-2">
								<div class="card-header border text-uppercase h4 font-weight-light border-top-0 border-right-0 border-left-0 text-center">
									REGISTER
								</div>

								<div class="card-body">
									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="no_ktp" class="col-sm-4 col-form-label require">No. KTP</label>
												
												<div class="col-sm-8">
													<input type="text" class="form-control" name="no_ktp" id="no_ktp">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="nama_lengkap" class="col-sm-4 col-form-label require">Nama Lengkap</label>
												
												<div class="col-sm-8">
													<input type="text" class="form-control" name="nama_lengkap" id="nama_lengkap">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="email" class="col-sm-4 col-form-label require">Email</label>
												
												<div class="col-sm-8">
													<input type="email" class="form-control" name="email" id="email">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="password" class="col-sm-4 col-form-label require">Password</label>
												
												<div class="col-sm-8">
													<input type="password" class="form-control" name="password" id="password">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label require">Tempat / Tgl Lahir</label>
												
												<div class="col-sm-4">
													<input type="text" class="form-control" name="tempat_lahir" id="tempat_lahir">
												</div>

												<div class="col-sm-4">
													<input type="date" class="form-control" name="tgl_lahir" id="tgl_lahir">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="jenis_kelamin" class="col-sm-4 col-form-label require">Jenis Kelamin</label>
												
												<div class="col-sm-8">
													<select name="jenis_kelamin" id="jenis_kelamin" class="form-control">
														<option selected>Choose...</option>
														<option value="Pria">Pria</option>
														<option value="Wanita">Wanita</option>
													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="agama" class="col-sm-4 col-form-label require">Agama</label>
												
												<div class="col-sm-8">
													<select name="agama" id="agama" class="form-control">
														<option selected>Choose...</option>
														<option value="Buddha">Buddha</option>
														<option value="Hindu">Hindu</option>
														<option value="Islam">Islam</option>
														<option value="Konghucu">Konghucu</option>
														<option value="Kristen">Kristen</option>
													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="address" class="col-sm-4 col-form-label require">Domisili</label>
												
												<div class="col-sm-8">
													<div class="form-group">
														<textarea name="address" id="address" class="form-control"></textarea>
													</div>

													<div class="form-group">
														<div class="row">
															<div class="col-md-6">
																<input type="text" class="form-control" name="kota" id="kota">
																<small class="form-text">Kota</small>

															</div>

															<div class="col-md-6">
																<input type="text" class="form-control" name="pos" id="pos">
																<small class="form-text">Kode Pos</small>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="no_hp" class="col-sm-4 col-form-label require">Nomor Handphone</label>
												
												<div class="col-sm-8">
													<input type="text" class="form-control" name="no_hp" id="no_hp">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="no_telp" class="col-sm-4 col-form-label">Nomor Telepon</label>
												
												<div class="col-sm-8">
													<input type="text" class="form-control" name="no_telp" id="no_telp">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label require">Kerabat yang dapat dihubungi</label>
												
												<div class="col-sm-8">
													<div class="row">
														<div class="col-md-12">
															<div class="form-group row">
																<label for="nama_kerabat" class="col-sm-4 col-form-label require">Nama Kerabat</label>
																
																<div class="col-sm-8">
																	<input type="text" class="form-control" name="nama_kerabat" id="nama_kerabat">
																</div>
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-md-12">
															<div class="form-group row">
																<label for="no_kerabat" class="col-sm-4 col-form-label require">No. Hp / Telp</label>
																
																<div class="col-sm-8">
																	<input type="text" class="form-control" name="no_kerabat" id="no_kerabat">
																</div>
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-md-12">
															<div class="form-group row">
																<label for="hubungan_kerabat" class="col-sm-4 col-form-label require">Hubungan</label>
																
																<div class="col-sm-8">
																	<select name="hubungan_kerabat" id="hubungan_kerabat" class="form-control">
																		<option selected>Choose...</option>
																		<option value="Saudara">Saudara</option>
																		<option value="Sepupu">Sepupu</option>
																		<option value="Teman">Teman</option>
																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="status" class="col-sm-4 col-form-label require">Status Pernikahan</label>
												
												<div class="col-sm-8">
													<select name="status" id="status" class="form-control">
														<option selected>Choose...</option>
														<option value="Lajang">Lajang</option>
														<option value="Menikah">Menikah</option>
													</select>
												</div>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="pendidikan" class="col-sm-4 col-form-label require">Pendidikan Terakhir</label>
												
												<div class="col-sm-8">
													<select name="pendidikan" id="pendidikan" class="form-control">
														<option selected>Choose...</option>
														<option value="SMA">SMA</option>
														<option value="S1">S1</option>
														<option value="S2">S2</option>
														<option value="S3">S3</option>
													</select>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="pengalaman" class="col-sm-4 col-form-label require">Pengalaman</label>
												
												<div class="col-sm-8">
													<input type="number" min="0" class="form-control" name="pengalaman" id="pengalaman">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="kemampuan" class="col-sm-4 col-form-label require">kemampuan</label>
												
												<div class="col-sm-8">
													<button type="button" class="form-control btn btn-outline-secondary" data-toggle="modal" data-target="#addAct">
														<div class="row">
															<div class="col text-left">
																Choose...
															</div>

															<div class="col text-right">
																<i class="fas fa-caret-down"></i>
															</div>
														</div>
													</button>
												</div>
											</div>
										</div>

										<!-- Modal Tambah Admin -->
										<div class="modal fade" id="addAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header bg-info border-0">
														<h5 class="modal-title text-white">Choose Your Ability</h5>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													
													<div class="modal-body p-5">
														<div class="row">
															<?php foreach ($ability as $i): ?>
															<div class="col-md-6">
																<div class="form-check checkbox icheck-info">
																	<input type="checkbox" id="<?php echo $i->nm_ability ?>" name="kemampuan[]" value="<?php echo $i->id_ability ?>">
																	<label for="<?php echo $i->nm_ability ?>"><?php echo $i->nm_ability ?></label>
																</div>
															</div>
															<?php endforeach ?>
														</div>
													</div>

													<div class="modal-footer border-0">
														<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-check"></i> Done</button>
													</div>
												</div>
											</div>
										</div>
										<!-- End Modal -->
									</div>
								</div>

								<div class="modal-footer">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="gridCheck">
										<label class="form-check-label" for="gridCheck">
										Saya menyetujui <a href="#" class="text-primary">syarat dan ketentuan</a> yang berlaku
										</label>
									</div>

									<button type="submit" name="submit" value="register" class="btn btn-success"><i class="far fa-save"></i> Register</button>
								</div>
							</div>
						<?php echo form_close(); ?>
					</div>
					<?php else: ?>
						<h1 class="text-center text-danger">Maaf tidak ada sesi hari ini!</h1>
					<?php endif ?>
				</div>
			</div>
		</div>

		<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/popper.js/popper.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>

		<script>
		$(document).ready(function () {
			var navListItems = $('div.setup-panel div a'),
			allWells = $('.setup-content'),
			allNextBtn = $('.nextBtn');

			allWells.hide();

			navListItems.click(function (e) {
				e.preventDefault();
				var $target = $($(this).attr('href')),
				$item = $(this);

				if (!$item.hasClass('disabled')) {
					navListItems.removeClass('btn-success').addClass('btn-default');
					$item.addClass('btn-success');
					allWells.hide();
					$target.show();
					$target.find('input:eq(0)').focus();
				}
			});

			allNextBtn.click(function () {
				var curStep = $(this).closest(".setup-content"),
				curStepBtn = curStep.attr("id"),
				nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
				curInputs = curStep.find("input[type='text'],input[type='url']"),
				isValid = true;

				$(".form-group").removeClass("has-error");
				for (var i = 0; i < curInputs.length; i++) {
					if (!curInputs[i].validity.valid) {
						isValid = false;
						$(curInputs[i]).closest(".form-group").addClass("has-error");
					}
				}
				if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
			});
			$('div.setup-panel div a.btn-success').trigger('click');
		});
		</script>
	</body>
</html>
