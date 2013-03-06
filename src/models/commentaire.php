<?php
class Commentaire extends AppModel
{
	var $name = 'Commentaire';
	var $primaryKey = "ID_COMMENT";
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		),
		'Message' => array(
			'className' => 'Message',
			'foreignKey' => 'ID_MSG',
			'counterCache' => true
		)
	);
}
?>