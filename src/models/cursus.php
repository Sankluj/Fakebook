<?php
class Cursus extends AppModel
{
	var $name = 'Cursus';
	var $primaryKey = "ID_CURSUS";
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
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