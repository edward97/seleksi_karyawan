<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header bg-light">
						List Abilities

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addAbt">
								<i class="fa fa-plus"></i> Ability
							</a>
						</div>
					</div>

					<div class="card-body">
						<?php echo $this->session->flashdata('msg_ability') ?>

						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>Ability</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<?php $no = 1; ?>
									<?php foreach ($ability as $i): ?>
									<tr>
										<td><?php echo $no; ?></td>
										<td><?php echo $i->id_ability; ?></td>
										<td><?php echo $i->nm_ability; ?></td>
										<td class="text-nowrap">
											<a
												href="javascript:;" 
												data-id="<?php echo $i->id_ability ?>" 
												data-nama="<?php echo $i->nm_ability ?>" 
												data-toggle="modal" data-target="#edit-ability" 
												class="btn btn-outline-info btn-sm">
													<i class="fa fa-edit" aria-hidden="true"></i> Edit
											</a>

											<?php if ($this->session->userdata('akses') == '1'): ?>
												<a class="btn btn-outline-danger btn-sm" href="<?php echo site_url('setting/delete_act_abt/').$i->id_ability ?>" onclick="return confirmDialog();"><i class="fa fa-trash-alt" aria-hidden="true"></i> Delete</a>
											<?php endif ?>
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

			<div class="col-md-6">
				<div class="card">
					<div class="card-header bg-light">
						List Jobs

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addJob">
								<i class="fa fa-plus"></i> Job
							</a>
						</div>
					</div>

					<div class="card-body">
						<?php echo $this->session->flashdata('msg_job') ?>

						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>Job</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<?php $no = 1; ?>
									<?php foreach ($job as $i): ?>
									<tr>
										<td><?php echo $no; ?></td>
										<td><?php echo $i->id_job; ?></td>
										<td><?php echo $i->nm_job; ?></td>
										<td class="text-nowrap">
											<a
												href="javascript:;" 
												data-id="<?php echo $i->id_job ?>" 
												data-nama="<?php echo $i->nm_job ?>" 
												data-toggle="modal" data-target="#edit-job" 
												class="btn btn-outline-info btn-sm">
													<i class="fa fa-edit" aria-hidden="true"></i> Edit
											</a>

											<?php if ($this->session->userdata('akses') == '1'): ?>
												<a class="btn btn-outline-danger btn-sm" href="<?php echo site_url('setting/delete_act_job/').$i->id_job ?>" onclick="return confirmDialog();"><i class="fa fa-trash-alt" aria-hidden="true"></i> Delete</a>
											<?php endif ?>
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

<!-- Modal Tambah Ability -->
<div class="modal fade" id="addAbt" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<?php echo form_open('setting/add_act_abt'); ?>
				<div class="modal-header bg-success border-0">
					<h5 class="modal-title text-white">Add Ability</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" name="id" id="id" class="form-control" value="[Auto]" disabled>
							</div>
						</div>

						<div class="col-md-9">
							<div class="form-group">
								<label for="nm_abt" class="require">Name Ability</label>
								<input type="text" name="nm_abt" id="nm_abt" class="form-control" required>
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

<!-- Modal Tambah Job -->
<div class="modal fade" id="addJob" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<?php echo form_open('setting/add_act_job'); ?>
				<div class="modal-header bg-success border-0">
					<h5 class="modal-title text-white">Add Job</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" name="id" id="id" class="form-control" value="[Auto]" disabled>
							</div>
						</div>

						<div class="col-md-9">
							<div class="form-group">
								<label for="nm_job" class="require">Name Job</label>
								<input type="text" name="nm_job" id="nm_job" class="form-control" required>
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

<!-- Modal Update Ability -->
<div class="modal fade" id="edit-ability" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<?php echo form_open('setting/update_act_abt'); ?>
				<div class="modal-header bg-info border-0">
					<h5 class="modal-title text-white">Add Ability</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" name="id" id="id" class="form-control" readonly>
							</div>
						</div>

						<div class="col-md-9">
							<div class="form-group">
								<label for="nm_abt" class="require">Update Ability</label>
								<input type="text" name="nm_abt" id="nm_abt" class="form-control" required>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
					<button type="submit" name="submit" value="save" class="btn btn-info"><i class="fas fa-sync-alt"></i> Update</button>
				</div>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>

<!-- Modal Update Job -->
<div class="modal fade" id="edit-job" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<?php echo form_open('setting/update_act_job'); ?>
				<div class="modal-header bg-info border-0">
					<h5 class="modal-title text-white">Update Job</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label for="id">ID</label>
								<input type="text" name="id" id="id" class="form-control" readonly>
							</div>
						</div>

						<div class="col-md-9">
							<div class="form-group">
								<label for="nm_job" class="require">Name Job</label>
								<input type="text" name="nm_job" id="nm_job" class="form-control" required>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
					<button type="submit" name="submit" value="save" class="btn btn-info"><i class="fas fa-sync-alt"></i> Update</button>
				</div>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>