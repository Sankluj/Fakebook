<h1>Mur</h1>
<?php 
	if ($session->read('Auth.Utilisateur') != NULL) {
		echo $html->link('Log out ', array('controller' => 'utilisateurs', 'action' => 'logout'));
	} else {
		echo $html->link('Log in ', array('controller' => 'utilisateurs', 'action' => 'login'));
	}
?>
<table>
	<tr>
		<th>Message</th>
		<th>Date</th>
		<th>Delete</th>
	</tr>
	<?php foreach($messageMurs as $messageMur): ?>
	<tr>
		<td>
		<?php echo $html->link($messageMur['MessageMur']['MSG_MUR'], 	
			"/message_murs/view/".$messageMur['MessageMur']['ID_MSG']); ?>
		</td>
		<td><?php echo $messageMur['MessageMur']['DATE_HEURE_ENVOI']; ?></td>
		<td>
		<?php echo $html->link('Delete',
			"/message_murs/delete/".$messageMur['MessageMur']['ID_MSG'])?>
		</td>
	</tr>
	<?php endforeach;?>			
</table>