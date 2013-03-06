<?php
class MessagesGrpesController extends AppController {
	var $name = 'MessageGrpes';
	function index() {
		$this->set('messageGrpes', $this->MessageGrpe->find('all'));
	}
	function view($id_msg = null) {
		$this->MessageGrpe->id_msg = $id_msg;
		$this->set('message_grpe', $this->MessageGrpe->read());
	}
	function add() {
		
	}
	function delete($id_msg, $cascade) {
		$this->MessageGrpe->delete($id_msg,true);
		$this->Session->setFlash('the message_grpe with id :'.$id_msg.' has been deleted');
	}
	
	function beforeFilter() {
		$this->Auth->userModel = 'Utilisateur';
    	$this->Auth->fields = array(
	   		'username' => 'NOM', 
	       	'password' => 'MDP'
	    );
		//$this->Auth->allow('index','add');
	}
}
?>