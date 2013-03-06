<?php $this->getVar($utilisateur); ?>

<div id="BarreNavigation">
	<table>
		<tr>
			<th><?php echo $html->link('Mur', "/Messages/indexFriend/".$utilisateur['Utilisateur']['ID_ACTEUR']); ?></th>
			<th><?php echo $html->link('Profil', "/utilisateurs/view/".$utilisateur['Utilisateur']['ID_ACTEUR']); ?></th>
			<th><?php echo $html->link('Photos', array('controller' => 'utilisateurs', 'action' => 'getPhotos')); ?></th>
			<th><?php echo $html->link('Groupe', array('controller' => 'utilisateurs', 'action' => 'getGroupes')); ?></th>
		</tr>
	<table>
</div>