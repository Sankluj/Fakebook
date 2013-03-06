<?php
class MessageGrpe extends AppModel
{
	var $name = 'MessageGrpe';
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