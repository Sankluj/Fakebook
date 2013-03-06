<?php
class CentreInteret extends AppModel
{
	var $name = 'CentreInteret';
	var $primaryKey = "ID_CINT";
	var $hasMany = array(
		'RejoindreInteret' => array(
			'className' => 'RejoindreInteret',
			'foreignKey' => 'NOM',
			'dependent' => true
		)
	);
}
?>