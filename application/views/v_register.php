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

			input[type=number]::-webkit-inner-spin-button, 
			input[type=number]::-webkit-outer-spin-button { 
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;
				margin: 0; 
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
						<a href="<?php echo site_url('login'); ?>"><i class="fa fa-sign-in-alt"></i> Login</a>
					</li>
				</ul>
			</nav>

			<div class="main-container">
				<div class="content">
					<?php if ($cek != 0): ?>
					<div class="container">
						<?php echo $this->session->flashdata('msg'); ?>

						<div class="stepwizard">
							<div class="stepwizard-row setup-panel">
								<div class="stepwizard-step col-xs-3"> 
									<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
									<p><small>Register 1</small></p>
								</div>

								<div class="stepwizard-step col-xs-3"> 
									<a href="#step-2" type="button" class="btn btn-secondary btn-circle">2</a>
									<p><small>Register 2</small></p>
								</div>
							</div>
						</div>
						<?php $attributes = array('onsubmit' => 'return checkForm(this);'); ?>
						<?php echo form_open('register/register_act', $attributes); ?>
							<div class="card setup-content" id="step-1">
								<div class="card-header border text-uppercase h4 font-weight-light border-top-0 border-right-0 border-left-0 text-center">
									REGISTER
								</div>

								<div class="card-body">
									<fieldset class="form-group">
										<div class="row">
											<legend class="col-form-label col-sm-3 pt-0">Pilih Sesi yang ingin diikuti</legend>
											<div class="col-sm-9">
												<?php $count = 0; ?>
												<?php foreach ($open_sesi as $i): ?>
													<?php if ($count == 0): ?>
														<input type="hidden" name="stage" value="<?php echo $i->id; ?>">
														<div class="form-check">
															<input class="form-check-input" type="radio" name="job" id="<?php $i->id_job; ?>" value="<?php echo $i->id_job; ?>" checked>
															<label class="form-check-label" for="<?php $i->id_job; ?>">
																<?php echo $i->nm_job ?> <br> <?php echo $i->start_stage." - ".$i->end_stage ?>
															</label>
														</div>
													<?php else: ?>
														<input type="hidden" name="stage" value="<?php echo $i->id ?>">
														<div class="form-check">
															<input class="form-check-input" type="radio" name="job" id="<?php $i->id_job; ?>" value="<?php echo $i->id_job; ?>">
															<label class="form-check-label" for="<?php $i->id_job; ?>">
																<?php echo $i->nm_job ?> <br> <?php echo $i->start_stage." - ".$i->end_stage ?>
															</label>
														</div>
													<?php endif ?>
													
													<?php $count++; ?>
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
													<input type="number" class="form-control" name="no_ktp" id="no_ktp" maxlength="16" oninput="maxLengthCheck(this)" required>
													<small class="form-text">16 digits</small>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="nama_lengkap" class="col-sm-4 col-form-label require">Nama Lengkap</label>
												
												<div class="col-sm-8">
													<input type="text" class="form-control" name="nama_lengkap" id="nama_lengkap" required>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="email" class="col-sm-4 col-form-label require">Email</label>
												
												<div class="col-sm-8">
													<input type="email" class="form-control" name="email" id="email" required>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="password" class="col-sm-4 col-form-label require">Password</label>
												
												<div class="col-sm-8">
													<input type="password" class="form-control" name="password" id="password" minlength="8" required>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label require">Tempat / Tgl Lahir</label>
												
												<div class="col-sm-4">
													<input type="text" class="form-control" name="tempat_lahir" id="tempat_lahir" required>
												</div>

												<div class="col-sm-4">
													<input type="date" class="form-control" name="tgl_lahir" id="tgl_lahir" min="1968-01-01" max="2000-12-30" required>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="jenis_kelamin" class="col-sm-4 col-form-label require">Jenis Kelamin</label>
												
												<div class="col-sm-8">
													<select name="jenis_kelamin" id="jenis_kelamin" class="form-control" required>
														<option value="">Choose...</option>
														<option value="pria">Pria</option>
														<option value="wanita">Wanita</option>
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
													<select name="agama" id="agama" class="form-control" required>
														<option value="">Choose...</option>
														<option value="buddha">Buddha</option>
														<option value="hindu">Hindu</option>
														<option value="islam">Islam</option>
														<option value="konghucu">Konghucu</option>
														<option value="kristen">Kristen</option>
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
														<textarea name="address" id="address" class="form-control" required></textarea>
													</div>

													<div class="form-group">
														<div class="row">
															<div class="col-md-6">
																<input type="text" class="form-control" name="kota" id="kota" required>
																<small class="form-text">Kota</small>

															</div>

															<div class="col-md-6">
																<input type="number" class="form-control" name="pos" id="pos" min="0" maxlength="5" oninput="maxLengthCheck(this)" required>
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
													<input type="number" class="form-control" name="no_hp" id="no_hp" maxlength="12" oninput="maxLengthCheck(this)" required>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 offset-md-3">
											<div class="form-group row">
												<label for="no_telp" class="col-sm-4 col-form-label">Nomor Telepon</label>
												
												<div class="col-sm-8">
													<input type="number" class="form-control" name="no_telp" id="no_telp" maxlength="10" oninput="maxLengthCheck(this)">
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
																	<input type="text" class="form-control" name="nama_kerabat" id="nama_kerabat" required>
																</div>
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-md-12">
															<div class="form-group row">
																<label for="no_kerabat" class="col-sm-4 col-form-label require">No. Hp / Telp</label>
																
																<div class="col-sm-8">
																	<input type="number" class="form-control" name="no_kerabat" id="no_kerabat" minlength = "6" maxlength="12" oninput="maxLengthCheck(this)" required>
																</div>
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-md-12">
															<div class="form-group row">
																<label for="hubungan_kerabat" class="col-sm-4 col-form-label require">Hubungan</label>
																
																<div class="col-sm-8">
																	<select name="hubungan_kerabat" id="hubungan_kerabat" class="form-control" required>
																		<option value="">Choose...</option>
																		<option value="saudara">Saudara</option>
																		<option value="sepupu">Sepupu</option>
																		<option value="teman">Teman</option>
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
														<option value="lajang">Lajang</option>
														<option value="menikah">Menikah</option>
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
													<select name="pendidikan" id="pendidikan" class="form-control" required>
														<option value="">Choose...</option>
														<option value="sma">SMA</option>
														<option value="akademi">Akademi</option>
														<option value="sarjana">Sarjana</option>
														<option value="pasca">Pasca</option>
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
													<input type="number" class="form-control" name="pengalaman" id="pengalaman" minlength = "2" maxlength="2" oninput="maxLengthCheck(this)" required>

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

										<!-- Modal Tambah Ability -->
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
														<small class="form-text">Min : 5 | Max : 10</small>
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
										<input class="form-check-input" type="checkbox" name="terms" id="gridCheck">
										<label class="form-check-label" for="gridCheck">
										Saya menyetujui <a href="#" class="text-primary">syarat dan ketentuan</a> yang berlaku
										</label>
									</div>

									<button type="submit" id="submit" name="submit" value="register" class="btn btn-success"><i class="far fa-save"></i> Register</button>
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
		document.getElementById("submit").onclick = function () {
			if (CheckBoxCount()) {
				document.forms[0].submit();
			};
		};
		
		function CheckBoxCount() {
			var inputList = document.getElementsByTagName("input");
			var numChecked = 0;

			for (var i = 0; i < inputList.length; i++) {
				if (inputList[i].type == "checkbox" && inputList[i].checked) {
					numChecked = numChecked + 1;
				}
			}
			if (numChecked < 5) {
				alert("Minimum Kemampuan 5!");
				form.terms.focus();
				return false;
			}
			// else if (numChecked > 3) {
			//     alert("Maximum 3 !"); return false;
			// }
			// alert("selected count: " + numChecked);
		}

		$("input[name='kemampuan[]']").change(function(){
			var max= 10;
			x = $("input[name='kemampuan[]']:checked").length;
			if( $("input[name='kemampuan[]']:checked").length == max ){
				$("input[name='kemampuan[]']").attr('disabled', 'disabled');
				$("input[name='kemampuan[]']:checked").removeAttr('disabled');
			}else{
				$("input[name='kemampuan[]']").removeAttr('disabled');
			}
		});

		function checkForm(form) {
			if (!form.terms.checked) {
				alert("Please that you accept the Terms and Conditions");
				form.terms.focus();
				return false;
			}
		};

		function maxLengthCheck(object) {
			if (object.value.length > object.maxLength)
			object.value = object.value.slice(0, object.maxLength)
		};

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
					navListItems.removeClass('btn-success').addClass('btn-secondary');
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
