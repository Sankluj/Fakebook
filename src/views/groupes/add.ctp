<h1>Add User</h1>
<?php echo $form->create( 'Groupe');

echo $form->input('NOM', array( 'label' => 'Nom'));
echo $form->input('ID_CATEGORIE', array( 'label' => 'Categorie'));
echo $form->input('DESCRIPTION', array( 'label' => 'Description'));

echo $form->end('Save Groupe');
?>