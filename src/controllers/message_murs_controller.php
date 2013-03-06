<?php
class MessageMursController extends AppController {
	var $name = 'MessageMurs';
	function index() {
		$this->set('messageMurs', $this->MessageMur->find('all'));
	}
	function view($id_msg = null) {
		$this->MessageMur->id_msg = $id_msg;
		$this->set('messageMur', $this->MessageMur->read());
	}
	
	/* ajout d'un message mur */
	function add($id_rcv = null) {
		if (!empty($this->data)) {
			$user = $this->Session->read('Auth.Utilisateur');
			$this->MessageMur->Message->set('ID_ACTEUR_ENV', $user['ID_ACTEUR']);
			$this->MessageMur->Message->set('ID_ACTEUR_RCV', $id_rcv);
			$message = $this->MessageMur->Message->save();
			
			if (!empty($message)) {
				$this->data['MessageMur']['ID_MSG'] = $this->MessageMur->Message->id;
				$this->MessageMur->save($this->data);
				$this->Session->setFlash('Message saved.');
				$this->redirect("/Messages/indexFriend/".$id_rcv);
			}
		}
	}
	function delete($id_msg) {
		$this->MessageMur->Message->delete($id_msg, true);
		$this->Session->setFlash('the message with id :'.$id_msg.' has been deleted');
		$this->redirect("/");
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