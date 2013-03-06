<?php
class LesPhoto extends AppModel
{
	var $name = 'LesPhoto';
	var $primaryKey = "ID_PHOTO";
	var $belongsTo = array(
		'Photo' => array(
			'className' => 'Photo',
			'foreignKey' => 'ID_PHOTO',
			'dependent' => true
		)
	);
}
?>