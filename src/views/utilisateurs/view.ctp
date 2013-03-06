<h1><?php echo $utilisateur['Utilisateur']['NOM'].' '.$utilisateur['Utilisateur']['PRENOM'];?></h1>
 
<table>
	<tr>
		<td>
			<p><?php echo $utilisateur['Utilisateur']['NOM'];?></p>
			<p><?php echo $utilisateur['Utilisateur']['PRENOM'];?></p>
			<p><?php echo $utilisateur['Utilisateur']['ADR_MAIL'];?></p>
			<p><?php echo $utilisateur['Utilisateur']['DATE_NAISS'];?></p>
			<p><?php echo $utilisateur['Utilisateur']['NO_RUE'].' '.$utilisateur['Utilisateur']['ADRESSE'];?></p>
			<p><?php echo $utilisateur['Utilisateur']['CP'].' - '.$utilisateur['Utilisateur']['VILLE'];?></p>
			<p><?php echo $utilisateur['Utilisateur']['REGION'];?></p>
		</td>
	</tr>	
</table>