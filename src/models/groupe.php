<?php
class Groupe extends AppModel
{
	var $name = 'Groupe';
	var $primaryKey = "ID_ACTEUR_GRP";
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		),
		'Categorie' => array(
			'className' => 'Categorie',
			'foreignKey' => 'ID_CATEGORIE',
			'counterCache' => true
		)
	);
}
?>