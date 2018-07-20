<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Input Nilai Interview
					</div>

					<div class="card-body">
						<?php echo $this->session->flashdata('msg_interview') ?>

						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>ID User</th>
										<th>ID Stage</th>
										<th>nama Lengkap</th>
										<th>Nilai Ujian Online</th>
										<th>Nilai Ujian Tatap Muka</th>
										<th>Nilai Sikap</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<?php $no = 1; ?>
									<?php foreach ($usr as $i): ?>
									<tr>
										<td><?php echo $no ?></td>
										<td><?php echo $i->id_user ?></td>
										<td><?php echo $i->id_stage_detail ?></td>
										<td><?php echo $i->full_name ?></td>
										<td><?php echo $i->nilai_online ?></td>
										<td><?php echo $i->nilai_f2f ?></td>
										<td><?php echo $i->nilai_sikap ?></td>

										<?php if ($i->nilai_f2f != null): ?>
											<td>
												<a
													href="javascript:;" 
													data-id="<?php echo $i->id_user ?>" 
													data-nama="<?php echo $i->full_name ?>" 
													data-stage="<?php echo $i->id_stage_detail ?>" 
													data-sikap="<?php echo $i->nilai_sikap ?>" 
													data-toggle="modal" data-target="#editItv" 
													class="btn btn-outline-info btn-sm">
														<i class="fa fa-edit" aria-hidden="true"></i> Edit
												</a>
											</td>
										<?php else: ?>
											<td>
												<button type="button" class="btn btn-outline-info btn-sm" disabled><i class="fa fa-edit" aria-hidden="true"></i> Edit</button>
											</td>
										<?php endif ?>
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


<!-- Modal Update Admin -->
<div class="modal fade" id="editItv" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<?php echo form_open('interview/update_act'); ?>
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

						<div class="col-md-2">
							<div class="form-group">
								<label for="id_stage">ID Stage</label>
								<input type="text" name="id_stage" id="id_stage" class="form-control" readonly>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group">
								<label for="username">Name</label>
								<input type="text" name="username" id="username" class="form-control" readonly>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group">
								<label for="n_sikap" class="require">Nilai Sikap</label>
								<input type="text" name="n_sikap" id="n_sikap" class="form-control">
								<small class="form-text">[ Cukup Baik, Baik, Sangat Baik ]</small>
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