<div class="content">
	<div class="container-fluid">
		<?php foreach ($user as $i):; ?>
			<div class="card">
				<div class="card-header bg-light">
					Detail User : <?php echo $i->full_name; ?> | Posisi yang Dilamar : <?php echo $i->nm_job; ?>
				</div>

				<?php echo form_open('user/update'); ?>
				<div class="card-body">
					<?php echo $this->session->flashdata('msg'); ?>
					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="no_ktp" class="col-sm-4 col-form-label require">No. KTP</label>
								
								<div class="col-sm-8">
									<input type="hidden" name="id_user" value="<?php echo $i->id_user; ?>">
									<input type="number" class="form-control" name="no_ktp" id="no_ktp" value="<?php echo $i->no_ktp; ?>" required>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="nama_lengkap" class="col-sm-4 col-form-label require">Nama Lengkap</label>
								
								<div class="col-sm-8">
									<input type="text" class="form-control" name="nama_lengkap" id="nama_lengkap" value="<?php echo $i->full_name; ?>" required>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="email" class="col-sm-4 col-form-label require">Email</label>
								
								<div class="col-sm-8">
									<input type="email" class="form-control" name="email" id="email" value="<?php echo $i->email; ?>" readonly>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="password" class="col-sm-4 col-form-label">Password</label>
								
								<div class="col-sm-8">
									<input type="password" class="form-control" name="password" id="password">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label class="col-sm-4 col-form-label require">Tempat / Tgl Lahir</label>
								
								<div class="col-sm-4">
									<input type="text" class="form-control" name="tempat_lahir" id="tempat_lahir" value="<?php echo $i->birth_place; ?>" required>
								</div>

								<div class="col-sm-4">
									<input type="date" class="form-control" name="tgl_lahir" id="tgl_lahir" value="<?php echo $i->birth_date; ?>" required>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="jenis_kelamin" class="col-sm-4 col-form-label require">Jenis Kelamin</label>
								
								<div class="col-sm-8">
									<select name="jenis_kelamin" id="jenis_kelamin" class="form-control" required>
										<option value="">Choose...</option>
										<option value="pria" <?php echo ($i->gender === 'pria') ? 'selected' : ''; ?>>Pria</option>
										<option value="wanita" <?php echo ($i->gender === 'wanita') ? 'selected' : ''; ?>>Wanita</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="agama" class="col-sm-4 col-form-label require">Agama</label>
								
								<div class="col-sm-8">
									<select name="agama" id="agama" class="form-control" required>
										<option value="">Choose...</option>
										<option value="buddha" <?php echo ($i->religion === 'buddha') ? 'selected' : ''; ?>>Buddha</option>
										<option value="hindu" <?php echo ($i->religion === 'hindu') ? 'selected' : ''; ?>>Hindu</option>
										<option value="islam" <?php echo ($i->religion === 'islam') ? 'selected' : ''; ?>>Islam</option>
										<option value="konghucu" <?php echo ($i->religion === 'konghucu') ? 'selected' : ''; ?>>Konghucu</option>
										<option value="kristen" <?php echo ($i->religion === 'kristen') ? 'selected' : ''; ?>>Kristen</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="address" class="col-sm-4 col-form-label require">Domisili</label>
								
								<div class="col-sm-8">
									<div class="form-group">
										<textarea name="address" id="address" class="form-control"><?php echo $i->address; ?></textarea>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<input type="text" class="form-control" name="kota" id="kota" value="<?php echo $i->domisili; ?>" required>
												<small class="form-text">Kota</small>

											</div>

											<div class="col-md-6">
												<input type="number" class="form-control" name="pos" id="pos" value="<?php echo $i->kode_pos; ?>" required>
												<small class="form-text">Kode Pos</small>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="no_hp" class="col-sm-4 col-form-label require">Nomor Handphone</label>
								
								<div class="col-sm-8">
									<input type="number" class="form-control" name="no_hp" id="no_hp" value="<?php echo $i->p_number; ?>" required>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="no_telp" class="col-sm-4 col-form-label">Nomor Telepon</label>
								
								<div class="col-sm-8">
									<input type="number" class="form-control" name="no_telp" id="no_telp" value="<?php echo $i->t_number; ?>">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label class="col-sm-4 col-form-label require">Kerabat yang dapat dihubungi</label>
								
								<div class="col-sm-8">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group row">
												<label for="nama_kerabat" class="col-sm-4 col-form-label require">Nama Kerabat</label>
												
												<div class="col-sm-8">
													<input type="text" class="form-control" name="nama_kerabat" id="nama_kerabat" value="<?php echo $i->nama_kerabat; ?>" required>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group row">
												<label for="no_kerabat" class="col-sm-4 col-form-label require">No. Hp / Telp</label>
												
												<div class="col-sm-8">
													<input type="number" class="form-control" name="no_kerabat" id="no_kerabat" value="<?php echo $i->nomor_kerabat; ?>" required>
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
														<option value="saudara" <?php echo ($i->hubungan_kerabat === 'saudara') ? 'selected' : ''; ?>>Saudara</option>
														<option value="sepupu" <?php echo ($i->hubungan_kerabat === 'sepupu') ? 'selected' : ''; ?>>Sepupu</option>
														<option value="teman" <?php echo ($i->hubungan_kerabat === 'teman') ? 'selected' : ''; ?>>Teman</option>
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
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="status" class="col-sm-4 col-form-label require">Status Pernikahan</label>
								
								<div class="col-sm-8">
									<select name="status" id="status" class="form-control">
										<option selected>Choose...</option>
										<option value="lajang" <?php echo ($i->status === 'lajang') ? 'selected' : ''; ?>>Lajang</option>
										<option value="menikah" <?php echo ($i->status === 'menikah') ? 'selected' : ''; ?>>Menikah</option>
									</select>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="pendidikan" class="col-sm-4 col-form-label require">Pendidikan Terakhir</label>
								
								<div class="col-sm-8">
									<select name="pendidikan" id="pendidikan" class="form-control" required>
										<option value="">Choose...</option>
										<option value="sma" <?php echo ($i->last_education === 'sma') ? 'selected' : ''; ?>>SMA</option>
										<option value="akademi" <?php echo ($i->last_education === 'akademi') ? 'selected' : ''; ?>>Akademi</option>
										<option value="sarjana" <?php echo ($i->last_education === 'sarjana') ? 'selected' : ''; ?>>Sarjana</option>
										<option value="pasca" <?php echo ($i->last_education === 'pasca') ? 'selected' : ''; ?>>Pasca</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="pengalaman" class="col-sm-4 col-form-label require">Pengalaman</label>
								
								<div class="col-sm-8">
									<input type="number" min="0" class="form-control" name="pengalaman" id="pengalaman" value="<?php echo $i->experience; ?>" required>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-8 offset-md-2">
							<div class="form-group row">
								<label for="kemampuan" class="col-sm-4 col-form-label require">Total Kemampuan</label>
								
								<div class="col-sm-8">
									<input type="number" min="0" class="form-control" name="kemampuan" id="kemampuan" value="<?php echo $i->total_ability; ?>" required>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card-footer bg-light text-right">
					<div class="form-group">
					<button type="submit" name="submit" value="update" class="btn btn-info"><i class="fas fa-sync-alt"></i> Update</button>
					</div>
				</div>
				<?php echo form_close(); ?>
			</div>
		<?php endforeach; ?>
	</div>
</div>
