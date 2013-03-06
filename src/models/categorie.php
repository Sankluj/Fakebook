<?php
class Categorie extends AppModel
{
	var $name = 'Categorie';
	var $primaryKey = "ID_CATEGORIE";
	var $hasMany = array(
		'Groupe' => array(
			'className' => 'Groupe',
			'foreignKey' => 'ID_CATEGORIE',
			'dependent' => true
		)
	);
}
?>