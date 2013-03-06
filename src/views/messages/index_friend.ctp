<?php 
		$currentStatut['Statut']['STATUT'] = "";
			foreach ($messages as $statut):
				if (strcmp($statut['Statut']['ID_MSG'], "") != 0) {
					$currentStatut = $statut;
					break;
				}
			endforeach;
?>

<h1><?php echo $utilisateur['Utilisateur']['NOM'].' '.$utilisateur['Utilisateur']['PRENOM'].' : '.$currentStatut['Statut']['STATUT'] ;?></h1>

<?php echo $this->element("../message_murs/add") ?>

<table>
	<tr>
		<th>Envoye par</th>
		<th>Type</th>
		<th>Id Mess</th>
		<th>Horaire</th>
		<th>Mess</th>
	</tr>
	<?php foreach ($messages as $message): ?>
	<tr>
			<td><?php echo $message['Message']['ID_ACTEUR_ENV']; ?></td>
		<?php if (strcmp($message['MessageMur']['ID_MSG'], "") != 0) { ?>
			<td><?php echo "MessageMur"; ?></td>		
			<td><?php echo $message['MessageMur']['ID_MSG']; ?></td>
			<td><?php echo $message['MessageMur']['DATE_HEURE_ENVOI']; ?></td>
			<td><?php echo $message['MessageMur']['MSG_MUR']; ?></td>
			
		<?php }elseif (strcmp($message['Statut']['ID_MSG'], "") != 0) { ?>	
			<td><?php echo "Status"; ?></td>			
			<td><?php echo $message['Statut']['ID_MSG']; ?></td>
			<td><?php echo $message['Statut']['DATE_HEURE_ENVOI']; ?></td>
			<td><?php echo $message['Statut']['STATUT']; ?></td>
			
		<?php } ?>
	</tr>
	<?php endforeach; ?>

</table>
 
