<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<?php echo $this->session->flashdata('msg'); ?>
				
				<div class="card">
					<div class="card-header bg-light">
						Hasil Akurasi
					</div>
						
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Algoritma</th>
										<th>Akurasi</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>C4.5</td>
										<td>90%</td>
										<td>
											<a href="#" class="btn btn-outline-info btn-sm">
												<i class="fas fa-info-circle"></i> Detail
											</a>
										</td>
									</tr>

									<tr>
										<td>CART</td>
										<td>85%</td>
										<td>
											<a href="#" class="btn btn-outline-info btn-sm">
												<i class="fas fa-info-circle"></i> Detail
											</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#c45" role="tab" aria-controls="home" aria-expanded="true"><i class="icon-calculator"></i> Algoritma C4.5</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#cart" role="tab" aria-controls="profile" aria-expanded="false"><i class="icon-calculator"></i> Algoritma CART</a>
					</li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="c45" role="tabpanel" aria-expanded="true">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>Nama</th>
										<th>Pengalaman</th>
										<th>Pendidikan</th>
										<th>Nilai Ujian</th>
										<th>Nilai Sikap</th>
										<th>Status</th>
									</tr>
								</thead>

								<tbody>
									<?php $no = 1; ?>
									<?php foreach ($data_testing as $i): ?>
										<tr>
											<td><?php echo $no; ?></td>
											<td><?php echo $i[0]; ?></td>
											<td><?php echo $i[1]; ?></td>
											<td><?php echo $i[2]; ?></td>
											<td class="text-nowrap"><?php echo $i[3]; ?></td>
											<td class="text-nowrap"><?php echo $i[4]; ?></td>
											<td><?php echo $i[5]; ?></td>
										</tr>
										<?php $no++; ?>
									<?php endforeach ?>
								</tbody>
							</table>
						</div>

					</div>

					<div class="tab-pane" id="cart" role="tabpanel" aria-expanded="false">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
