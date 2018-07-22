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
												Session <?php echo $i->nm_job; ?> &nbsp;<i class="fas fa-angle-down"></i>
											</a>
										</div>

										<div class="col-md-6 text-right">
											<a href="sesi/edit_sesi/<?php echo $i->id_stage; ?>" class="btn btn-warning">Edit Session</a>
											<!-- hanya dapat closing jika waktu sudah melewati batas tahap 4 -->
											<?php foreach ($seleksi_aktif_ar_detail as $j): ?>
												<?php if ($j->id_stage == $i->id_stage && $j->label == 'Tahap 4' && $j->end_stage < $today && $this->session->userdata('akses') == '1'): ?>
													<a href="sesi/closing/<?php echo $i->id_stage; ?>" class="btn btn-success">Close Session</a>
												<?php endif; ?>
											<?php endforeach ?>
										</div>
									</div>
								</div>

								<!-- <div id="" class="collapse show"> -->
								<div id="collapse<?php echo $i->id_stage; ?>" class="collapse">
									<div class="card-body">
										<?php foreach ($seleksi_aktif_ar_detail as $j): ?>

											<?php $total = 0; ?>
											<?php foreach ($count_user as $k): ?>
												<?php if ($k->id_stage_detail == $j->id): ?>
													<?php $total++; ?>
												<?php endif ?>
											<?php endforeach ?>

											<?php if ($j->id_stage == $i->id_stage && $j->label == 'Tahap 1'): ?>
												<div class="row">
													<div class="col-md-12">
														<p class="text-success">Tahapan Registrasi</p>
													</div>

													<div class="col-md-2">
														<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total; ?></a>
													</div>

													<div class="col-md-4">
														orang telah melakukan registrasi
													</div>

													<div class="col-md-6 text-right">
														<a href="#" class="btn btn-outline-secondary">Lihat Detail</a>

														<?php if ($j->start_stage <= $today && $j->end_stage >= $today): ?>
															<a href="#" class="btn btn-outline-info">Next Step</a>
														<?php endif ?>
													</div>
												</div>
												<hr>
											<?php elseif ($j->id_stage == $i->id_stage && $j->label == 'Tahap 2'): ?>
												<div class="row">
													<div class="col-md-12">
														<p class="text-success">Tahapan Ujian Online</p>
													</div>

													<div class="col-md-2">
														<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total; ?></a>
													</div>

													<div class="col-md-4">
														orang telah melakukan ujian online
													</div>

													<div class="col-md-6 text-right">
														<a href="#" class="btn btn-outline-secondary">Lihat Detail</a>

														<?php if ($j->start_stage <= $today && $j->end_stage >= $today): ?>
															<a href="#" class="btn btn-outline-info">Next Step</a>
														<?php endif ?>
													</div>
												</div>
												<hr>
											<?php elseif ($j->id_stage == $i->id_stage && $j->label == 'Tahap 3'): ?>
												<div class="row">
													<div class="col-md-12">
														<p class="text-success">Tahapan Ujian Tatap Muka</p>
													</div>

													<div class="col-md-2">
														<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total; ?></a>
													</div>

													<div class="col-md-4">
														orang telah melakukan ujian tatap muka
													</div>

													<div class="col-md-6 text-right">
														<a href="#" class="btn btn-outline-secondary">Lihat Detail</a>

														<?php if ($j->start_stage <= $today && $j->end_stage >= $today): ?>
															<a href="#" class="btn btn-outline-info">Next Step</a>
														<?php endif ?>
													</div>
												</div>
												<hr>
											<?php elseif ($j->id_stage == $i->id_stage && $j->label == 'Tahap 4'): ?>
												<div class="row">
													<div class="col-md-12">
														<p class="text-success">Tahapan Interview</p>
													</div>

													<div class="col-md-2">
														<a href="#" class="form-control btn-outline-secondary text-center text-danger"><?php echo $total; ?></a>
													</div>

													<div class="col-md-4">
														orang telah melakukan interview
													</div>

													<div class="col-md-6 text-right">
														<a href="#" class="btn btn-outline-secondary">Lihat Detail</a>

														<?php if ($j->start_stage <= $today && $j->end_stage >= $today): ?>
															<a href="#" class="btn btn-outline-info">Next Step</a>
														<?php endif ?>
													</div>
												</div>
												<hr>
											<?php endif ?>
										<?php endforeach ?>
										
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
