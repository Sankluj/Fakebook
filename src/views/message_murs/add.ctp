<?php $this->getVar($utilisateur); ?>

<?php echo $form->create('MessageMur', array('url' => "/messageMurs/add/".$utilisateur['Utilisateur']['ID_ACTEUR']));
	  echo $form->input('MSG_MUR', array( 'label' => 'message'));
	  echo $form->end('envoyer');
?>