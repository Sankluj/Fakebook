<h1><?php echo $utilisateur['NOM'].' '.$utilisateur['PRENOM'];?></h1>
 
<table>
	<tr>
		<td>
			<p><?php echo $utilisateur['NOM'];?></p>
			<p><?php echo $utilisateur['PRENOM'];?></p>
			<p><?php echo $utilisateur['ADR_MAIL'];?></p>
			<p><?php echo $utilisateur['DATE_NAISS'];?></p>
			<p><?php echo $utilisateur['NO_RUE'].' '.$utilisateur['ADRESSE'];?></p>
			<p><?php echo $utilisateur['CP'].' - '.$utilisateur['VILLE'];?></p>
			<p><?php echo $utilisateur['REGION'];?></p>
			<?php 	
				echo $html->link('Edit User ', "/utilisateurs/edit/".$utilisateur['ID_ACTEUR']);
			?>
		</td>
	</tr>	
</table>