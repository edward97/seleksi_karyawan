<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						<p>Dashboard Detail - <?php echo strtoupper($check); ?></p>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>
										<th>ID</th>
										<th>No. KTP</th>
										<th>Nama Pelamar</th>
										<th>Email</th>
										<th>Status</th>
									</tr>
								</thead>

								<tbody>
									<?php $no = 1; ?>
									<?php foreach ($user as $i): ?>
										<?php foreach ($pecah as $key => $value): ?>
											<?php if ($i->id_user == $value): ?>
												<tr>
													<td><?php echo $no; ?></td>
													<td><?php echo $i->id_user ?></td>
													<td><?php echo $i->no_ktp ?></td>
													<td><?php echo $i->full_name ?></td>
													<td><?php echo $i->email ?></td>
													<td><?php echo $i->label ?></td>
												</tr>
												<?php $no++; ?>
											<?php endif ?>
										<?php endforeach ?>
									<?php endforeach ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
