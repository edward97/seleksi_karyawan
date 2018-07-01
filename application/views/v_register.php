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

		<script type="text/javascript">
			function confirmDialog() {
				return confirm('Are you sure want to delete this record?')
			}
		</script>
	</head>
	<body class="sidebar-hidden header-fixed">
		<div class="page-wrapper">
			<nav class="navbar page-header">
				<a class="navbar-brand" href="#">
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
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-header border text-uppercase h4 font-weight-light border-top-0 border-right-0 border-left-0 text-center">
										REGISTER
									</div>

									<?php echo form_open('register/register_act'); ?>
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
													<label for="pasword" class="col-sm-4 col-form-label require">Password</label>
													
													<div class="col-sm-8">
														<input type="password" class="form-control" name="pasword" id="pasword">
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
															<option value="Saudara">Lajang</option>
															<option value="Sepupu">Menikah</option>
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
															<option value="Saudara">SMA</option>
															<option value="Sepupu">S1</option>
															<option value="Teman">S2</option>
															<option value="Teman">S3</option>
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
													<label for="job_required" class="col-sm-4 col-form-label require">Dibutuhkan Posisi</label>
													
													<div class="col-sm-8">
														<select name="job_required" id="job_required" class="form-control">
															<option selected>Choose...</option>
															<option value="1">IT</option>
															<option value="2">ADMIN</option>
															<option value="3">LOGISTIK</option>
															<option value="4">ADM PIUTANG</option>
														</select>
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
									<?php echo form_close(); ?>
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
