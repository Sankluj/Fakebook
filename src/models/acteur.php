<?php
class Acteur extends AppModel
{
	var $name = 'Acteur';
	var $primaryKey = "ID_ACTEUR";
	var $hasOne = array(
		'Utilisateur' => array(
			'className' => 'Utilisateur',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
		'Groupe' => array(
			'className' => 'Groupe',
			'foreignKey' => 'ID_ACTEUR_GRP',
			'dependent' => true
		)
	);
	var $hasMany = array(
		'AlbumPhoto' => array(
			'className' => 'AlbumPhoto',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
		'Message' => array(
			'className' => 'Message',
			'foreignKey' => 'ID_ACTEUR_RCV',
			'dependent' => true
		),
		'MailRcv' => array(
			'className' => 'MailRcv',
			'foreignKey' => 'ID_ACTEUR_RCV'
			//'dependent' => true
		),
		'MailSnd' => array(
			'className' => 'MailSnd',
			'foreignKey' => 'ID_ACTEUR_ENV'
			//'dependent' => true
		)
	);
}
?>