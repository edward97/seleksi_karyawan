<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-light">
						List User

						<div class="card-actions">
							<a href="#" class="btn text-success" data-toggle="modal" data-target="#addAct">
								<i class="fa fa-plus"></i> User
							</a>
						</div>
					</div>

					<div class="card-body">
						<div class="row">
							<?php foreach ($user as $i): ?>
								<?php $count = 0; ?>
								<div class="col-md-6"><?php echo $i->email ?></div>

								<div class="col-md-6">
									<?php foreach ($ability as $j): ?>
										<?php if ($j->id_user == $i->id_user): ?>
											<?php $count++; ?>
										<?php endif ?>
									<?php endforeach ?>
									<?php echo $count; ?>
								</div>
							<?php endforeach ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
