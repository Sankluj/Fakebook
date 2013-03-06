<?php
class CreerEtabl extends AppModel
{
	var $name = 'CreerEtabl';
	var $primaryKey = "ID_CREATE";
	var $belongsTo = array(
		'Utilisateur' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		),
		'Etablissement' => array(
			'className' => 'Etablissement',
			'foreignKey' => 'ID_ETABL',
			'counterCache' => true
		)
	);
}
?>