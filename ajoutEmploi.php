<?php

require 'configure.php';

// On regarde si l'utilisateur est bien passé par le module d'inscription
if(isset($_POST["ajoutEmploi"])){
	echo 'yes';
	// On regarde si tout les champs sont remplis, sinon, on affiche un message à l'utilisateur.
	if($_POST["name"] == NULL OR $_POST["orga"] == NULL OR  $_POST["datedebut"] == NULL OR $_POST["datefin"] == NULL OR $_POST["type"] == NULL OR $_POST["description"] == NULL OR $_POST["dateexp"] == NULL ){
			
			// On met la variable $error à TRUE pour que par la suite le navigateur sache qu'il y'a une erreur à afficher.
			$error = TRUE;
			
			// On écrit le message à afficher :
			$errorMSG = "Les champs suivants doivent être impérativement remplis : <br /> - Intitulé, Entreprise, Date de début, Type, Description et date d'expiration";
					
	}
	else if(($_POST["datedebut"] > $_POST["datefin"]) AND ($_POST["datefin"]!=NULL))
	{
		// On met la variable $error à TRUE pour que par la suite le navigateur sache qu'il y'a une erreur à afficher.
			$error = TRUE;
			
			// On écrit le message à afficher :
			$errorMSG = "La date de fin est supérieure à la date de début";
	}
	
	else if($_POST["autrediplome"]==NULL)
	{
		// Si tout ce passe correctement, on peut maintenant l'inscrire dans la base de données :

		/* $sql = "INSERT INTO `recruitment` VALUES (null,'".$_POST["description"]."','21081010','".$_POST["dateexp"]."','".$_POST["country"]."','".$_POST["name"]."','".$_POST["Statut"]."','".$_POST["type"]."','".$_POST["datedebut"]."','".$_POST["datefin"]."','".$_POST["language"]."','".$_POST["skill"]."')"; */
		$sql = "INSERT INTO `recruitment` VALUES (null,'blblb','21081010','".$_POST["dateexp"]."','','cdmge',null,'1','20181010','".$_POST["datefin"]."','','')";
		$sql = mysqli_query($BDD,$sql);
		
		// Si la requête s'est bien effectué :
		if($sql)
		{
			// On met la variable $registerOK à TRUE pour que l'inscription soit finalisé
			$registerOK = TRUE;
			// On l'affiche un message pour le dire que l'inscription c'est bien déroulé :
			$registerMSG = "Emploi ajouté";

		}
	}
}
mysqli_close($BDD);


// On affiche les erreurs :
if($error == TRUE){ echo '<script language="javascript">alert("'.$errorMSG.'")</script>'; 
echo "<script language='javascript'>window.location = 'ajoutEmploi.html';</script>"}
// Si l'inscription s'est bien déroulée on affiche le succès :
if($registerOK == TRUE){ 
echo '<script language="javascript">alert("'.$registerMSG.'")</script>';
echo "<script language='javascript'>window.location = 'designemploi.html';</script>";
}
?>