
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<h2>Ujian Online</h2>

			<?php echo form_open('start/submit_online'); ?>
				<?php foreach ($usr as $i): ?>
					<?php foreach ($soal_online as $j): ?>
						<?php if ($i->label_online == $j->label): ?>
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-12">
											<?php echo $j->question; ?>

											<hr>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="ans_a">Pilihan A</label>
												<div class="input-group mb-2">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<input type="radio" name="correct" value="a">
														</div>
													</div>
													<input type="text" class="form-control" name="ans_a" id="ans_a" value="<?php echo $j->answer_a ?>" readonly>
												</div>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="ans_a">Pilihan B</label>
												<div class="input-group mb-2">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<input type="radio" name="correct" value="a">
														</div>
													</div>
													<input type="text" class="form-control" name="ans_a" id="ans_a" value="<?php echo $j->answer_b ?>" readonly>
												</div>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="ans_a">Pilihan C</label>
												<div class="input-group mb-2">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<input type="radio" name="correct" value="a">
														</div>
													</div>
													<input type="text" class="form-control" name="ans_a" id="ans_a" value="<?php echo $j->answer_c ?>" readonly>
												</div>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label for="ans_a">Pilihan D</label>
												<div class="input-group mb-2">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<input type="radio" name="correct" value="a">
														</div>
													</div>
													<input type="text" class="form-control" name="ans_a" id="ans_a" value="<?php echo $j->answer_d ?>" readonly>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						<?php endif ?>
					<?php endforeach ?>

				<?php endforeach ?>


				<button type="submit" name="submit" class="btn btn-outline-danger" value="onl">Selesai</button>
			<?php echo form_close(); ?>
		</div>
	</div>
</div>

