<?php
class LesPhotosController extends AppController {
	var $name = 'LesPhotos';
	function index() {
		$user = $this->Session->read('Auth.Utilisateur');
		$this->set('photo', $this->LesPhoto->findById_photo($auth['ID_PHOTO']));
	}
	function view($id_photo = null) {
		$this->LesPhoto->id_photo = $id_photo;
		$this->set('photo', $this->LesPhoto->read());
	}
	
	function add() {
	}
	
	function delete($id_photo, $cascade) {
		$this->lesPhoto->delete($id_photo,true);
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