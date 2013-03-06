<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title><?php echo $title_for_layout?></title>
	<!-- Inclue les fichiers et scripts externes ici (Voir le HTML Helper pour plus d'informations) -->
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
	<?php echo $html->css('application'); ?>
</head>
<body>

	<!-- Partie Menu -->
	<div id="partie_menu">
		<?php echo $this->element('PartieMenu'); ?>
	</div>

	<!-- Partie Gauche -->
	<div id="partie_gauche">
		<?php echo $this->element('PartieGauche'); ?>
	</div>
	
	
	<!-- Partie Droite -->
	<div id="partie_droite">
		<?php echo $this->element('PartieDroite'); ?>
	</div>
	
	
	<!-- C'est ici que je veux que mes vues soient affichées -->
	<div id="partie_vue">
		<?php echo $content_for_layout ?>
	</div>
	
	
</body>
</html>
