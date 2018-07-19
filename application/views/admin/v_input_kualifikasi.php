<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Input Standar Kualifikasi
					</div>
						
					<?php echo form_open('kualifikasi/save_act'); ?>
					<div class="card-body">
						<!-- Nama Kualifikasi -->
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

						<!-- Divisi -->
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

						<!-- Kemampuan -->
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

							<!-- Modal Kemampuan -->
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
						<hr>

						<!-- Jumlah Kemampuan -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Jumlah Kemampuan</label>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="jlh_kemampuan1" id="jlh_kemampuan1">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="jlh_kemampuan2" id="jlh_kemampuan2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_kemampuan1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="jlh_kemampuan3" id="jlh_kemampuan3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="jlh_kemampuan4" id="jlh_kemampuan4">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_kemampuan2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Range Umur -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Range Umur</label>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="range_umur1" id="range_umur1">
									<small class="form-text">below</small>
								</div>
							</div>

							<div class="col-md-2"></div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_umur1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="range_umur2" id="range_umur2">
									<small class="form-text">between</small>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="range_umur3" id="range_umur3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_umur2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">

							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="range_umur4" id="range_umur4">
									<small class="form-text">max</small>
								</div>
							</div>

							<div class="col-md-2"></div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_umur3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- pengalaman -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Pengalaman</label>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="pengalaman1" id="pengalaman1">
									<small class="form-text">below</small>
								</div>
							</div>

							<div class="col-md-2"></div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_pengalaman1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="pengalaman2" id="pengalaman2">
									<small class="form-text">between</small>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="pengalaman3" id="pengalaman3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_pengalaman2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">

							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="pengalaman4" id="pengalaman4">
									<small class="form-text">max</small>
								</div>
							</div>

							<div class="col-md-2"></div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_pengalaman3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Status -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Status</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" class="form-control" name="status1" id="status1">
								</div>
							</div>


							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_pernikahan1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="status2" id="status2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_pernikahan2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Pendidikan -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Pendidikan</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" class="form-control" name="pendidikan1" id="pendidikan1">
								</div>
							</div>


							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_education1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="pendidikan2" id="pendidikan2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_education2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="pendidikan3" id="pendidikan3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_education3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="pendidikan4" id="pendidikan4">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_education4">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Nilai Tes Online -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Nilai Tes Online</label>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_online1" id="n_online1">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_online2" id="n_online2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_online1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="n_online3" id="n_online3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_online4" id="n_online4">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_online2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="n_online5" id="n_online5">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_online6" id="n_online6">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_online3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Nilai Tes Langsung -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Nilai Tes Langsung</label>
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_langsung1" id="n_langsung1">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_langsung2" id="n_langsung2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_langsung1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="n_langsung3" id="n_langsung3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_langsung4" id="n_langsung4">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_langsung2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2 offset-md-3">
								<div class="form-group">
									<input type="number" class="form-control" name="n_langsung5" id="n_langsung5">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="number" class="form-control" name="n_langsung6" id="n_langsung6">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_langsung3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Nilai Sikap -->
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Nilai Sikap</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" class="form-control" name="n_sikap1" id="n_sikap1">
								</div>
							</div>


							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_sikap1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="n_sikap2" id="n_sikap2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_sikap2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="n_sikap3" id="n_sikap3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_sikap3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
						<hr>

						<!-- Buta Warna -->
						<!-- <div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<label class="col-form-label require">Buta Warna</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" class="form-control" name="b_warna1" id="b_warna1">
								</div>
							</div>


							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_buta1">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="b_warna2" id="b_warna2">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_buta2">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 offset-md-3">
								<div class="form-group">
									<input type="text" class="form-control" name="b_warna3" id="b_warna3">
								</div>
							</div>

							<div class="col-md-2">
								<div class="form-group">
									<select class="form-control" name="p_buta3">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
									<small class="form-text">priority</small>
								</div>
							</div>
						</div>
					</div> -->

					<div class="card-footer bg-light text-right">
						<div class="form-group">
							<button type="reset" name="reset" class="btn btn-warning">
								<i class="fa fa-trash-alt"></i> Reset
							</button>

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