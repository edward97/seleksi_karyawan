<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						List User
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>No. KTP</th>
										<th>Email</th>
										<th>Nama Lengkap</th>
										<th>Job Dilamar</th>
										<th>No. Hp / Telp</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<?php $no = 1; ?>
									<?php foreach ($user as $i): ?>
									<tr>
										<td><?php echo $no; ?></td>
										<td><?php echo $i->id_user ?></td>
										<td><?php echo $i->no_ktp ?></td>
										<td><?php echo $i->email ?></td>
										<td><?php echo $i->full_name ?></td>
										<td><?php echo $i->nm_job ?></td>
										<td><?php echo $i->p_number ?></td>
										<td>
											<a
												href="javascript:;" 
												data-id="<?php echo $i->id_user ?>" 
												data-nama="<?php echo $i->no_ktp ?>" 
												data-email="<?php echo $i->email ?>" 
												data-email="<?php echo $i->full_name ?>" 
												data-profesi="<?php echo $i->nm_job ?>" 
												data-profesi="<?php echo $i->p_number ?>" 
												data-toggle="modal" data-target="#editAct" 
												class="btn btn-outline-info btn-sm">
													<i class="fas fa-info-circle"></i> Detail
											</a>
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

<!-- Modal Detail User -->
<div class="modal fade" id="editAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info border-0">
				<h5 class="modal-title text-white">Detail User</h5>
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
							<label for="tahap">Status Tahap</label>
							<input type="text" name="tahap" id="tahap" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="no_ktp">No Ktp</label>
							<input type="text" name="no_ktp" id="no_ktp" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="posisi">Posisi yang Dilamar</label>
							<input type="text" name="posisi" id="posisi" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="nm_lengkap">Nama Lengkap</label>
							<input type="text" name="nm_lengkap" id="nm_lengkap" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group">
							<label for="email">Email</label>
							<input type="text" name="email" id="email" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="tp_lahir">Tempat Lahir</label>
							<input type="text" name="tp_lahir" id="tp_lahir" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group">
							<label for="tgl_lahir">Tanggal Lahir</label>
							<input type="text" name="tgl_lahir" id="tgl_lahir" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<textarea name="address" id="address" class="form-control"></textarea>
						</div>
					</div>

					<div class="col-md-3">
						<input type="text" class="form-control" name="kota" id="kota" required>
						<small class="form-text">Kota</small>

					</div>

					<div class="col-md-3">
						<input type="text" class="form-control" name="pos" id="pos" required>
						<small class="form-text">Kode Pos</small>
					</div>
				</div>
			</div>

			<div class="modal-footer border-0">
				<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
			</div>
		</div>
	</div>
</div>
