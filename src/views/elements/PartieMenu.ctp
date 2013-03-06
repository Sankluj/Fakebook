<div id="bloc_menu">
	<div id="lien">
		<?php echo $html->link(' Mur', array('controller' => 'messages', 'action' => 'index'));
			  echo $html->link(' Amis', array('controller' => 'amis', 'action' => 'index'));
			  echo $html->link(' Boite De Reception', array('controller' => 'utilisateurs', 'action' => 'boite_reception')); 
		if ($session->read('Auth.Utilisateur') != NULL) {
			echo $html->link(' Log out ', array('controller' => 'utilisateurs', 'action' => 'logout'));
			
			echo $form->create('Utilisateur', array('url' => "/Utilisateurs/search", 'type' => 'post'));
			echo $form->text('NOM');
			echo $form->end();		
		} else {
			echo $html->link(' Log in ', array('controller' => 'utilisateurs', 'action' => 'login'));
			echo $html->link(' Sign up ', array('controller' => 'utilisateurs', 'action' => 'add'));
		}
		?>
	</div>
</div>

