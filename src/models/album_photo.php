<?php
class AlbumPhoto extends AppModel
{
	var $name = 'AlbumPhoto';
	var $primaryKey = "ID_ALBUM";
	var $hasMany = array(
		'Photo' => array(
			'className' => 'Photo',
			'foreignKey' => 'ID_ALBUM',
			'dependent' => true
		),
	);
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		)
	);
}
?>