<?php foreach ($usr as $i): ?>
	<?php if ($i->end_stage >= $today): ?>
		<div class="container text-center">
			<div class="row">
				<div class="col-md-3">
					<div class="card text-white">
						<div class="card-body bg-warning">
							Tahap Register <i class="icon icon-hourglass"></i>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							Tahap Ujian
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
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
										<label class="form-check-label" for="defaultCheck2">
											Tunggu hasil pendafataran
										</label>
									</div>
									<hr>

									<p>Yang perlu dilakukan</p>
									<p class="text-center">Status</p>
									<div class="form-group text-center">
										<button type="button" class="form-control btn btn-outline-warning" disabled>Register - Pending</button>
									</div>
								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									<small>what wrong!</small>
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
					<?php if ($j->label == 'Tahap 2' && $j->start_stage <= $today): ?>
						<div class="col-md-3">
							<div class="card text-white">
								<div class="card-body bg-info">
									Tahap Ujian <i class="icon icon-pin"></i>
								</div>
							</div>
						</div>	

					<?php elseif ($j->label == 'Tahap 2' && $j->start_stage > $today): ?>
						<div class="col-md-3">
							<div class="card text-white">
								<div class="card-body bg-warning">
									Tahap Ujian <i class="icon icon-hourglass"></i>
								</div>
							</div>
						</div>
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

									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled>
										<label class="form-check-label" for="defaultCheck2">
											Ujian Online
										</label>
									</div>
									<hr>

									<p>Yang perlu dilakukan</p>
									<p class="text-center">Status</p>

									<div class="form-group text-center">
										<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
									</div>

									<?php foreach ($tahapan as $j): ?>
										<?php if ($j->label == 'Tahap 2' && $j->start_stage <= $today): ?>
											<div class="form-group text-center">
												<a href="start/online/<?php echo $j->id; ?>" class="form-control btn btn-outline-info">Ujian Online - Mulai</a>
											</div>

										<?php elseif ($j->label == 'Tahap 2' && $j->start_stage > $today): ?>
											<div class="form-group text-center">
												<button type="button" class="form-control btn btn-outline-warning" disabled>Ujian Online - Pending</button>
											</div>

											<?php break; ?>
										<?php endif ?>
									<?php endforeach ?>
								</div>

								<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
									<small>what wrong!</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<?php endif ?>
<?php endforeach ?>