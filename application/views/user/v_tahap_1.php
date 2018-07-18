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
								<button type="button" class="form-control btn btn-outline-warning" disabled>Pending</button>
							</div>
						</div>

						<div class="card-footer border border-left-0 border-right-0 border-bottom-0 text-right">
							<?php foreach ($usr as $i): ?>
								<?php echo $i->start_stage." - ".$i->end_stage; ?>
							<?php endforeach ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

