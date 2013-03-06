<div id="BarreNavigation">
	<table>
		<tr>
			<th><?php echo $html->link('Mur', array('controller' => 'messages', 'action' => 'index')); ?></th>
			<th><?php echo $html->link('Profil', array('controller' => 'groupes', 'action' => 'profil')); ?></th>
			<th><?php echo $html->link('Photos', array('controller' => 'groupes', 'action' => 'getPhotos')); ?></th>
		</tr>
	<table>
</div>