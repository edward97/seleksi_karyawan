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
										<div class="row">
											<div class="col-md-6">
												Pilih Sistem Penyeleksi
											</div>

											<div class="col-md-6 text-right">
												<i class="fas fa-download"></i> Template
											</div>
										</div>
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
													<input type="file" name="data_pertama" id="data_pertama">
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
													<input type="file" name="data_kedua" id="data_kedua">
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
