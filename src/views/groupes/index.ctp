<?php echo $html->link('Creer un groupe', "/groupes/add"); ?>

<table>
	<tr>
		<th>Categorie</th>
		<th>Nom</th>
		<th>Description</th>
		<th>Date</th>
		<th>Del</th>
	</tr>
	<?php foreach ($groupes as $groupe): ?>
	<tr>
			<td><?php echo $groupe['Groupe']['ID_CATEGORIE']; ?></td>		
			<td><?php echo $groupe['Groupe']['NOM']; ?></td>
			<td><?php echo $groupe['Groupe']['DESCRIPTION']; ?></td>
			<td><?php echo $groupe['Groupe']['DATE_CREATION']; ?></td>
			<td><?php echo $html->link('Delete', "/groupes/delete/".$groupe['Groupe']['ID_ACTEUR_GRP']); ?></td>
	</tr>
	<?php endforeach; ?>

</table>