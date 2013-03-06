<?php
class Message extends AppModel
{
	var $name = 'Message';
	var $primaryKey = "ID_MSG";
	var $hasOne = array(
		'MessageGrpe' => array(
			'className' => 'MessageGrpe',
			'foreignKey' => 'ID_MSG',
			'dependent' => true
		),
		'MessageMur' => array(
			'className' => 'MessageMur',
			'foreignKey' => 'ID_MSG',
			'dependent' => true
		),
		'Statut' => array(
			'className' => 'Statut',
			'foreignKey' => 'ID_MSG',
			'dependent' => true
		),
		'Commentaire' => array(
			'className' => 'Commentaire',
			'foreignKey' => 'ID_MSG',
			'dependent' => true
		)
	);
	
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR_RCV',
			'counterCache' => true
		)
	);
}
?>