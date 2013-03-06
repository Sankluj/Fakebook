<h1><?php echo 'Demande d\'amis recue par '.$utilisateur['PRENOM'].' '.$utilisateur['NOM'];?></h1>
<table>
	<?php foreach ($envoyeurs as $envoyeur): ?>
	<tr>
		<td>
			<?php echo $envoyeur['Envoyeur']['NOM'].' '.$envoyeur['Envoyeur']['PRENOM']; ?>
			<?php echo $envoyeur['Envoyeur']['ADR_MAIL'];?>
			<?php echo $html->link(" Accept","/amis/add/".$envoyeur['Envoyeur']['ID_ACTEUR']); ?>
			<?php echo $html->link(" Ignore","/demandeAmis/delete/".$envoyeur['DemandeAmi']['ID_DEMANDE']); ?>
		</td>
	</tr>
	<?php endforeach; ?>
</table>

<h1><?php echo 'Demande d\'amis envoyé par '.$utilisateur['PRENOM'].' '.$utilisateur['NOM'];?></h1>
<table>
	<?php foreach ($envoyes as $envoye): ?>
	<tr>
		<td>
			<?php echo $envoye['Receveur']['NOM'].' '.$envoye['Receveur']['PRENOM']; ?>
			<?php echo $envoye['Receveur']['ADR_MAIL'];?>
		</td>
	</tr>
	<?php endforeach; ?>
</table>