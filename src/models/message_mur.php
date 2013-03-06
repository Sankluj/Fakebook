<?php
class MessageMur extends AppModel
{
	var $name = 'MessageMur';
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