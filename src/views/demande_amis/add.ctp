<?php
	$this->getVar($areFriends);
	echo $html->link('Request as a friend', "/DemandeAmis/add/".$utilisateur['Utilisateur']['ID_ACTEUR']);
?>