<?php
class UtilisateursController extends AppController {
	var $name = 'Utilisateurs';
	
	/* Profil de l'utilisateur */
	function profil() {
		$this->layout = 'userNavBar';
		$this->set('utilisateur', $this->Session->read('Auth.Utilisateur'));
	}
	
	/* Sign in */
	function add() {
		if (!empty($this->data)) {
			$this->Utilisateur->Acteur->set('ID_PHOTO', 0);
			$acteur = $this->Utilisateur->Acteur->save();
			
			if (!empty($acteur)) {
				$this->data['Utilisateur']['ID_ACTEUR'] = $this->Utilisateur->Acteur->id;
				$this->Utilisateur->save($this->data);
				$this->Session->setFlash('New user saved.');
				$this->redirect("/");
			}
		}
	}
	
	/* delete */
	function delete($id_acteur) {
		$this->Utilisateur->Acteur->delete($id_acteur, true);
		$this->Session->setFlash('the post with id :'.$id_acteur.' has been deleted');
		$this->redirect("/");
	}
	
	/* search users */
	function search() {
		if (!empty($this->data)) {
			$this->set('users', $this->Utilisateur->find('all', array('conditions' => array('Utilisateur.nom' => $this->data['Utilisateur']['NOM']))));
		}
	}
	
	/* show one user profile */
	function view($id_acteur = null) {
		$this->layout = 'friendsNavBar';
		$this->Utilisateur->id_acteur = $id_acteur;
		$this->set('utilisateur', $this->Utilisateur->read());
		
		$user = $this->Session->read('Auth.Utilisateur');
		$areFriends = $this->Utilisateur->query('SELECT ID_AMI FROM AMIS WHERE ( ID_ACTEUR='.$user['ID_ACTEUR'].' AND ID_ACTEUR_1='.$id_acteur.') OR (ID_ACTEUR='.$id_acteur.' AND ID_ACTEUR_1='.$user['ID_ACTEUR'].');');
		if(!empty($areFriends)) {
			$this->set('areFriends', true);
		} else {
			$this->set('areFriends', false);
		}
	}
	
	/* log in */
	function login() {
	}
	
	/* log out */
	function logout() {
		$this->Session->setFlash('Logout');
	    $this->redirect($this->Auth->logout());
	}
	
	/* Edition du Profil d'un utilisateur */
	function edit($id_acteur = null) {
		$this->Utilisateur->id_acteur = $id_acteur;
		if (empty($this->data)) {
			$this->data = $this->Utilisateur->read();
			$this->set('utilisateur', $this->data);
		} else {
			if ($this->Utilisateur->save($this->data)) {
				$this->Session->setFlash('Votre profil a été mis à jour.');
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