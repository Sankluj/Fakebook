<?php
class MessagesController extends AppController {
	var $name = 'Messages';
	
	/* Messages d'un utilisateur */
	function index() {
		$this->layout = 'userNavBar';
		$user = $this->Session->read('Auth.Utilisateur');
		$this->set('utilisateur', $this->Message->Acteur->findById_acteur($user['ID_ACTEUR']));
		$this->set('messages', $this->Message->find('all', array('conditions' => array('Message.id_acteur_rcv' => $user['ID_ACTEUR']), 'order'=>array('Message.id_msg DESC'))));
	}
	
	/* show one user Wall */
	function indexFriend($id_acteur = null) {
		$this->layout = 'friendsNavBar';
		$user = $this->Session->read('Auth.Utilisateur');
		
		$areFriends = $this->Message->query('SELECT ID_AMI FROM AMIS WHERE ( ID_ACTEUR='.$user['ID_ACTEUR'].' AND ID_ACTEUR_1='.$id_acteur.') OR (ID_ACTEUR='.$id_acteur.' AND ID_ACTEUR_1='.$user['ID_ACTEUR'].');');
		$this->set('utilisateur', $this->Message->Acteur->findById_acteur($id_acteur));	
		
		if(!empty($areFriends)) {
			$this->set('areFriends', true);
			$this->set('messages', $this->Message->find('all', array('conditions' => array('Message.id_acteur_rcv' => $id_acteur), 'order'=>array('Message.id_msg DESC'))));
		} else {
			$this->set('areFriends', false);
		}
	}
	
	function view($id_msg = null) {
		$this->Message->id_msg = $id_msg;
		$this->set('message', $this->Message->read());
	}
	
	function add() {
		
	}
	
	function delete($id_msg, $cascade) {
		$this->Message->delete($id_msg,true);
	}
	
	function beforeFilter() {
		$this->Auth->userModel = 'Utilisateur';
    	$this->Auth->fields = array(
	   		'username' => 'ADR_MAIL', 
	       	'password' => 'MDP'
	    );
		$this->Auth->allow('add');
	}
}
?>