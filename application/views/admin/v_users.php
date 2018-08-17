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
												data-ktp="<?php echo $i->no_ktp ?>" 
												data-email="<?php echo $i->email ?>" 
												data-nm_lengkap="<?php echo $i->full_name ?>" 
												data-nm_profesi="<?php echo $i->nm_job ?>" 
												data-tahap="<?php echo $i->label ?>" 
												data-tp_lahir="<?php echo $i->birth_place ?>" 
												data-tgl_lahir="<?php echo $i->birth_date ?>" 
												data-address="<?php echo $i->address ?>" 
												data-kota="<?php echo $i->domisili ?>" 
												data-pos="<?php echo $i->kode_pos ?>" 
												data-umur="<?php echo $i->age ?>" 
												data-jenis_kelamin="<?php echo $i->gender ?>" 
												data-last_education="<?php echo $i->last_education ?>" 
												data-religion="<?php echo $i->religion ?>" 
												data-status="<?php echo $i->status ?>" 
												data-experience="<?php echo $i->experience ?>" 
												data-total_ability="<?php echo $i->total_ability ?>" 
												data-nm_kerabat="<?php echo $i->nama_kerabat ?>" 
												data-telp_kerabat="<?php echo $i->nomor_kerabat ?>" 
												data-hubungan_kerabat="<?php echo $i->hubungan_kerabat ?>" 
												data-toggle="modal" data-target="#edit-user" 
												class="btn btn-outline-primary btn-sm">
													<i class="fa fa-info-circle" aria-hidden="true"></i> Detail
											</a>

											<?php if ($this->session->userdata('akses') ==  '1'): ?>
												<a href="user/edit/<?php echo $i->id_user; ?>" class="btn btn-outline-info btn-sm"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>
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

<!-- Modal Detail User -->
<div class="modal fade" id="edit-user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
							<label for="tahap">Tahap</label>
							<input type="text" name="tahap" id="tahap" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="ktp">No Ktp</label>
							<input type="text" name="ktp" id="ktp" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="nm_profesi">Posisi yang Dilamar</label>
							<input type="text" name="nm_profesi" id="nm_profesi" class="form-control" readonly>
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
							<input type="date" name="tgl_lahir" id="tgl_lahir" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label for="address">Alamat</label>
							<textarea name="address" id="address" class="form-control" readonly></textarea>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label for="kota">Kota</label>
							<input type="text" name="kota" id="kota" class="form-control" readonly>
						</div>

					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label for="pos">Kode Pos</label>
							<input type="text" name="pos" id="pos" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label for="umur">Umur</label>
							<input type="text" name="umur" id="umur" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="jenis_kelamin">Jenis Kelamin</label>
							<input type="text" name="jenis_kelamin" id="jenis_kelamin" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="last_education">Pendidikan Terakhir</label>
							<input type="text" name="last_education" id="last_education" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label for="religion">Agama</label>
							<input type="text" name="religion" id="religion" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label for="status">Status</label>
							<input type="text" name="status" id="status" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label for="experience">Pengalaman</label>
							<input type="text" name="experience" id="experience" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group">
							<label for="total_ability">Total Kemampuan</label>
							<input type="text" name="total_ability" id="total_ability" class="form-control" readonly>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label for="nm_kerabat">Nama Kerabat</label>
							<input type="text" name="nm_kerabat" id="nm_kerabat" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="telp_kerabat">No Telp Kerabat</label>
							<input type="text" name="telp_kerabat" id="telp_kerabat" class="form-control" readonly>
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<label for="hubungan_kerabat">Hubungan</label>
							<input type="text" name="hubungan_kerabat" id="hubungan_kerabat" class="form-control" readonly>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer border-0">
				<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
			</div>
		</div>
	</div>
</div>
