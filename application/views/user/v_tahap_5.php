<?php foreach ($usr as $i): ?>
	<?php if (!$i->status_passed): ?>
		<h1>Maaf, anda tidak diterima</h1>
	<?php else: ?>
		<h1>Selamat, anda diterima</h1>
	<?php endif ?>
<?php endforeach ?>