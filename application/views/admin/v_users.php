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
								<div class="col-md-6">
									<?php echo $i->email; ?>
								</div>

								<div class="col-md-6">
									total kemampuan : 
									<?php $count = 0; ?>
									<?php foreach ($compare as $j): ?>
										<?php if ($i->id_std == $j->id_std && $i->id_user == $j->id_user): ?>
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
