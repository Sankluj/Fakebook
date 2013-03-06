<?php
class AmisController extends AppController {
	var $name = 'Amis';
	
	/* Amis d'un utilisateur */
	function index() {
		$user = $this->Session->read('Auth.Utilisateur');
		
		$this->set('utilisateur', $user);
		$this->set('amiIAsk', $this->Ami->find('all', array('conditions' => array('Ami.id_acteur' => $user['ID_ACTEUR']))));
		$this->set('amiHeAsk', $this->Ami->find('all', array('conditions' => array('Ami.id_acteur_1' => $user['ID_ACTEUR']))));
	}
	
	function view($id_ami = null) {
		$this->Ami->id_ami = $id_ami;
		$this->set('Ami', $this->Ami->read());
	}
	
	function add($id_ami = null) {
		if (!empty($id_ami)) {
			$user = $this->Session->read('Auth.Utilisateur');
			$this->Ami->set('ID_ACTEUR', $id_ami);
			$this->Ami->set('ID_ACTEUR_1', $user['ID_ACTEUR']);
			$this->Ami->save();
			$this->Session->setFlash('Ami enregistré.');
			$this->redirect("/demande_amis/delete/".$id_ami);
		}
	}
	
	function delete($id_ami) {
		$this->Ami->delete($id_ami);
		$this->Session->setFlash('the ami with id :'.$id_ami.' has been deleted');
		$this->redirect("/amis/index");
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