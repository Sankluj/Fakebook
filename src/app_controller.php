<?php
class AppController extends Controller {
    var $components = array('Auth');

    function beforeFilter() {
	 	//$this->Auth->userModel = 'Utilisateur';
        //$this->Auth->fields = array('username' => 'NOM', 'password' => 'MDP');
		$this->Auth->loginAction = array('controller' => 'utilisateurs', 'action' => 'login');
		$this->Auth->loginRedirect = array('controller' => 'messages', 'action' => 'index');
		$this->Auth->logoutRedirect = '/';
		
		$this->Auth->authorize = 'controller';
		//$this->Auth->allow('index', 'add');
    }

	function isAuthorized() {
		if (isset($this->params[Configure::read('Routing.admin')])) {
			if ($this->Auth->user('admin') == 0) {
	        	return false;
	     	}
	   	}
		return true;
	}
}
?>