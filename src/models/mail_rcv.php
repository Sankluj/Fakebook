<?php
class MailRcv extends AppModel
{
	var $name = 'MailRcv';
	var $primaryKey = "ID_MAIL";
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR_ENV',
			'counterCache' => true
		),
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR_RCV',
			'counterCache' => true
		)
	);
}
?>