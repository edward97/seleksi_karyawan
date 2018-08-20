<script>
	$(document).ready(function(){
		// sembunyikan alert validasi kosong
		$("#kosong").hide();
	});
</script>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Open Session
					</div>
						
					<?php echo form_open_multipart('dataset/form_preview'); ?>
					<div class="card-body">
						<?php echo $this->session->flashdata('msg'); ?>

						<div class="row">
							<div class="col-md-9">
								<div class="form-group row">
									<label for="sesi" class="col-sm-4 col-form-label require">Pilih sesi yang akan di hitung</label>
									
									<div class="col-sm-8">
										<select name="sesi" id="sesi" class="form-control" required>
											<option value="">Choose...</option>
											<?php foreach ($seleksi_aktif_ar as $i): ?>
												<option value="<?php echo $i->id_stage; ?>"><?php echo 'ID '.$i->id_stage.' | '.$i->nm_job; ?></option>
											<?php endforeach ?>
										</select>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-9">
								<div class="card">
									<div class="card-header bg-light">
										<div class="row">
											<div class="col-md-6">
												Pilih Sistem Penyeleksi
											</div>

											<div class="col-md-6 text-right">
												<a class="text-info" href="<?php echo base_url(); ?>assets/files/format.csv"><i class="fas fa-download"></i> Template</a>
											</div>
										</div>
									</div>

									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="file" class="col-form-label require">Upload Data Pendukung</label>
												</div>
											</div>

											<div class="col-md-6">
												<div class="custom-file">
													<input type="file" name="file" id="file" accept=".csv">
												</div>
											</div>
										</div>

										<!-- <div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="file1" class="col-form-label">Upload Karyawan Sesi Sebelumnya</label>
												</div>
											</div>

											<div class="col-md-6">
												<div class="custom-file">
													<input type="file" name="file1" id="file1" accept=".csv">
												</div>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card-footer bg-light text-right">
						<div class="form-group">
							<button type="submit" name="submit" value="save" class="btn btn-success">
								<i class="far fa-save"></i> Generate
							</button>
						</div>
					</div>
					<?php echo form_close(); ?>
				</div>
			</div>
		</div>
	</div>
</div>
