<?php
class Etablissement extends AppModel
{
	var $name = 'Etablissement';
	var $primaryKey = "ID_ETABL";
	var $hasMany = array(
		'CreerEtabl' => array(
			'className' => 'CreerEtabl',
			'foreignKey' => 'ID_ETABL',
			'dependent' => true
		),
		'Cursus' => array(
			'className' => 'Cursus',
			'foreignKey' => 'ID_ETABL',
			'dependent' => true
		),
	);
}
?>