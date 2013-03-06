<?php
class DemandeAmisController extends AppController {
	var $name = 'DemandeAmis';
	
	/* Demandes d'amis d'un utilisateur */
	function index() {
		$user = $this->Session->read('Auth.Utilisateur');
		
		$this->set('utilisateur', $user);
		$this->set('envoyeurs', $this->DemandeAmi->find('all', array('conditions' => array('DemandeAmi.ID_ACTEUR_RCV' => $user['ID_ACTEUR']))));
		$this->set('envoyes', $this->DemandeAmi->find('all', array('conditions' => array('DemandeAmi.ID_ACTEUR_ENV' => $user['ID_ACTEUR']))));
	}
	
	function view($id_demande = null) {
		$this->DemandeAmi->id_demande = $id_demande;
		$this->set('Demande', $this->DemandeAmi->read());
	}
	
	function add($id_ami = null) {
		if (!empty($id_ami)) {
			$user = $this->Session->read('Auth.Utilisateur');
			$this->DemandeAmi->set('ID_ACTEUR_ENV', $user['ID_ACTEUR']);
			$this->DemandeAmi->set('ID_ACTEUR_RCV', $id_ami);
			$this->DemandeAmi->save();
			$this->Session->setFlash('Demande Ami enregistré.');
			$this->redirect("/demande_amis/index");
		}
	}
	
	function delete($id_demande) {
		$this->DemandeAmi->delete($id_demande);
		$this->Session->setFlash('the ami with id :'.$id_demande.' has been deleted');
		$this->redirect("/demande_amis/index");
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