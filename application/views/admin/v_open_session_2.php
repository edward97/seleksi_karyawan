<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Open Session
					</div>
						
					<?php echo form_open('sesi/save_act_2'); ?>
					<div class="card-body">
						<div class="row">
							<div class="col-md-9">
								<div class="card">
									<div class="card-header bg-light">
										Pilih Sistem Penyeleksi
									</div>

									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="col-form-label require">Upload Data Pendukung</label>
												</div>
											</div>

											<div class="col-md-6">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="data_pertama" id="data_pertama">
													<label class="custom-file-label" for="data_pertama">Choose file</label>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="col-form-label">Upload Karyawan Sesi Sebelumnya</label>
												</div>
											</div>

											<div class="col-md-6">
												<div class="custom-file">
													<input type="file" class="custom-file-input" name="data_kedua" id="data_kedua">
													<label class="custom-file-label" for="data_kedua">Choose file</label>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-12 text-right">
												<a href="#" class="btn btn-info">Generate</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card-footer bg-light text-right">
						<div class="form-group">
							<button type="submit" name="submit" value="save" class="btn btn-success">
								<i class="far fa-save"></i> Save
							</button>
						</div>
					</div>
					<?php echo form_close(); ?>
				</div>
			</div>
		</div>
	</div>
</div>
