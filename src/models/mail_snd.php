<?php
class MailSnd extends AppModel
{
	var $name = 'MailSnd';
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