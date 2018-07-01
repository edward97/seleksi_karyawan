<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						List Ujian Tatap Muka

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addAct">
								<i class="fa fa-plus"></i>
								<i class="fa fa-pencil-alt"></i>
							</a>
						</div>
					</div>

					<div class="card-body">
						<?php echo $this->session->flashdata('msg_f2f') ?>

						<div class="row">
							<?php foreach ($f2f as $i): ?>
							<div class="col-md-6">
								<div class="card">
									<div class="card-header bg-light">
										<?php echo $i->label." [ ".$i->nm_job." ] "; ?>

										<div class="card-actions">
											<a href="<?php echo site_url('soal/edit_f2f/')."$i->id_question"; ?>" class="btn text-info">
												<i class="fa fa-cog"></i> Edit
											</a>
										</div>
									</div>

									<div class="card-body">
										<div class="row">
											<div class="col-md-12">
												<?php echo $i->question; ?>
											</div>
										</div>

										<hr>

										<div class="row">
											<div class="col-md-6">
												A - <?php echo $i->answer_a ?>
											</div>

											<div class="col-md-6">
												B - <?php echo $i->answer_b ?>
											</div>

											<div class="col-md-6">
												C - <?php echo $i->answer_c ?>
											</div>

											<div class="col-md-6">
												D - <?php echo $i->answer_d ?>
											</div>
										</div>
									</div>

									<div class="card-footer bg-light text-danger">
										<div class="row">
											<div class="col-md-6">
												Answer : <?php echo $i->correct_ans ?>
											</div>

											<div class="col-md-6 text-right">
												Bobot Soal : <?php echo $i->weight ?>
											</div>
										</div>
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
</div>

<!-- Modal Tambah Soal Online -->
<div class="modal fade" id="addAct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<?php echo form_open('soal/input_f2f_act'); ?>
				<div class="modal-header bg-success border-0">
					<h5 class="modal-title text-white">Add Question Face 2 Face</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="divisi" class="require">Divisi</label>
								<select name="divisi" id="divisi" class="form-control">
									<option selected>Choose...</option>
								<?php foreach ($divisi as $i): ?>
									<option value="<?php echo $i->id_job ?>"><?php echo $i->nm_job ?></option>
								<?php endforeach ?>
								</select>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
							<label for="nama_soal" class="require">Nama Soal</label>
								<input type="text" name="nama_soal" id="nama_soal" class="form-control" required>
								<small class="form-text">[ Akuntansi I, Akuntansi II ]</small>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="deskripsi">Soal</label>
								<textarea name="deskripsi" id="deskripsi" class="form-control"></textarea>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="ans_a" class="require">Pilihan A</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text"><input type="radio" name="correct" value="a"></div>
									</div>
									<input type="text" class="form-control" name="ans_a" id="ans_a">
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="ans_b" class="require">Pilihan B</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text"><input type="radio" name="correct" value="b"></div>
									</div>
									<input type="text" class="form-control" name="ans_b" id="ans_b">
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="ans_c" class="require">Pilihan C</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text"><input type="radio" name="correct" value="c"></div>
									</div>
									<input type="text" class="form-control" name="ans_c" id="ans_c">
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="ans_d" class="require">Pilihan D</label>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text"><input type="radio" name="correct" value="d"></div>
									</div>
									<input type="text" class="form-control" name="ans_d" id="ans_d">
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="bobot" class="require">Weight</label>
								<input type="number" name="bobot" id="bobot" class="form-control">
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer border-0">
					<button type="reset" name="reset" class="btn btn-warning"><i class="far fa-trash-alt"></i> Reset</button>
					<button type="submit" name="submit" value="save" class="btn btn-success"><i class="far fa-save"></i> Save</button>
				</div>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>