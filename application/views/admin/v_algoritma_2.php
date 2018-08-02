<div class="content">
	<div class="container-fluid">
		<?php if ($check == 'cart'): ?>
			<div class="card">
				<div class="card-header bg-light">
					<?php echo $judul; ?>
				</div>
					
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Nama Lengkap</th>
									<th>Umur</th>
									<th>Pengalaman</th>
									<th>Pendidikan Terakhir</th>
									<th>Status</th>
									<th>Total Kemampuan</th>
									<th>Nilai Ujian Online</th>
									<th>Nilai Ujian Tatap Muka</th>
									<th>Nilai Sikap</th>
									<th>Hasil</th>
								</tr>
							</thead>

							<tbody>
								<?php foreach ($dataset as $i): ?>
									<tr>
										<td class="text-nowrap"><?php echo $i->nama_lengkap; ?></td>
										<td class="text-nowrap"><?php echo $i->age; ?></td>
										<td class="text-nowrap"><?php echo $i->experience; ?></td>
										<td class="text-nowrap"><?php echo $i->last_education; ?></td>
										<td class="text-nowrap"><?php echo $i->status; ?></td>
										<td class="text-nowrap"><?php echo $i->total_ability; ?></td>
										<td class="text-nowrap"><?php echo $i->nilai_online; ?></td>
										<td class="text-nowrap"><?php echo $i->nilai_f2f; ?></td>
										<td class="text-nowrap"><?php echo $i->nilai_sikap; ?></td>
										<td class="text-nowrap"><?php echo $i->status_passed ?></td>
									</tr>
								<?php endforeach ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header bg-light">
					Pengujian 10-Fold Validation
				</div>

				<div class="card-body">
					<?php
					$total_akurasi = 0;
					$total_recall = 0;
					$total_precision = 0;

					for ($i=0; $i < $this->session->userdata('k'); $i++) { ?>
						<?php foreach ($this->session->userdata('konversi_dataset') as $key => $next): ?>
							<?php if ($i == $key): ?>
								<div class="card">
									<div class="card-header bg-light">
										Dataset Fold-<?php echo $i+1; ?>
									</div>

									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>Nama Lengkap</th>
														<th>Umur</th>
														<th>Pengalaman</th>
														<th>Pendidikan Terakhir</th>
														<th>Status</th>
														<th>Total Kemampuan</th>
														<th>Nilai Ujian Online</th>
														<th>Nilai Ujian Tatap Muka</th>
														<th>Nilai Sikap</th>
														<th>Hasil</th>
													</tr>
												</thead>

												<tbody>
													<?php foreach ($next as $j => $value): ?>
														<tr>
															<td class="text-nowrap"><?php echo $value[0]; ?></td>
															<td class="text-nowrap"><?php echo $value[1]; ?></td>
															<td class="text-nowrap"><?php echo $value[2]; ?></td>
															<td class="text-nowrap"><?php echo $value[3]; ?></td>
															<td class="text-nowrap"><?php echo $value[4]; ?></td>
															<td class="text-nowrap"><?php echo $value[5]; ?></td>
															<td class="text-nowrap"><?php echo $value[6]; ?></td>
															<td class="text-nowrap"><?php echo $value[7]; ?></td>
															<td class="text-nowrap"><?php echo $value[8]; ?></td>
															<td class="text-nowrap"><?php echo $value[9]; ?></td>
														</tr>
													<?php endforeach ?>
												</tbody>
											</table>
										</div>

										<?php foreach ($this->session->userdata('hasilcart') as $x => $y): ?>
											<?php if ($x == $i): ?>
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr class="text-center">
																<th colspan="10">Data Training Fold-<?php echo $i+1;; ?></th>
															</tr>
															<tr>
																<th>Nama Lengkap</th>
																<th>Umur</th>
																<th>Pengalaman</th>
																<th>Pendidikan Terakhir</th>
																<th>Status</th>
																<th>Total Kemampuan</th>
																<th>Nilai Ujian Online</th>
																<th>Nilai Ujian Tatap Muka</th>
																<th>Nilai Sikap</th>
																<th>Hasil</th>
															</tr>
														</thead>

														<tbody>
															<?php
															$cart_tp = 0;
															$cart_fn = 0;
															$cart_tn = 0;
															$cart_fp = 0;
															?>

															<?php foreach ($y as $z => $zz): ?>
																<?php
																if ($zz[9] == 'lulus' && $zz[10] == 'lulus') {
																	$cart_tp++;
																}
																elseif ($zz[9] == 'lulus' && $zz[10] == 'gagal') {
																	$cart_fn++;
																}
																elseif ($zz[9] == 'gagal' && $zz[10] == 'lulus') {
																	$cart_fp++;
																}
																else {
																	$cart_tn++;
																}
																?>

																<tr>
																	<td class="text-nowrap"><?php echo $zz[0] ?></td>
																	<td class="text-nowrap"><?php echo $zz[1] ?></td>
																	<td class="text-nowrap"><?php echo $zz[2] ?></td>
																	<td class="text-nowrap"><?php echo $zz[3] ?></td>
																	<td class="text-nowrap"><?php echo $zz[4] ?></td>
																	<td class="text-nowrap"><?php echo $zz[5] ?></td>
																	<td class="text-nowrap"><?php echo $zz[6] ?></td>
																	<td class="text-nowrap"><?php echo $zz[7] ?></td>
																	<td class="text-nowrap"><?php echo $zz[8] ?></td>
																	<td class="text-nowrap"><?php echo $zz[9]." => ".$zz[10] ?></td>
																</tr>
															<?php endforeach ?>
														</tbody>

														<tfoot>
															<?php
															$akurasi = ($cart_tp + $cart_tn) / ($cart_tp + $cart_tn + $cart_fp + $cart_fn);
															$cart_accuracy = $akurasi * 100;
															$cart_recall = $cart_tp / ($cart_tp + $cart_fn) * 100;
															$cart_precision = $cart_tp / ($cart_tp + $cart_fp) * 100;


															$total_akurasi+=$cart_accuracy;
															$total_recall+=$cart_recall;
															$total_precision+=$cart_precision;

															?>

															<tr>
																<td>Accuracy</td>
																<td> : </td>
																<td colspan="8"><?php echo $cart_accuracy; ?>%</td>
															</tr>
															<tr>
																<td>Recall</td>
																<td> : </td>
																<td colspan="8"><?php echo $cart_recall; ?>%</td>
															</tr>
															<tr>
																<td>Precision</td>
																<td> : </td>
																<td colspan="8"><?php echo $cart_precision; ?>%</td>
															</tr>
														</tfoot>
													</table>
												</div>
											<?php endif ?>
										<?php endforeach ?>
									</div>
								</div>
							<?php endif ?>
						<?php endforeach ?>

						<div class="card">
							<div class="card-header bg-info"></div>
						</div>
					<?php } ?>
				</div>
			</div>

			<div class="card">
				<div class="card-header bg-primary text-white">
					Hasil Akhir
				</div>

				<div class="card-body">
					<p>Nilai Akurasi Akhir : <?php echo $total_akurasi / $this->session->userdata('k'); ?>%</p>
					<p>Nilai Recall Akhir : <?php echo $total_recall / $this->session->userdata('k'); ?>%</p>
					<p>Nilai Presisi Akhir : <?php echo $total_precision / $this->session->userdata('k'); ?>%</p>
				</div>
			</div>


		<?php elseif ($check == 'c45'): ?>
			<div class="card">
				<div class="card-header bg-light">
					<?php echo $judul; ?>
				</div>
					
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Nama Lengkap</th>
									<th>Umur</th>
									<th>Pengalaman</th>
									<th>Pendidikan Terakhir</th>
									<th>Status</th>
									<th>Total Kemampuan</th>
									<th>Nilai Ujian Online</th>
									<th>Nilai Ujian Tatap Muka</th>
									<th>Nilai Sikap</th>
									<th>Hasil</th>
								</tr>
							</thead>

							<tbody>
								<?php foreach ($dataset as $i): ?>
									<tr>
										<td class="text-nowrap"><?php echo $i->nama_lengkap; ?></td>
										<td class="text-nowrap"><?php echo $i->age; ?></td>
										<td class="text-nowrap"><?php echo $i->experience; ?></td>
										<td class="text-nowrap"><?php echo $i->last_education; ?></td>
										<td class="text-nowrap"><?php echo $i->status; ?></td>
										<td class="text-nowrap"><?php echo $i->total_ability; ?></td>
										<td class="text-nowrap"><?php echo $i->nilai_online; ?></td>
										<td class="text-nowrap"><?php echo $i->nilai_f2f; ?></td>
										<td class="text-nowrap"><?php echo $i->nilai_sikap; ?></td>
										<td class="text-nowrap"><?php echo $i->status_passed ?></td>
									</tr>
								<?php endforeach ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header bg-light">
					Pengujian 10-Fold Validation
				</div>

				<div class="card-body">
					<?php
					$total_akurasi = 0;
					$total_recall = 0;
					$total_precision = 0;

					for ($i=0; $i < $this->session->userdata('k'); $i++) { ?>
						<?php foreach ($this->session->userdata('konversi_dataset') as $key => $next): ?>
							<?php if ($i == $key): ?>
								<div class="card">
									<div class="card-header bg-light">
										Dataset Fold-<?php echo $i+1; ?>
									</div>

									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>Nama Lengkap</th>
														<th>Umur</th>
														<th>Pengalaman</th>
														<th>Pendidikan Terakhir</th>
														<th>Status</th>
														<th>Total Kemampuan</th>
														<th>Nilai Ujian Online</th>
														<th>Nilai Ujian Tatap Muka</th>
														<th>Nilai Sikap</th>
														<th>Hasil</th>
													</tr>
												</thead>

												<tbody>
													<?php foreach ($next as $j => $value): ?>
														<tr>
															<td class="text-nowrap"><?php echo $value[0]; ?></td>
															<td class="text-nowrap"><?php echo $value[1]; ?></td>
															<td class="text-nowrap"><?php echo $value[2]; ?></td>
															<td class="text-nowrap"><?php echo $value[3]; ?></td>
															<td class="text-nowrap"><?php echo $value[4]; ?></td>
															<td class="text-nowrap"><?php echo $value[5]; ?></td>
															<td class="text-nowrap"><?php echo $value[6]; ?></td>
															<td class="text-nowrap"><?php echo $value[7]; ?></td>
															<td class="text-nowrap"><?php echo $value[8]; ?></td>
															<td class="text-nowrap"><?php echo $value[9]; ?></td>
														</tr>
													<?php endforeach ?>
												</tbody>
											</table>
										</div>

										<?php foreach ($this->session->userdata('hasilc45') as $x => $y): ?>
											<?php if ($x == $i): ?>
												<div class="table-responsive">
													<table class="table table-hover">
														<thead>
															<tr class="text-center">
																<th colspan="10">Data Training Fold-<?php echo $i+1;; ?></th>
															</tr>
															<tr>
																<th>Nama Lengkap</th>
																<th>Umur</th>
																<th>Pengalaman</th>
																<th>Pendidikan Terakhir</th>
																<th>Status</th>
																<th>Total Kemampuan</th>
																<th>Nilai Ujian Online</th>
																<th>Nilai Ujian Tatap Muka</th>
																<th>Nilai Sikap</th>
																<th>Hasil</th>
															</tr>
														</thead>

														<tbody>
															<?php
															$c45_tp = 0;
															$c45_fn = 0;
															$c45_tn = 0;
															$c45_fp = 0;
															?>

															<?php foreach ($y as $z => $zz): ?>
																<?php
																if ($zz[9] == 'lulus' && $zz[10] == 'lulus') {
																	$c45_tp++;
																}
																elseif ($zz[9] == 'lulus' && $zz[10] == 'gagal') {
																	$c45_fn++;
																}
																elseif ($zz[9] == 'gagal' && $zz[10] == 'lulus') {
																	$c45_fp++;
																}
																else {
																	$c45_tn++;
																}
																?>

																<tr>
																	<td class="text-nowrap"><?php echo $zz[0] ?></td>
																	<td class="text-nowrap"><?php echo $zz[1] ?></td>
																	<td class="text-nowrap"><?php echo $zz[2] ?></td>
																	<td class="text-nowrap"><?php echo $zz[3] ?></td>
																	<td class="text-nowrap"><?php echo $zz[4] ?></td>
																	<td class="text-nowrap"><?php echo $zz[5] ?></td>
																	<td class="text-nowrap"><?php echo $zz[6] ?></td>
																	<td class="text-nowrap"><?php echo $zz[7] ?></td>
																	<td class="text-nowrap"><?php echo $zz[8] ?></td>
																	<td class="text-nowrap"><?php echo $zz[9]." => ".$zz[10] ?></td>
																</tr>
															<?php endforeach ?>
														</tbody>

														<tfoot>
															<?php
															$akurasi = ($c45_tp + $c45_tn) / ($c45_tp + $c45_tn + $c45_fp + $c45_fn);
															$c45_accuracy = $akurasi * 100;
															$c45_recall = $c45_tp / ($c45_tp + $c45_fn) * 100;
															$c45_precision = $c45_tp / ($c45_tp + $c45_fp) * 100;


															$total_akurasi+=$c45_accuracy;
															$total_recall+=$c45_recall;
															$total_precision+=$c45_precision;

															?>

															<tr>
																<td>Accuracy</td>
																<td> : </td>
																<td colspan="8"><?php echo $c45_accuracy; ?>%</td>
															</tr>
															<tr>
																<td>Recall</td>
																<td> : </td>
																<td colspan="8"><?php echo $c45_recall; ?>%</td>
															</tr>
															<tr>
																<td>Precision</td>
																<td> : </td>
																<td colspan="8"><?php echo $c45_precision; ?>%</td>
															</tr>
														</tfoot>
													</table>
												</div>
											<?php endif ?>
										<?php endforeach ?>
									</div>
								</div>
							<?php endif ?>
						<?php endforeach ?>

						<div class="card">
							<div class="card-header bg-info"></div>
						</div>
					<?php } ?>
				</div>
			</div>

			<div class="card">
				<div class="card-header bg-primary text-white">
					Hasil Akhir
				</div>

				<div class="card-body">
					<p>Nilai Akurasi Akhir : <?php echo $total_akurasi / $this->session->userdata('k'); ?>%</p>
					<p>Nilai Recall Akhir : <?php echo $total_recall / $this->session->userdata('k'); ?>%</p>
					<p>Nilai Presisi Akhir : <?php echo $total_precision / $this->session->userdata('k'); ?>%</p>
				</div>
			</div>
		<?php endif ?>
	</div>
</div>
