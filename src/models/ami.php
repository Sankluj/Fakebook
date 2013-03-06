<?php
class Ami extends AppModel
{
	var $name = 'Ami';
	var $primaryKey = "ID_AMI";
	var $belongsTo = array(
		'UtilisateurEnv' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		),
		'UtilisateurRcv' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR_1',
			'counterCache' => true
		)
	);
}
?>