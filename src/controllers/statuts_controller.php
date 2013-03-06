<?php
class StatutsController extends AppController {
	var $name = 'Statuts';
	
	function view($id_msg = null) {
		$this->Message->id_msg = $id_msg;
		$this->set('message', $this->Message->read());
	}
	
	/* ajout d'un statut */
	function add() {
		if (!empty($this->data)) {
			$user = $this->Session->read('Auth.Utilisateur');
			$this->Statut->Message->set('ID_ACTEUR_ENV', $user['ID_ACTEUR']);
			$this->Statut->Message->set('ID_ACTEUR_RCV', $user['ID_ACTEUR']);
			$message = $this->Statut->Message->save();
			
			if (!empty($message)) {
				$this->data['Statut']['ID_MSG'] = $this->Statut->Message->id;
				$this->Statut->save($this->data);
				$this->Session->setFlash('Statut saved.');
				$this->redirect("/");
			}
		}
	}
	
	function delete($id_msg) {
		$this->Statut->Message->delete($id_msg, true);
		$this->Session->setFlash('the message with id :'.$id_msg.' has been deleted');
		$this->redirect("/");
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