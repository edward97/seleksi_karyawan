<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						List Standar Kualifikasi
					</div>
						
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<?php echo $this->session->userdata('msg'); ?>

								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>No</th>
												<th>ID</th>
												<th>Nama Standard Kualifikasi</th>
												<th>Posisi</th>
												<th>Action</th>
											</tr>
										</thead>

										<tbody>
											<?php $no = 1; ?>
											<?php foreach ($list as $i): ?>
											<tr>
												<td><?php echo $no; ?></td>
												<td><?php echo $i->id_std ?></td>
												<td><?php echo $i->nm_std ?></td>
												<td><?php echo $i->nm_job ?></td>
												<td>
													<a href="#" data-toggle="modal" data-target="#<?php echo $i->id_std; ?>" class="btn btn-outline-info btn-sm">
														<i class="fas fa-info-circle"></i>  Detail
													</a>
												</td>
											</tr>
											<?php $no++; ?>

											<!-- Modal Kemampuan -->
											<div class="modal fade" id="<?php echo $i->id_std; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog modal-lg" role="document">
													<div class="modal-content">
														<div class="modal-header bg-info border-0">
															<h5 class="modal-title text-white">List Ability</h5>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														
														<div class="modal-body p-5">
															<?php $no_1 = 1; ?>
															<?php foreach ($ability as $j): ?>
																<?php if ($i->id_std == $j->id_std): ?>
																	<p><?php echo $no_1.') '.$j->nm_ability ?></p>
																	<?php $no_1++; ?>
																<?php endif ?>
															<?php endforeach ?>
														</div>

														<div class="modal-footer border-0">
															<button type="button" class="btn btn-link" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
														</div>
													</div>
												</div>
											</div>
											<!-- End Modal -->
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
	</div>
</div>