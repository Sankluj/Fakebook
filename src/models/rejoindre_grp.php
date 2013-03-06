<?php
class RejoindreGrp extends AppModel
{
	var $name = 'RejoindreGrp';
	var $primaryKey = "ID_REJCOUNTER";
	var $belongsTo = array(
		'Utilisateur' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR_USER',
			'counterCache' => true
		),
		'Groupe' => array(
			'className' => 'Groupe',
			'foreignKey' => 'ID_ACTEUR_GRP',
			'counterCache' => true
		)
	);
}
?>