<?php
$session->flash('auth');
echo $form->create('Utilisateur', array('action' => 'login'));
echo $form->input('ADR_MAIL', array( 'label' => 'Mail'));
echo $form->input('MDP', array( 'type' => 'password', 'label' => 'Password'));
echo $form->end('Login');
echo $html->link('Sign up', array('controller' => 'utilisateurs', 'action' => 'add'));
?>