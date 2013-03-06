<?php
class RejoindreInteret extends AppModel
{
	var $name = 'RejoindreInteret';
	var $primaryKey = "ID_REJCOUNTER";
	var $belongsTo = array(
		'CentreInteret' => array(
			'className' => 'CentreInteret',
			'foreignKey' => 'NOM',
			'counterCache' => true
		),
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		)
	);
}
?>