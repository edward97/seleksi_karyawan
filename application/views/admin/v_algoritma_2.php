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
										<td><?php echo $i->nama_lengkap; ?></td>
										<td><?php echo $i->age; ?></td>
										<td><?php echo $i->experience; ?></td>
										<td><?php echo $i->last_education; ?></td>
										<td><?php echo $i->status; ?></td>
										<td><?php echo $i->total_ability; ?></td>
										<td><?php echo $i->nilai_online; ?></td>
										<td><?php echo $i->nilai_f2f; ?></td>
										<td><?php echo $i->nilai_sikap; ?></td>
										<td><?php echo $i->status_passed ?></td>
									</tr>
								<?php endforeach ?>
							</tbody>
						</table>
					</div>
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
										<td><?php echo $i->nama_lengkap; ?></td>
										<td><?php echo $i->age; ?></td>
										<td><?php echo $i->experience; ?></td>
										<td><?php echo $i->last_education; ?></td>
										<td><?php echo $i->status; ?></td>
										<td><?php echo $i->total_ability; ?></td>
										<td><?php echo $i->nilai_online; ?></td>
										<td><?php echo $i->nilai_f2f; ?></td>
										<td><?php echo $i->nilai_sikap; ?></td>
										<td><?php echo $i->status_passed ?></td>
									</tr>
								<?php endforeach ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		<?php endif ?>
	</div>
</div>
