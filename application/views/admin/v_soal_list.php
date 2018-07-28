<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Label Soal Ujian

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addAct">
								<i class="fa fa-plus"></i>
								<i class="fa fa-pencil-alt"></i>
							</a>
						</div>
					</div>

					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<p class="text-center">List Soal Ujian Online</p>

								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>No</th>
												<th>Nama Soal</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>
											<?php $no = 1; ?>
											<?php foreach ($s_online as $i): ?>
												<tr>
													<td><?php echo $no; ?></td>
													<td><?php echo $i->label; ?></td>
													<td>
														<a href="" class="btn btn-outline-info btn-sm"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>
														<a class="btn btn-outline-danger btn-sm" href="<?php echo site_url('soal/delete_onl/').$i->label; ?>" onclick="return confirmDialog();"><i class="fa fa-trash-alt" aria-hidden="true"></i> Delete</a>
													</td>
												</tr>
												<?php $no++; ?>
											<?php endforeach ?>
										</tbody>
									</table>
								</div>	
							</div>

							<div class="col-md-6">
								<p class="text-center">List Soal Ujian Tatap Muka</p>
								
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>No</th>
												<th>Nama Soal</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>
											<?php $no = 1; ?>
											<?php foreach ($s_f2f as $i): ?>
												<tr>
													<td><?php echo $no; ?></td>
													<td><?php echo $i->label; ?></td>
													<td>
														<a href="" class="btn btn-outline-info btn-sm"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>
														<a class="btn btn-outline-danger btn-sm" href="<?php echo site_url('soal/delete_f2f/').$i->label; ?>" onclick="return confirmDialog();"><i class="fa fa-trash-alt" aria-hidden="true"></i> Delete</a>
													</td>
												</tr>
												<?php $no++; ?>
											<?php endforeach ?>
										</tbody>
									</table>
								</div>	
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal Tambah Soal Online -->
<div class="modal fade" id="addAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<?php echo form_open('soal/next'); ?>
				<div class="modal-header bg-success border-0">
					<h5 class="modal-title text-white">Add Label Question</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label for="label" class="col-form-label require">Nama Soal Ujian</label>
							</div>
						</div>
						
						<div class="col-md-7">
							<div class="form-group">
								<input type="text" name="label" id="label" class="form-control" required>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label for="divisi" class="require">Divisi</label>
							</div>
						</div>

						<div class="col-md-7">
							<div class="form-group">
								<select name="divisi" id="divisi" class="form-control" required>
									<option value="">Choose...</option>
								<?php foreach ($divisi as $i): ?>
									<option value="<?php echo $i->id_job ?>"><?php echo $i->nm_job ?></option>
								<?php endforeach ?>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label for="jenis_ujian" class="col-form-label require">Jenis Ujian</label>
							</div>
						</div>
						
						<div class="col-md-7">
							<div class="form-group">
								<select name="jenis_ujian" id="jenis_ujian" class="form-control" required>
									<option value="">Choose...</option>
									<option value="ujian_online">Ujian Online</option>
									<option value="ujian_f2f">Ujian Tatap Muka</option>
								</select>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer border-0">
					<button type="reset" name="reset" class="btn btn-warning"><i class="far fa-trash-alt"></i> Reset</button>
					<button type="submit" name="submit" value="save" class="btn btn-success"><i class="far fa-save"></i> Save</button>
				</div>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>