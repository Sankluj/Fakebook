<h1>Search</h1>
<? if (!empty($users)) { ?>
<table>
	<?php foreach ($users as $user): ?>
		<?php if (strcmp($user['Utilisateur']['ID_ACTEUR'], "") != 0) { ?>
			<td><?php echo $html->link($user['Utilisateur']['NOM'].'  '.$user['Utilisateur']['PRENOM'].'  ',"/Messages/indexFriend/".$user['Utilisateur']['ID_ACTEUR']); ?></td>
		</tr>
		<? } ?>
	<?php endforeach; ?>
</table>
<? } else {
	echo 'No User Found';
}?>