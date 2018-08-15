<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						Edit Soal Tatap Muka
					</div>

					<?php foreach ($soal as $i): ?>
					<?php echo form_open('soal/upt_f2f_act') ?>
					<div class="card-body">
						<?php echo $this->session->flashdata('msg') ?>

						<div class="row">
							<div class="col-md-2">
								<div class="form-group">
									<label for="divisi">ID</label>
									<input type="text" name="id" id="id" class="form-control" value="<?php echo $i->id_question ?>" readonly>
								</div>
							</div>

							<div class="col-md-5">
								<div class="form-group">
									<label for="divisi">Divisi</label>
									<?php foreach ($divisi as $j): ?>
										<?php if ($i->id_job == $j->id_job): ?>
											<input type="text" name="divisi" id="divisi" class="form-control" value="<?php echo $j->nm_job ?>" readonly>
											<?php break; ?>
										<?php endif ?>
									<?php endforeach ?>
								</div>
							</div>

							<div class="col-md-5">
								<div class="form-group">
								<label for="nama_soal">Nama Soal</label>
									<input type="text" name="nama_soal" id="nama_soal" class="form-control" value="<?php echo $i->label ?>" readonly>
									<small class="form-text">[ Akuntansi I, Akuntansi II ]</small>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="deskripsi">Soal</label>
									<textarea name="deskripsi" id="deskripsi" class="form-control"><?php echo $i->question ?></textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="ans_a" class="require">Pilihan A</label>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<input type="radio" name="correct" value="a" <?php if ($i->answer_a == $i->correct_ans) echo "checked"; ?>>
											</div>
										</div>
										<input type="text" class="form-control" name="ans_a" id="ans_a" value="<?php echo $i->answer_a ?>" required>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="ans_b" class="require">Pilihan B</label>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<input type="radio" name="correct" value="b" <?php if ($i->answer_b == $i->correct_ans) echo "checked"; ?>>
											</div>
										</div>
										<input type="text" class="form-control" name="ans_b" id="ans_b" value="<?php echo $i->answer_b ?>" required>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="ans_c" class="require">Pilihan C</label>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<input type="radio" name="correct" value="c" <?php if ($i->answer_c == $i->correct_ans) echo "checked"; ?>>
											</div>
										</div>
										<input type="text" class="form-control" name="ans_c" id="ans_c" value="<?php echo $i->answer_c ?>" required>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
									<label for="ans_d" class="require">Pilihan D</label>
									<div class="input-group mb-2">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<input type="radio" name="correct" value="d" <?php if ($i->answer_d == $i->correct_ans) echo "checked"; ?>>
											</div>
										</div>
										<input type="text" class="form-control" name="ans_d" id="ans_d" value="<?php echo $i->answer_d ?>" required>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card-footer bg-light text-right">
						<div class="form-group">
							<button type="reset" name="reset" class="btn btn-warning">
								<i class="fa fa-trash-alt"></i> Reset
							</button>

							<button type="submit" name="submit" value="update" class="btn btn-info">
								<i class="fas fa-sync-alt"></i> Update
							</button>
						</div>
					</div>
					<?php echo form_close(); ?>
					<?php endforeach ?>
				</div>
			</div>
		</div>
	</div>
</div>
