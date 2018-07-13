
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-6">
					<?php foreach ($usr as $i): ?>
						<?php if ($i->end_stage >= $today): ?>
							<div class="card">
								<div class="card-header border border-top-0 border-right-0 border-left-0">
									Card Divded Header
								</div>

								<div class="card-body">
									<div class="row">
										<div class="col-md-12">
											<h4>Step 2</h4>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck1" checked disabled>
												<label class="form-check-label" for="defaultCheck1">
													Isi formulir pendaftaran
												</label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck2" checked disabled>
												<label class="form-check-label" for="defaultCheck2">
													Tunggu hasil pendafataran
												</label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck3" disabled>
												<label class="form-check-label" for="defaultCheck3">
													<span class="text-primary">Ujian Online (sedang berlangsung)</span>
												</label>
											</div>
											<hr>

											<p>Yang perlu dilakukan</p>
											<p class="text-center">Status</p>

											<div class="form-group text-center">
												<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
											</div>

											<div class="form-group text-center">
												<a href="<?php echo site_url('start/online'); ?>" class="form-control btn btn-outline-primary">Lanjut Ujian</a>
											</div>
										</div>
									</div>
								</div>
							</div>

						<?php else: ?>
							<div class="card">
								<div class="card-header border border-top-0 border-right-0 border-left-0">
									Card Divded Header
								</div>

								<div class="card-body">
									<div class="row">
										<div class="col-md-12">
											<h4>Step 2</h4>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck1" checked disabled>
												<label class="form-check-label" for="defaultCheck1">
													Isi formulir pendaftaran
												</label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck2" checked disabled>
												<label class="form-check-label" for="defaultCheck2">
													Tunggu hasil pendafataran
												</label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck3" checked disabled>
												<label class="form-check-label" for="defaultCheck3">
													Ujian Online (Ujian Online sudah berakhir)
												</label>
											</div>

											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="defaultCheck4" disabled>
												<label class="form-check-label" for="defaultCheck4">
													Ujian Langsung
												</label>
											</div>
											<hr>

											<?php if ($tahap_3 > 0): ?>
												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
												</div>

												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Ujian Online Success</button>
												</div>

												<div class="form-group text-center">
													<a href="<?php echo site_url('start/f2f'); ?>" class="form-control btn btn-outline-primary">Mulai Ujian Langsung</a>
												</div>
											<?php else: ?>
												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Register Success</button>
												</div>

												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-success" disabled>Ujian Online Success</button>
												</div>

												<div class="form-group text-center">
													<button type="button" class="form-control btn btn-outline-secondary" disabled>Mulai Ujian Langsung</button>
												</div>
											<?php endif ?>
										</div>
									</div>
								</div>
							</div>


						<?php endif ?>
					<?php endforeach ?>
				</div>

			</div>
		</div>
	</div>
</div>

