<div id="BarreNavigation">
	<table>
		<tr>
			<th><?php echo $html->link('Mur', array('controller' => 'messages', 'action' => 'index')); ?></th>
			<th><?php echo $html->link('Profil', array('controller' => 'utilisateurs', 'action' => 'profil')); ?></th>
			<th><?php echo $html->link('Photos', array('controller' => 'utilisateurs', 'action' => 'getPhotos')); ?></th>
			<th><?php echo $html->link('Groupe', array('controller' => 'groupes', 'action' => 'index')); ?></th>
		</tr>
	<table>
</div>