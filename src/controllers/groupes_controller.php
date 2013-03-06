<?php
class GroupesController extends AppController {
	var $name = 'Groupes';
	
	/* groupes appartenant à un utilisateur */
	function index() {
		$user = $this->Session->read('Auth.Utilisateur');
		$this->set('groupes', $this->Groupe->find('all', array('conditions' => array('Groupe.id_acteur' => $user['ID_ACTEUR']))));
	}
	
	/* Ajout d'un groupe */
	function add() {
		if (!empty($this->data)) {
			$user = $this->Session->read('Auth.Utilisateur');
			$this->Groupe->Acteur->set('ID_PHOTO', 0);
			$acteur = $this->Groupe->Acteur->save();
			
			if (!empty($acteur)) {
				$this->data['Groupe']['ID_ACTEUR_GRP'] = $this->Groupe->Acteur->id;
				$this->data['Groupe']['ID_ACTEUR'] = $user['ID_ACTEUR'];
				$this->Groupe->save($this->data);
				$this->redirect("/");
			}
		}
	}
	
	/* delete */
	function delete($id_acteur) {
		$this->Groupe->Acteur->delete($id_acteur, true);
		$this->Session->setFlash('the groupe with id :'.$id_acteur.' has been deleted');
		$this->redirect("/");
	}
	
	/* search groupes */
	function search() {
		if (!empty($this->data)) {
			$this->set('groupes', $this->Groupe->find('all', array('conditions' => array('Groupe.nom' => $this->data['Groupe']['NOM']))));
		}
	}
	
	/* show one group profile */
	function view($id_acteur = null) {
		$this->layout = 'groupsNavBar';
		$this->Groupe->id_acteur_grp = $id_acteur;
		$groupe = $this->Groupe->read();
		$this->set('utilisateur', $groupe);

		$user = $this->Session->read('Auth.Utilisateur');
		$isPartOf = $this->Groupe->query('SELECT ID_REJCOUNTER FROM REJOINDRE_GRPS WHERE ID_ACTEUR_USER ='.$user['ID_ACTEUR'].' AND ID_ACTEUR_GRP ='.$id_acteur.';');
		if(!empty($areFriends) || ($groupe['ID_ACTEUR'] == $user['ID_ACTEUR'])) {
			$this->set('areFriends', true);
		} else {
			$this->set('areFriends', false);
		}
	}
	
	/* Edition du Profil d'un groupe */
	function edit($id_acteur = null) {
		$this->Groupe->id_acteur_grp = $id_acteur;
		if (empty($this->data)) {
			$this->data = $this->Groupe->read();
			$this->set('groupe', $this->data);
		} else {
			if ($this->Groupe->save($this->data)) {
				$this->Session->setFlash('Le profil du groupe a été mis à jour.');
				$this->redirect(array('action' => 'profil'));
			}
		}
	}
	
	function photos(){
	
	}
	
	function boite_reception(){
	
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