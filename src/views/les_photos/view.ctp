<?php echo $html->image("photos/default/default.gif", array(
	"alt" => "photo",
	'url' => array('controller' => 'photo', 'action' => 'view', $photo['ID_PHOTO'])
)); ?>