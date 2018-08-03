			</div>
		</div>

		<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/popper.js/popper.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/tinymce/js/tinymce.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/js/carbon.js"></script>

		<!-- Modal Ubah Admin -->
		<script>
			$(document).ready(function() {
				// text-editor
				tinymce.init({
					// selector : 'textarea',
					selector : '#deskripsi',
					plugins : 'advlist autolink link lists charmap print preview',
					height : '320'
				});

				// Untuk sunting admin
				$('#editAct').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#username').attr("value",div.data('nama'));
					modal.find('#email').attr("value",div.data('email'));
					modal.find('#profesi').attr("value",div.data('profesi'));
					modal.find('#level').attr("value",div.data('level'));
				});

				// Untuk sunting nilai interview
				$('#editItv').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#id_stage').attr("value",div.data('stage'));
					modal.find('#username').attr("value",div.data('nama'));
					modal.find('#n_sikap').attr("value",div.data('sikap'));
				});

				// Untuk sunting ability
				$('#edit-ability').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#nm_abt').attr("value",div.data('nama'));
				});

				// Untuk sunting job
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
