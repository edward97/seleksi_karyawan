<?php foreach ($usr as $i): ?>
	<?php if ($i->nilai_online == null): ?>
	<div class="container-fluid">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="col-md-6"><h2>Ujian Online - <?php echo $i->label; ?></h2></div>
					<div class="col-md-6">
						<div class="form-group text-right">
							<button type="button" class="btn btn-outline-info"><?php echo $waktu->format('%H:%i:%s'); ?></button>
						</div>
					</div>
				</div>
			</div>

			<div class="card-body">

				<?php echo form_open('start/submit_online'); ?>
						<?php $count = 1; ?>

						<?php foreach ($soal_online as $j): ?>
							<?php if ($i->label_online == $j->label): ?>
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-md-1">
												<?php echo $count."."; ?>
											</div>
											<div class="col-md-11">
												<?php echo $j->question; ?>
											</div>

											<div class="col-md-12"><hr></div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Pilihan A</label>
													<div class="input-group mb-2">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<input type="radio" name="<?php echo $j->id_question; ?>" value="<?php echo $j->answer_a; ?>">
															</div>
														</div>
														<input type="text" class="form-control" name="answer_a" value="<?php echo $j->answer_a; ?>" readonly>
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Pilihan B</label>
													<div class="input-group mb-2">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<input type="radio" name="<?php echo $j->id_question; ?>" value="<?php echo $j->answer_b; ?>">
															</div>
														</div>
														<input type="text" class="form-control" name="answer_b" value="<?php echo $j->answer_b; ?>" readonly>
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Pilihan C</label>
													<div class="input-group mb-2">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<input type="radio" name="<?php echo $j->id_question; ?>" value="<?php echo $j->answer_c; ?>">
															</div>
														</div>
														<input type="text" class="form-control" name="answer_c" value="<?php echo $j->answer_c; ?>" readonly>
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label>Pilihan D</label>
													<div class="input-group mb-2">
														<div class="input-group-prepend">
															<div class="input-group-text">
																<input type="radio" name="<?php echo $j->id_question; ?>" value="<?php echo $j->answer_d; ?>">
															</div>
														</div>
														<input type="text" class="form-control" name="answer_d" value="<?php echo $j->answer_d; ?>" readonly>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<?php $count++; ?>
							<?php endif ?>
						<?php endforeach ?>

					<?php foreach ($tahapan as $i): ?>
						<?php if ($i->label == 'Tahap 3' && $i->start_stage >= $today): ?>
							<div class="form-group text-right">
								<input type="hidden" name="id" value="<?php echo $i->id ?>">
								<button type="submit" name="submit" class="btn btn-outline-danger" value="onl">Selesai</button>
							</div>
							<?php break; ?>
						<?php endif ?>
					<?php endforeach ?>
				<?php echo form_close(); ?>
			</div>
		</div>
	</div>
	<?php endif ?>
<?php endforeach ?>
