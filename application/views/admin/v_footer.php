			</div>
		</div>

		<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/popper.js/popper.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/vendor/datetimepicker/jquery.datetimepicker.full.js"></script>
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

				// Untuk sunting detail user
				$('#edit-user').on('show.bs.modal', function (event) {
					var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
					var modal = $(this)

					// Isi nilai pada field
					modal.find('#id').attr("value",div.data('id'));
					modal.find('#ktp').attr("value",div.data('ktp'));
					modal.find('#email').attr("value",div.data('email'));
					modal.find('#nm_lengkap').attr("value",div.data('nm_lengkap'));
					modal.find('#nm_profesi').attr("value",div.data('nm_profesi'));
					modal.find('#tahap').attr("value",div.data('tahap'));
					modal.find('#tp_lahir').attr("value",div.data('tp_lahir'));
					modal.find('#tgl_lahir').attr("value",div.data('tgl_lahir'));
					modal.find('#address').html(div.data('address'));
					modal.find('#kota').attr("value",div.data('kota'));
					modal.find('#pos').attr("value",div.data('pos'));
					modal.find('#umur').attr("value",div.data('umur'));
					modal.find('#jenis_kelamin').attr("value",div.data('jenis_kelamin'));
					modal.find('#last_education').attr("value",div.data('last_education'));
					modal.find('#religion').attr("value",div.data('religion'));
					modal.find('#status').attr("value",div.data('status'));
					modal.find('#experience').attr("value",div.data('experience'));
					modal.find('#total_ability').attr("value",div.data('total_ability'));
					modal.find('#nm_kerabat').attr("value",div.data('nm_kerabat'));
					modal.find('#telp_kerabat').attr("value",div.data('telp_kerabat'));
					modal.find('#hubungan_kerabat').attr("value",div.data('hubungan_kerabat'));
				});
			});

			$.datetimepicker.setLocale('en');
			$('#sesi_pendaftaran1').datetimepicker({
				mask:'9999/19/39 29:59'
			});
			$('#sesi_pendaftaran2').datetimepicker({
				mask:'9999/19/39 29:59'
			});

			$('#sesi_online1').datetimepicker({
				mask:'9999/19/39 29:59'
			});

			$('#sesi_online2').datetimepicker({
				mask:'9999/19/39 29:59'
			});

			$('#sesi_tatap1').datetimepicker({
				mask:'9999/19/39 29:59'
			});
			$('#sesi_tatap2').datetimepicker({
				mask:'9999/19/39 29:59'
			});

			$('#sesi_interview1').datetimepicker({
				mask:'9999/19/39 29:59'
			});
			$('#sesi_interview2').datetimepicker({
				mask:'9999/19/39 29:59'
			});
		</script>
	</body>
</html>
