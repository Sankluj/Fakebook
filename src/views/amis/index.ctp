<h1><?php echo 'Amis de '.$utilisateur['PRENOM'].' '.$utilisateur['NOM'];?></h1>
<table>
	
	<?php foreach ($amiIAsk as $user): ?>
	<tr>
		<td>
			<?php 
				echo $html->link($user['UtilisateurRcv']['NOM'].'  '.$user['UtilisateurRcv']['PRENOM'].'  ',"/Messages/indexFriend/".$user['UtilisateurRcv']['ID_ACTEUR']);
				echo $user['UtilisateurRcv']['ADR_MAIL'];
				echo $html->link(' Delete', "/amis/delete/".$user['Ami']['ID_AMI']);
			?>
		</td>
	</tr>
	<?php endforeach; ?>
	
	<?php foreach ($amiHeAsk as $user): ?>
	<tr>
		<td>
			<?php 
				echo $html->link($user['UtilisateurEnv']['NOM'].'  '.$user['UtilisateurEnv']['PRENOM'].'  ',"/Messages/indexFriend/".$user['UtilisateurEnv']['ID_ACTEUR']);
				echo $user['UtilisateurEnv']['ADR_MAIL'];
				echo $html->link(' Delete', "/amis/delete/".$user['Ami']['ID_AMI']);
			?>
		</td>
	</tr>
	<?php endforeach; ?>
	</tr>
</table>