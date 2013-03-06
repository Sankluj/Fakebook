<?php
class ActeursController extends AppController {
	var $name = 'Acteurs';
	function index() {
		$this->set('acteurs', $this->Acteur->find('all'));
	}
	function view($id_acteur = null) {
		$this->Acteur->id_acteur = $id_acteur;
		$this->set('acteur', $this->Acteur->read());
	}
	function add() {
		//$this->Acteur->save($this->data['Utilisateur']['ID_ACTEUR']);
	}
	function delete($id_acteur, $cascade) {
		$this->Acteur->delete($id_acteur,true);
	}
	
	function beforeFilter() {
		$this->Auth->userModel = 'Utilisateur';
    	$this->Auth->fields = array(
	   		'username' => 'NOM', 
	       	'password' => 'MDP'
	    );
		$this->Auth->allow('index','add');
	}
}
?>