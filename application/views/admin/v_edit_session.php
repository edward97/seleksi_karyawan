<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Open Session
					</div>
						
					<?php echo form_open('sesi/edit_act'); ?>
					<div class="card-body">
						<?php echo $this->session->flashdata('msg'); ?>

						<?php foreach ($judul_sesi as $i): ?>
							<!-- Divisi -->
							<div class="row">
								<div class="col-md-3 col-sm-6">
									<div class="form-group">
										<label for="divisi" class="col-form-label require">Divisi</label>
									</div>
								</div>

								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<input type="text" name="divisi" class="form-control" value="<?php echo $i->nm_job ?>" readonly>
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
										<input type="text" name="kualifikasi" class="form-control" value="<?php echo $i->nm_std ?>" readonly>
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
										<input type="text" name="ujian_online" class="form-control" value="<?php echo $i->label_online ?>" readonly>
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
										<input type="text" name="ujian_f2f" class="form-control" value="<?php echo $i->label_f2f ?>" readonly>
									</div>
								</div>
							</div>
						<?php endforeach ?>

						<?php foreach ($edit as $i): ?>
							<?php if ($i->label == 'Tahap 1'): ?>
								<!-- Sesi Pendaftaran -->
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<label class="col-form-label require">Sesi Pendaftaran</label>

											<input type="hidden" name="id_sesi_daftar" value="<?php echo $i->id; ?>">
										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_pendaftaran1" id="sesi_pendaftaran1" value="<?php echo date('Y/m/d H:i', strtotime($i->start_stage)); ?>" class="form-control" <?php echo ($today > $i->start_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_pendaftaran2" id="sesi_pendaftaran2" value="<?php echo date('Y/m/d H:i', strtotime($i->end_stage)); ?>" class="form-control" <?php echo ($today > $i->end_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>
								</div>
							<?php elseif ($i->label == 'Tahap 2'): ?>
								<!-- Sesi Ujian Online -->
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<label class="col-form-label require">Sesi Ujian Online</label>
											<input type="hidden" name="id_sesi_online" value="<?php echo $i->id; ?>">

										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_online1" id="sesi_online1" value="<?php echo date('Y/m/d H:i', strtotime($i->start_stage)); ?>" class="form-control" <?php echo ($today > $i->start_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_online2" id="sesi_online2" value="<?php echo date('Y/m/d H:i', strtotime($i->end_stage)); ?>" class="form-control" <?php echo ($today > $i->end_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>
								</div>
							<?php elseif ($i->label == 'Tahap 3'): ?>
								<!-- Sesi Ujian Tatap Muka -->
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<label class="col-form-label require">Sesi Ujian Tatap Muka</label>
											<input type="hidden" name="id_sesi_f2f" value="<?php echo $i->id; ?>">

										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_tatap1" id="sesi_tatap1" value="<?php echo date('Y/m/d H:i', strtotime($i->start_stage)); ?>" class="form-control" <?php echo ($today > $i->start_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_tatap2" id="sesi_tatap2" value="<?php echo date('Y/m/d H:i', strtotime($i->end_stage)); ?>" class="form-control" <?php echo ($today > $i->end_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>
								</div>
							<?php elseif ($i->label == 'Tahap 4'): ?>
								<!-- Sesi Interview -->
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<label class="col-form-label require">Sesi Interview</label>
											<input type="hidden" name="id_sesi_interview" value="<?php echo $i->id; ?>">

										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_interview1" id="sesi_interview1" value="<?php echo date('Y/m/d H:i', strtotime($i->start_stage)); ?>" class="form-control" <?php echo ($today > $i->start_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>

									<div class="col-md-3 col-sm-4">
										<div class="form-group">
											<input type="text" name="sesi_interview2" id="sesi_interview2" value="<?php echo date('Y/m/d H:i', strtotime($i->end_stage)); ?>" class="form-control" <?php echo ($today > $i->end_stage) ? 'disabled' : 'required'; ?>>
										</div>
									</div>
								</div>
							<?php endif ?>
						<?php endforeach ?>
					</div>

					<div class="card-footer bg-light text-right">
						<div class="form-group">
							<?php foreach ($edit as $i): ?>
								<?php if ($i->label == 'Tahap 4'): ?>
									<button type="submit" name="submit" value="update" class="btn btn-info" <?php echo ($today > $i->end_stage) ? 'disabled' : ''; ?>>
										<i class="fas fa-sync-alt"></i> Update
									</button>
								<?php endif ?>
							<?php endforeach ?>
						</div>
					</div>
					<?php echo form_close(); ?>
				</div>
			</div>
		</div>
	</div>
</div>
