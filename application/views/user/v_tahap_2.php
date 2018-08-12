<?php foreach ($usr as $i): ?>
	<?php if ($i->nilai_online == null): ?>
		<div class="container text-center">
			<div class="row">
				<div class="col-md-3">
					<div class="card text-white">
						<div class="card-body bg-success">
							Tahap Register <i class="icon icon-badge"></i>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card text-white">
						<div class="card-body bg-info">
							Tahap Ujian <i class="icon icon-pin"></i>
						</div>
					</div>
				</div>	

				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							Tahap Interview
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							Result
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="card">
				<div class="card-header text-center border border-top-0 border-right-0 border-left-0 h4">
					Tahapan Seleksi Karyawan
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h4 class="text-center">Step 1</h4>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked disabled>
										<label class="form-check-label" for="defaultCheck1">
											Isi formulir pendaftaran
										</label>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
										<label class="form-check-label" for="defaultCheck2">
											Tunggu hasil pendafataran
										</label>
									</div>
									<hr>

									<p class="text-center">Status</p>

									<div class="form-group text-center">
										<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
									</div>
								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									<!-- <small>what wrong!</small> -->
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h4 class="text-center">Step 2</h4>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
										<label class="form-check-label" for="defaultCheck2">
											Ujian Online (sedang berlangsung)
										</label>
									</div>
									<div>&nbsp;</div>
									<hr>

									<p class="text-center">Status</p>
									<div class="form-group text-center">
										<a href="start/online/lanjut" class="form-control btn btn-outline-info">Ujian Online - Lanjut</a>
									</div>
								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									<small><?php echo $i->start_stage." - ".$i->end_stage; ?></small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<?php else: ?>
		<div class="container text-center">
			<div class="row">
				<div class="col-md-3">
					<div class="card text-white">
						<div class="card-body bg-success">
							Tahap Register <i class="icon icon-badge"></i>
						</div>
					</div>
				</div>

				<?php foreach ($tahapan as $j): ?>
					<?php if ($j->label == 'Tahap 3' && $j->start_stage <= $today): ?>
						<div class="col-md-3">
							<div class="card text-white">
								<div class="card-body bg-info">
									Tahap Ujian <i class="icon icon-pin"></i>
								</div>
							</div>
						</div>

					<?php elseif ($j->label == 'Tahap 3' && $j->start_stage > $today): ?>
						<div class="col-md-3">
							<div class="card text-white">
								<div class="card-body bg-warning">
									Tahap Ujian <i class="icon icon-hourglass"></i>
								</div>
							</div>
						</div>

						<?php break; ?>
					<?php endif ?>
				<?php endforeach ?>

				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							Tahap Interview
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							Result
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="card">
				<div class="card-header text-center border border-top-0 border-right-0 border-left-0 h4">
					Tahapan Seleksi Karyawan
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h4 class="text-center">Step 1</h4>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck1" checked disabled>
										<label class="form-check-label" for="defaultCheck1">
											Isi formulir pendaftaran
										</label>
									</div>

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
										<label class="form-check-label" for="defaultCheck2">
											Tunggu hasil pendafataran
										</label>
									</div>
									<hr>

									<p class="text-center">Status</p>

									<div class="form-group text-center">
										<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
									</div>
								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									<?php foreach ($tahapan as $j): ?>
										<?php if ($j->label == 'Tahap 1'): ?>
											<small><?php echo $j->start_stage." - ".$j->end_stage; ?></small>
											<?php break; ?>
										<?php endif ?>
									<?php endforeach ?>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h4 class="text-center">Step 2</h4>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" checked disabled>
										<label class="form-check-label" for="defaultCheck2">
											Ujian Online (Selesai)
										</label>
									</div>
									<div>&nbsp;</div>
									<hr>

									<p class="text-center">Status</p>

									<div class="form-group text-center">
										<button type="button" class="form-control btn btn-success" disabled>Ujian Online - Success</button>
									</div>

								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									<small><?php echo $i->start_stage." - ".$i->end_stage; ?></small>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h4 class="text-center">Step 3</h4>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
										<label class="form-check-label" for="defaultCheck2">
											Ujian Tatap Muka
										</label>
									</div>
									<div>&nbsp;</div>
									<hr>

									<p class="text-center">Status</p>
									<?php foreach ($tahapan as $j): ?>
										<?php if ($j->label == 'Tahap 3' && $j->start_stage <= $today): ?>
											<div class="form-group text-center">
												<a href="start/f2f/<?php echo $j->id; ?>" class="form-control btn btn-outline-info">Ujian Tatap Muka - Mulai</a>
											</div>

										<?php elseif ($j->label == 'Tahap 3' && $j->start_stage > $today): ?>
											<div class="form-group text-center">
												<button type="button" class="form-control btn btn-outline-warning" disabled>Ujian Tatap Muka - Pending</button>
											</div>

											<?php break; ?>
										<?php endif ?>
									<?php endforeach ?>
								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									
									<?php foreach ($tahapan as $j): ?>
										<?php if ($j->label == 'Tahap 3'): ?>
											<small><?php echo $j->start_stage." - ".$j->end_stage; ?></small>
											<?php break; ?>
										<?php endif ?>
									<?php endforeach ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<?php endif ?>
<?php endforeach ?>