<?php
class DemandeAmi extends AppModel
{
	var $name = 'DemandeAmi';
	var $primaryKey = "ID_DEMANDE";
	var $belongsTo = array(
		'Envoyeur' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR_ENV',
			'counterCache' => true
		),
		'Receveur' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR_RCV',
			'counterCache' => true
		)
	);
}
?>