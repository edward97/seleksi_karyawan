<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<?php echo $this->session->flashdata('msg'); ?>

				<div class="card">
					<div class="card-header bg-light">
						<div class="row">
							<div class="col-md-6">
								<p>Dashboard Session</p>
							</div>

							<div class="col-md-6">
								<p>Terdapat <span class="font-weight-bold text-primary"><?php echo $seleksi_aktif; ?></span> sesi aktif saat ini!</p>
							</div>
						</div>

					</div>

					<div class="card-body">
						<?php foreach ($seleksi_aktif_ar as $i): ?>
							<div class="card">
								<div class="card-header bg-light">
									<div class="row">
										<div class="col-md-6">
											<a class="card-link font-weight-bold" data-toggle="collapse" href="#collapse<?php echo $i->id_stage; ?>">
												Session <?php echo 'ID '.$i->id_stage.' | '.$i->nm_job; ?> &nbsp;<i class="fas fa-angle-down"></i>
											</a>
										</div>

										<div class="col-md-6 text-right">
											<?php if ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1'): ?>
												<a href="sesi/edit_sesi/<?php echo $i->id_stage; ?>" class="btn btn-outline-info"><i class="fa fa-edit" aria-hidden="true"></i> Edit</a>
											<?php endif ?>

											<!-- hanya dapat closing jika waktu sudah melewati batas tahap 4 -->
											<?php foreach ($seleksi_aktif_ar_detail as $j): ?>
												<?php if ($j->id_stage == $i->id_stage && $j->label == 'Tahap 4' && $j->end_stage < $today && ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1')): ?>
													<a href="sesi/closing/<?php echo $i->id_stage; ?>" class="btn btn-success">Close Session</a>
												<?php endif; ?>
											<?php endforeach ?>
										</div>
									</div>
								</div>

								<!-- <div id="" class="collapse show"> -->
								<div id="collapse<?php echo $i->id_stage; ?>" class="collapse show">
									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<p class="text-success">Tahapan Registrasi</p>
											</div>

											<div class="col-md-2">
												<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total_register; ?></a>
											</div>

											<div class="col-md-4">
												orang telah melakukan registrasi
											</div>

											<div class="col-md-6 text-right">
												<a href="dashboard/detail/register/<?php echo $i->id_stage; ?>" class="btn btn-outline-primary btn-sm"><i class="fas fa-info-circle"></i> Detail</a>
												<?php foreach ($seleksi_aktif_ar_detail as $j): ?>
													<?php if ($j->start_stage < $today && $j->end_stage > $today && $j->label == 'Tahap 1' && $j->id_stage == $i->id_stage && ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1')): ?>
														<a href="<?php echo site_url('sesi/next/').$j->id; ?>" class="btn btn-outline-info btn-sm"><i class="fas fa-arrow-right"></i> Next Step</a>
													<?php endif ?>
												<?php endforeach ?>
											</div>
										</div>
										<hr>

										<div class="row">
											<div class="col-md-12">
												<p class="text-success">Tahapan Ujian Periode I</p>
											</div>

											<div class="col-md-2">
												<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total_online; ?></a>
											</div>

											<div class="col-md-4">
												orang telah melakukan Ujian Periode I
											</div>

											<div class="col-md-6 text-right">
												<a href="dashboard/detail/online/<?php echo $i->id_stage; ?>" class="btn btn-outline-primary btn-sm"><i class="fas fa-info-circle"></i> Detail</a>

												<?php foreach ($seleksi_aktif_ar_detail as $j): ?>
													<?php if ($j->start_stage < $today && $j->end_stage > $today && $j->label == 'Tahap 2' && $j->id_stage == $i->id_stage && ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1')): ?>
														<a href="<?php echo site_url('sesi/next/').$j->id; ?>" class="btn btn-outline-info btn-sm"><i class="fas fa-arrow-right"></i> Next Step</a>
													<?php endif ?>
												<?php endforeach ?>
											</div>
										</div>
										<hr>

										<div class="row">
											<div class="col-md-12">
												<p class="text-success">Tahapan Ujian Periode II</p>
											</div>

											<div class="col-md-2">
												<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total_f2f; ?></a>
											</div>

											<div class="col-md-4">
												orang telah melakukan Ujian Periode II
											</div>

											<div class="col-md-6 text-right">
												<a href="dashboard/detail/f2f/<?php echo $i->id_stage; ?>" class="btn btn-outline-primary btn-sm"><i class="fas fa-info-circle"></i> Detail</a>

												<?php foreach ($seleksi_aktif_ar_detail as $j): ?>
													<?php if ($j->start_stage < $today && $j->end_stage > $today && $j->label == 'Tahap 3' && $j->id_stage == $i->id_stage && ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1')): ?>
														<a href="<?php echo site_url('sesi/next/').$j->id; ?>" class="btn btn-outline-info btn-sm"><i class="fas fa-arrow-right"></i> Next Step</a>
													<?php endif ?>
												<?php endforeach ?>
											</div>
										</div>
										<hr>

										<div class="row">
											<div class="col-md-12">
												<p class="text-success">Tahapan Interview</p>
											</div>

											<div class="col-md-2">
												<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total_interview; ?></a>
											</div>

											<div class="col-md-4">
												orang telah melakukan interview
											</div>

											<div class="col-md-6 text-right">
												<a href="dashboard/detail/interview/<?php echo $i->id_stage; ?>" class="btn btn-outline-primary btn-sm"><i class="fas fa-info-circle"></i> Detail</a>

												<?php foreach ($seleksi_aktif_ar_detail as $j): ?>
													<?php if ($j->start_stage < $today && $j->end_stage > $today && $j->label == 'Tahap 4' && $j->id_stage == $i->id_stage && ($this->session->userdata('akses') == '0' || $this->session->userdata('akses') == '1')): ?>
														<a href="<?php echo site_url('sesi/next/').$j->id; ?>" class="btn btn-outline-info btn-sm"><i class="fas fa-arrow-right"></i> Next Step</a>
													<?php endif ?>
												<?php endforeach ?>
											</div>
										</div>
										<hr>
									</div>
								</div>
							</div>
						<?php endforeach ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
