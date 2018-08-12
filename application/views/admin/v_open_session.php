<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Open Session
					</div>
						
					<?php echo form_open('sesi/save_act'); ?>
					<div class="card-body">
						<?php echo $this->session->flashdata('msg'); ?>
						<!-- Partisipasi admin -->
						<div class="row">
							<div class="col-md-9">
								<div class="table-responsive">
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th>ID</th>
												<th>Nama Admin</th>
												<th>Keterangan</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>
											<?php foreach ($temp_admin as $i): ?>
											<tr>
												<td><?php echo $i->id ?></td>
												<td><?php echo $i->nm_admin ?></td>
												<td><?php echo $i->keterangan ?></td>
												<td>
													<a class="btn btn-outline-danger btn-sm" href="<?php echo site_url('sesi/delete/'.$i->id); ?>" onclick="return confirmDialog();">
														<i class="fa fa-trash-alt" aria-hidden="true"></i> Delete
													</a>
												</td>
											</tr>
											<?php endforeach ?>

											<tr>
												<td colspan="4" class="text-right">
													<a class="btn btn-outline-success btn-sm" href="#" data-toggle="modal" data-target="#editAct">
														<i class="fa fa-plus" aria-hidden="true"></i> Add
													</a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<!-- Divisi -->
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="form-group">
									<label for="divisi" class="col-form-label require">Divisi</label>
								</div>
							</div>

							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<select name="divisi" id="divisi" class="form-control" required>
										<option value="">Choose...</option>
										<?php foreach ($job as $i): ?>
											<option value="<?php echo $i->id_job; ?>"><?php echo $i->nm_job; ?></option>
										<?php endforeach ?>
									</select>
								</div>
							</div>
						</div>

						<!-- Pilih Kualifikasi -->
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="form-group">
									<label for="kualifikasi" class="col-form-label require">Pilih Kualifikasi</label>
								</div>
							</div>

							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<select name="kualifikasi" id="kualifikasi" class="form-control" required>
										<option value="">Choose...</option>
										<?php foreach ($kualifikasi as $i): ?>
											<option value="<?php echo $i->id_std; ?>"><?php echo $i->nm_std; ?></option>
										<?php endforeach ?>
									</select>
								</div>
							</div>
						</div>

						<!-- Pilih Soal Ujian Online -->
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="form-group">
									<label for="ujian_online" class="col-form-label require">Pilih Soal Ujian Online</label>
								</div>
							</div>

							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<select name="ujian_online" id="ujian_online" class="form-control" required>
										<option value="">Choose...</option>
										<?php foreach ($s_online as $i): ?>
											<option value="<?php echo $i->label; ?>"><?php echo $i->label; ?></option>
										<?php endforeach ?>
									</select>
								</div>
							</div>
						</div>

						<!-- Pilih Soal Ujian Tatap Muka -->
						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="form-group">
									<label for="ujian_f2f" class="col-form-label require">Pilih Soal Ujian Tatap Muka</label>
								</div>
							</div>

							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<select name="ujian_f2f" id="ujian_f2f" class="form-control" required>
										<option value="">Choose...</option>
										<?php foreach ($s_f2f as $i): ?>
											<option value="<?php echo $i->label; ?>"><?php echo $i->label; ?></option>
										<?php endforeach ?>
									</select>
								</div>
							</div>
						</div>

						<!-- Sesi Pendaftaran -->
						<div class="row">
							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<label class="col-form-label require">Sesi Pendaftaran</label>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_pendaftaran1" id="sesi_pendaftaran1" class="form-control" required>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_pendaftaran2" id="sesi_pendaftaran2" class="form-control" required>
								</div>
							</div>
						</div>

						<!-- Sesi Ujian Online -->
						<div class="row">
							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<label class="col-form-label require">Sesi Ujian Online</label>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_online1" id="sesi_online1" class="form-control" required>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_online2" id="sesi_online2" class="form-control" required>
								</div>
							</div>
						</div>

						<!-- Sesi Ujian Tatap Muka -->
						<div class="row">
							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<label class="col-form-label require">Sesi Ujian Tatap Muka</label>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_tatap1" id="sesi_tatap1" class="form-control" required>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_tatap2" id="sesi_tatap2" class="form-control" required>
								</div>
							</div>
						</div>

						<!-- Sesi Interview -->
						<div class="row">
							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<label class="col-form-label require">Sesi Interview</label>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_interview1" id="sesi_interview1" class="form-control" required>
								</div>
							</div>

							<div class="col-md-3 col-sm-4">
								<div class="form-group">
									<input type="date" name="sesi_interview2" id="sesi_interview2" class="form-control" required>
								</div>
							</div>
						</div>
					</div>

					<div class="card-footer bg-light text-right">
						<div class="form-group">
							<button type="submit" name="submit" value="save" class="btn btn-success">
								<i class="far fa-save"></i> Save
							</button>
						</div>
					</div>
					<?php echo form_close(); ?>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Modal Tambah Admin -->
<div class="modal fade" id="editAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<?php echo form_open('sesi/edit'); ?>
				<div class="modal-header bg-success border-0">
					<h5 class="modal-title text-white">Add Admin</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="admin" class="require">Name</label>

								<select name="admin" id="admin" class="form-control" required>
									<option value="">Choose...</option>
									<?php foreach ($admin as $i): ?>
										<option value="<?php echo $i->id_admin; ?>"><?php echo "ID[".$i->id_admin."] - ".$i->nm_admin; ?></option>
									<?php endforeach ?>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="keterangan">Keterangan</label>
								<input type="text" name="keterangan" id="keterangan" class="form-control" required>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
					<button type="submit" name="submit" value="save" class="btn btn-success"><i class="far fa-save"></i> Save</button>
				</div>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>