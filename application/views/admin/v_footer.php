			</div>
		</div>

		<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/popper.js/popper.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/js/carbon.js"></script>

		<!-- Modal Ubah Admin -->
		<script>
			$(document).ready(function() {
				// Untuk sunting
				$('#editAct').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#username').attr("value",div.data('nama'));
					modal.find('#email').attr("value",div.data('email'));
					modal.find('#level').attr("value",div.data('level'));
					modal.find('#partisipasi').attr("value",div.data('partisipasi'));
					modal.find('#keterangan').attr("value",div.data('keterangan'));
				});
			});
		</script>

		<!-- Modal Ubah Ability -->
		<script>
			$(document).ready(function() {
				// Untuk sunting
				$('#edit-ability').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#nm_abt').attr("value",div.data('nama'));
				});
			});
		</script>

		<!-- Modal Ubah Job -->
		<script>
			$(document).ready(function() {
				// Untuk sunting
				$('#edit-job').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#nm_job').attr("value",div.data('nama'));
				});
			});
		</script>
	</body>
</html>
