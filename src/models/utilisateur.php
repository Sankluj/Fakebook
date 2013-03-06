<?php
class Utilisateur extends AppModel
{
	var $name = 'Utilisateur';
	var $primaryKey = "ID_ACTEUR";
	var $validate = array (
		'NOM' => array (
			'rule' =>'notEmpty'
		),
		'PRENOM' => array (
			'rule' =>'notEmpty'
		),
		'MDP' => array (
			'rule' =>'notEmpty'
		),
		'ADR_MAIL' => array (
			'rule' =>'notEmpty'
		),
		'DATE_NAISS' => array (
			'rule' =>'notEmpty'
		)
	);
	var $belongsTo = array(
		'Acteur' => array(
			'className' => 'Acteur',
			'foreignKey' => 'ID_ACTEUR',
			'counterCache' => true
		)
	);
	
	var $hasMany = array(
		'Demande_Ami' => array(
			'className' => 'DemandeAmi',
			'foreignKey' => 'ID_ACTEUR_RCV',
			'dependent' => true
		),
		'Ami' => array(
			'className' => 'Ami',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
		'RejoindreInteret' => array(
			'className' => 'RejoindreInteret',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
		'RejoindreGrp' => array(
			'className' => 'RejoindreGrp',
			'foreignKey' => 'ID_ACTEUR_USER',
			'dependent' => true
		),
		'Cursus' => array(
			'className' => 'Cursus',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
		'CreerEtabl' => array(
			'className' => 'CreerEtabl',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
		'Commentaire' => array(
			'className' => 'Commentaire',
			'foreignKey' => 'ID_ACTEUR',
			'dependent' => true
		),
	);
}
?>