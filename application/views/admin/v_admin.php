<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						List Admin

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addAct">
								<i class="fa fa-plus"></i> Admin
							</a>
						</div>
					</div>

					<div class="card-body">
						<?php echo $this->session->flashdata('msg_admin') ?>

						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nama Admin</th>
										<th>Email</th>
										<th>Level</th>
										<th>Partisipasi</th>
										<th>Keterangan</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<?php foreach ($admin as $i): ?>
									<tr>
										<td><?php echo $i->id_admin ?></td>
										<td><?php echo $i->nm_admin ?></td>
										<td><?php echo $i->email ?></td>
										<td><?php echo $i->level ?></td>
										<td><?php echo $i->status_partisipasi ?></td>
										<td><?php echo $i->keterangan ?></td>
										<td>
											<a
												href="javascript:;" 
												data-id="<?php echo $i->id_admin ?>" 
												data-nama="<?php echo $i->nm_admin ?>" 
												data-email="<?php echo $i->email ?>" 
												data-level="<?php echo $i->level ?>" 
												data-partisipasi="<?php echo $i->status_partisipasi ?>" 
												data-keterangan="<?php echo $i->keterangan ?>" 
												data-toggle="modal" data-target="#editAct" 
												class="btn btn-outline-info btn-sm">
													<i class="fa fa-edit" aria-hidden="true"></i> Edit
											</a>
											
											<a class="btn btn-outline-danger btn-sm" href="<?php echo site_url('admin/delete/').$i->id_admin ?>" onclick="return confirmDialog();"><i class="fa fa-trash-alt" aria-hidden="true"></i> Delete</a>
										</td>
									</tr>
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

<!-- Modal Tambah Admin -->
<div class="modal fade" id="addAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<?php echo form_open('admin/add_act'); ?>
				<div class="modal-header bg-success border-0">
					<h5 class="modal-title text-white">Add Admin</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" name="id" id="id" class="form-control" readonly>
							</div>
						</div>

						<div class="col-md-5">
							<div class="form-group">
								<label for="email" class="require">Email</label>
								<input type="email" name="email" id="email" class="form-control" required>
							</div>
						</div>

						<div class="col-md-5">
							<div class="form-group">
								<label for="password" class="require">Password</label>
								<input type="password" name="password" id="password" class="form-control" required>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="username" class="require">Name</label>
								<input type="text" name="username" id="username" class="form-control" required>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="level" class="require">Level</label>
								<input type="text" name="level" id="level" class="form-control" required>
								<small class="form-text">[ 1 => superadmin, 2 => admin ]</small>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="partisipasi" class="require">Status Partisipasi</label>
								<input type="text" name="partisipasi" id="partisipasi" class="form-control" required>
								<small class="form-text">[ 0 => Non-Active, 1 => Active ]</small>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="keterangan">Keterangan</label>
								<input type="text" name="keterangan" id="keterangan" class="form-control" required>
								<small class="form-text">[ HRD, Logistic, etc. ]</small>
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

<!-- Modal Update Admin -->
<div class="modal fade" id="editAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<?php echo form_open('admin/update_act'); ?>
				<div class="modal-header bg-info border-0">
					<h5 class="modal-title text-white">Update Admin</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" name="id" id="id" class="form-control" readonly>
							</div>
						</div>

						<div class="col-md-5">
							<div class="form-group">
								<label for="email" class="require">Email</label>
								<input type="email" name="email" id="email" class="form-control" required>
							</div>
						</div>

						<div class="col-md-5">
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" name="password" id="password" class="form-control">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="username" class="require">Name</label>
								<input type="text" name="username" id="username" class="form-control" required>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="level" class="require">Level</label>
								<input type="text" name="level" id="level" class="form-control" required>
								<small class="form-text">[ 1 => superadmin, 2 => admin ]</small>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="partisipasi" class="require">Status Partisipasi</label>
								<input type="text" name="partisipasi" id="partisipasi" class="form-control" required>
								<small class="form-text">[ 0 => Non-Active, 1 => Active ]</small>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="keterangan">Keterangan</label>
								<input type="text" name="keterangan" id="keterangan" class="form-control" required>
								<small class="form-text">[ HRD, Logistic, etc. ]</small>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
					<button type="submit" name="submit" value="update" class="btn btn-info"><i class="fas fa-sync-alt"></i> Update</button>
				</div>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>
