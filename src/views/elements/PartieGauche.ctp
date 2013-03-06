<div id="bloc_gauche">
	<?php 
		$user = $session->read('Auth.Utilisateur');
	?>
	<p>Partie Gauche</p>
	<div id="lien">
		<?php //echo $html->link('Photo', array('controller' => 'les_photos', 'action' => 'view',0)) ?>
		<?php echo $html->link('Amis', array('controller' => 'amis', 'action' => 'index')) ?>
	</div>
</div>
