<?php
class Statut extends AppModel
{
	var $name = 'Statut';
	var $primaryKey = "ID_MSG";
	
	var $belongsTo = array(
		'Message' => array(
			'className' => 'Message',
			'foreignKey' => 'ID_MSG',
			'counterCache' => true
		)
	);
}
?>