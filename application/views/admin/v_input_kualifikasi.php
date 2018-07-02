<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Input Standar Kualifikasi

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addAct">
								<i class="fa fa-plus"></i> S-Kualifikasi
							</a>
						</div>
					</div>

					<div class="card-body">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label for="nm_kualifikasi" class="col-form-label require">Nama Kualifikasi</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" class="form-control" name="nm_kualifikasi" id="nm_kualifikasi">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label for="divisi" class="col-form-label require">Divisi</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<select name="divisi" id="divisi" class="form-control">
										<option selected>Choose...</option>
										<?php foreach ($job as $i): ?>
											<option value="<?php echo $i->id_job; ?>"><?php echo $i->nm_job; ?></option>
										<?php endforeach ?>
									</select>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label for="kemampuan" class="col-form-label require">kemampuan</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<button type="button" class="form-control btn btn-outline-secondary" data-toggle="modal" data-target="#addAct">
										<div class="row">
											<div class="col text-left">
												Choose...
											</div>

											<div class="col text-right">
												<i class="fas fa-caret-down"></i>
											</div>
										</div>
									</button>
								</div>
							</div>

							<!-- Modal Tambah Admin -->
							<div class="modal fade" id="addAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg" role="document">
									<div class="modal-content">
										<div class="modal-header bg-info border-0">
											<h5 class="modal-title text-white">Required Ability</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										
										<div class="modal-body p-5">
											<div class="row">
												<?php foreach ($ability as $i): ?>
												<div class="col-md-6">
													<div class="form-check checkbox icheck-info">
														<input type="checkbox" id="<?php echo $i->nm_ability ?>" name="kemampuan[]" value="<?php echo $i->id_ability ?>">
														<label for="<?php echo $i->nm_ability ?>"><?php echo $i->nm_ability ?></label>
													</div>
												</div>
												<?php endforeach ?>
											</div>
										</div>

										<div class="modal-footer border-0">
											<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-check"></i> Done</button>
										</div>
									</div>
								</div>
							</div>
							<!-- End Modal -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>