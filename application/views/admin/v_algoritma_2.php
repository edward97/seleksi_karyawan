<div class="content">
	<div class="container-fluid">
		<?php if ($check == 'cart'): ?>
			<div class="card">
				<div class="card-header bg-light">
					<?php echo $judul; ?>
				</div>
					
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<?php
									$cart = $this->session->userdata('akurasi_cart');
									$no = 1;

									$total_akurasi = 0;
									$total_recall = 0;
									$total_precision = 0;
								?>
								<?php foreach ($cart as $key_1 => $value_1): ?>
									<div class="h3">Fold-<?php echo $no; ?></div>

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
												<th>Hasil Akurasi</th>
											</tr>
										</thead>

										<tbody>
										<?php $tp = $fn = $tn = $fp = $akurasi = 0; ?>
										<?php foreach ($value_1 as $key_2 => $value_2): ?>
											<tr>
												<td><?php echo $value_2[0]; ?></td>
												<td><?php echo $value_2[1]; ?></td>
												<td><?php echo $value_2[2]; ?></td>
												<td><?php echo $value_2[3]; ?></td>
												<td><?php echo $value_2[4]; ?></td>
												<td><?php echo $value_2[5]; ?></td>
												<td><?php echo $value_2[6]; ?></td>
												<td><?php echo $value_2[7]; ?></td>
												<td><?php echo $value_2[8]; ?></td>
												<td><?php echo $value_2[9]; ?></td>
												<td><?php echo $value_2[10]; ?></td>
											</tr>

											<?php
											if ($value_2[9] == 'lulus' && $value_2[10] == 'lulus') {
												$tp++;
											}
											elseif ($value_2[9] == 'lulus' && $value_2[10] == 'gagal') {
												$fn++;
											}
											elseif ($value_2[9] == 'gagal' && $value_2[10] == 'lulus') {
												$fp++;
											}
											elseif ($value_2[9] == 'gagal' && $value_2[10] == 'gagal') {
												$tn++;
											}
											?>
										<?php endforeach ?>
										</tbody>

										<tfoot class="text-danger">
											<?php
												$akurasi = 0;
												if (($tp + $tn + $fp + $fn) != 0) {
													$akurasi = ($tp + $tn) / ($tp + $tn + $fp + $fn);
												}
												$accuracy = $akurasi * 100;

												$recall = 0;
												if (($tp + $fn) != 0) {
													$recall = $tp / ($tp + $fn) * 100;
												}

												$precision = 0;
												if (($tp + $fp) != 0) {
													$precision = $tp / ($tp + $fp) * 100;
												}

												$total_akurasi+=$accuracy;
												$total_recall+=$recall;
												$total_precision+=$precision;
											?>

											<tr>
												<td>Total Accuracy</td>
												<td><?php echo $accuracy; ?>%</td>
											</tr>

											<tr>
												<td>Total Recall</td>
												<td><?php echo $recall; ?>%</td>
											</tr>

											<tr>
												<td>Total Precision</td>
												<td><?php echo $precision; ?>%</td>
											</tr>
										</tfoot>
									</table>

									<?php $no++; ?>
								<?php endforeach ?>
							</div>
						</div>
					</div>

						<div class="bg-info">&nbsp;</div>

					<div class="row">
						<div class="col-md-12">
							<p>Total Akurasi : <?php echo $total_akurasi/10; ?>%</p>
							<p>Total Recall : <?php echo $total_recall/10; ?>%</p>
							<p>Total Precision : <?php echo $total_precision/10; ?>%</p>
						</div>
					</div>
				</div>
			</div>

		<?php elseif ($check == 'c45'): ?>
			<div class="card">
				<div class="card-header bg-light">
					<?php echo $judul; ?>
				</div>
					
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<?php
									$c45 = $this->session->userdata('akurasi_c45');
									$no = 1;

									$total_akurasi = 0;
									$total_recall = 0;
									$total_precision = 0;
								?>
								<?php foreach ($c45 as $key_1 => $value_1): ?>
									<div class="h3">Fold-<?php echo $no; ?></div>

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
												<th>Hasil Akurasi</th>
											</tr>
										</thead>

										<tbody>
										<?php $tp = $fn = $tn = $fp = $akurasi = 0; ?>
										<?php foreach ($value_1 as $key_2 => $value_2): ?>
											<tr>
												<td><?php echo $value_2[0]; ?></td>
												<td><?php echo $value_2[1]; ?></td>
												<td><?php echo $value_2[2]; ?></td>
												<td><?php echo $value_2[3]; ?></td>
												<td><?php echo $value_2[4]; ?></td>
												<td><?php echo $value_2[5]; ?></td>
												<td><?php echo $value_2[6]; ?></td>
												<td><?php echo $value_2[7]; ?></td>
												<td><?php echo $value_2[8]; ?></td>
												<td><?php echo $value_2[9]; ?></td>
												<td><?php echo $value_2[10]; ?></td>
											</tr>

											<?php
											if ($value_2[9] == 'lulus' && $value_2[10] == 'lulus') {
												$tp++;
											}
											elseif ($value_2[9] == 'lulus' && $value_2[10] == 'gagal') {
												$fn++;
											}
											elseif ($value_2[9] == 'gagal' && $value_2[10] == 'lulus') {
												$fp++;
											}
											elseif ($value_2[9] == 'gagal' && $value_2[10] == 'gagal') {
												$tn++;
											}
											?>
										<?php endforeach ?>
										</tbody>

										<tfoot class="text-danger">
											<?php
												$akurasi = 0;
												if (($tp + $tn + $fp + $fn) != 0) {
													$akurasi = ($tp + $tn) / ($tp + $tn + $fp + $fn);
												}
												$accuracy = $akurasi * 100;

												$recall = 0;
												if (($tp + $fn) != 0) {
													$recall = $tp / ($tp + $fn) * 100;
												}

												$precision = 0;
												if (($tp + $fp) != 0) {
													$precision = $tp / ($tp + $fp) * 100;
												}


												$total_akurasi+=$accuracy;
												$total_recall+=$recall;
												$total_precision+=$precision;
											?>

											<tr>
												<td>Total Accuracy</td>
												<td><?php echo $accuracy; ?>%</td>
											</tr>

											<tr>
												<td>Total Recall</td>
												<td><?php echo $recall; ?>%</td>
											</tr>

											<tr>
												<td>Total Precision</td>
												<td><?php echo $precision; ?>%</td>
											</tr>
										</tfoot>
									</table>

									<?php $no++; ?>
								<?php endforeach ?>
							</div>
						</div>
					</div>

						<div class="bg-info">&nbsp;</div>

					<div class="row">
						<div class="col-md-12">
							<p>Total Akurasi : <?php echo $total_akurasi/10; ?>%</p>
							<p>Total Recall : <?php echo $total_recall/10; ?>%</p>
							<p>Total Precision : <?php echo $total_precision/10; ?>%</p>
						</div>
					</div>
				</div>
			</div>
		<?php endif ?>
	</div>
</div>
