<h1>Add User</h1>
<?php echo $form->create( 'Utilisateur');

echo $form->input('NOM', array( 'label' => 'Nom'));
echo $form->input('PRENOM', array( 'label' => 'Prenom'));
echo $form->input('MDP', array( 'type' => 'password', 'label' => 'Password'));
echo $form->input('ADR_MAIL', array( 'label' => 'Adresse e-mail'));
echo $form->input('DATE_NAISS', array( 'label' => 'Date de Naissance',
	 								   'minYear' => '1900',
									   'maxYear' => '2009'
        							 )
);
echo $form->input('NO_RUE', array( 'label' => 'Numero de rue :'));
echo $form->input('ADRESSE', array( 'label' => 'Adresse (ex : Rue de la Soif)'));
echo $form->input('CP', array( 'label' => 'Code Postal'));
echo $form->input('VILLE', array( 'label' => 'Ville'));
echo $form->input('REGION', array( 'label' => 'Region'));

echo $form->end('Save Utilisateur');
?>