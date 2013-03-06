<?php
class Photo extends AppModel
{
	var $name = 'Photo';
	var $primaryKey = "ID_COUNTERPHOTO";
	var $belongsTo = array(
		'AlbumPhoto' => array(
			'className' => 'AlbumPhoto',
			'foreignKey' => 'ID_ALBUM',
			'counterCache' => true
		)
	);
	var $hasMany = array(
		'LesPhoto' => array(
			'className' => 'LesPhoto',
			'foreignKey' => 'ID_PHOTO',
			'counterCache' => true
		)
	);
}
?>