<?php
class Message_grpe extends AppModel
{
	var $name = 'Message_grpe';
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