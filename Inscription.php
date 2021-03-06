<?php

require 'configure.php';

// On regarde si l'utilisateur est bien passé par le module d'inscription
if(isset($_POST["register"])){
		
		// On regarde si tout les champs sont remplis, sinon, on affiche un message à l'utilisateur.
		if($_POST["mail"] == NULL OR $_POST["pass"] == NULL OR $_POST["pass2"] == NULL){
				
				// On met la variable $error à TRUE pour que par la suite le navigateur sache qu'il y'a une erreur à afficher.
				$error = TRUE;
				
				// On écrit le message à afficher :
				$errorMSG = "Tout les champs doivent être remplis !";
						
		}
		
		// Sinon, si les deux mots de passes correspondent :
		elseif($_POST["pass"] == $_POST["pass2"]){
				
				// On regarde si le mot de passe et le nom de compte n'est pas le même
				if($_POST["mail"] != $_POST["pass"]){
						
						// Si c'est bon on regarde dans la base de donnée si le nom de compte est déjà utilisé :
						$sql = "SELECT Mail FROM person WHERE Mail = '".$_POST["mail"]."' ";
						$nb = mysqli_query($BDD,$sql);
				// On compte combien de valeur à pour nom de compte celui tapé par l'utilisateur.
				$sql = mysqli_num_rows($nb);
				
					 // Si $sql est égal à 0 (c'est-à-dire qu'il n'y a pas de nom de compte avec la valeur tapé par l'utilisateur
					 if($sql == 0){
					 
							// Si tout va bien on regarde si le mot de passe n'exède pas 50 caractères.
							if(strlen($_POST["pass"] < 50)){
							
								 // Si tout va bien on regarde si le nom de compte n'exède pas 100 caractères.
								 if(strlen($_POST["mail"] < 100)){
								 
										// Si le nom de compte et le mot de passe sont différent :
										if($_POST["mail"] != $_POST["pass"]){

											 // Si tout ce passe correctement, on peut maintenant l'inscrire dans la base de données :
										
											 $sql = "INSERT INTO `person` VALUES (null,'".$_POST["name"]."','".$_POST["surname"]."','".$_POST["pass"]."','".$_POST["mail"]."',1,'20181010',1);";
											 $sql = mysqli_query($BDD,$sql);
											 $sql = "SELECT ID FROM person ORDER BY ID DESC LIMIT 1";
											 $result = mysqli_query($BDD,$sql);
											 $data=mysqli_fetch_assoc($result);
											 $sql = "INSERT INTO `profile` VALUES (null, '20181010',0,0,0,'null','null','null','null','null','null','null','null','null','null','".$data['ID']."',0)";
											 $result = mysqli_query($BDD,$sql);
											 // Si la requête s'est bien effectué :
											 if($sql){
											 
													// On met la variable $registerOK à TRUE pour que l'inscription soit finalisé
													$registerOK = TRUE;
													// On l'affiche un message pour le dire que l'inscription c'est bien déroulé :
													$registerMSG = "Inscription réussie ! Vous êtes maintenant membre du site.";
													
													// On le met des variables de session pour stocker le nom de compte et le mot de passe :
													$_SESSION["mail"] = $_POST["mail"];
													$_SESSION["pass"] = $_POST["pass"];
													
													// Comme un utilisateur est différent, on crée des variables de sessions pour "varier" l'utilisateur comme ceci :
													// echo $_SESSION["mail"]; (bien entendu avec les balises PHP, sinons cela ne marchera pas.
											 
											 }
											 
											 // Sinon on l'affiche un message d'erreur (généralement pour vous quand vous testez vos scripts PHP)
											 else{
											 
													$error = TRUE;
													
													$errorMSG = "Erreur dans la requête SQL<br/>".$sql."<br/>";
											 
											 }
										
										}
										
										// Sinon on fais savoir à l'utilisateur qu'il a mis un nom de compte trop long.
										else{
										
											 $error = TRUE;
											 
											 $errorMSG = "Votre nom compte ne doit pas dépasser <strong>40 caractères</strong> !";
											 
											 $mail = NULL;
											 
											 $pass = $_POST["pass"];
										
										}
								 
								 }
							
							}
							
							// Si le mot de passe dépasse 60 caractères on le fait savoir
							else{
							
								 $error = TRUE;
								 
								 $errorMSG = "Votre mot de passe ne doit pas dépasser <strong>10 caractères</strong> !";
								 
								 $mail = $_POST["mail"];
								 
								 $pass = NULL;
							
							}
					 
					 }
					 
					 // Sinon on affiche un message d'erreur lui disant que ce nom de compte est déjà utilisé.
					 else{
					 
							$error = TRUE;
							
							$errorMSG = "Le nom de compte <strong>".$_POST["mail"]."</strong> est déjà utilisé !";
							
							$mail = NULL;
							
							$pass = $_POST["pass"];
					 
					 }
				}
				
				// Sinon on fais savoir à l'utilisateur qu'il doit changer le mot de passe ou le nom de compte
				else{
						
						$error = TRUE;
						
						$errorMSG = "Le nom de compte et le mot de passe doivent êtres différents !";
						
				}
				
		}
	
	// Sinon si les deux mots de passes sont différents :      
	elseif($_POST["pass"] != $_POST["pass2"]){
	
		 $error = TRUE;
		 
		 $errorMSG = "Les deux mots de passes sont différents !";
		 
		 $mail = $_POST["mail"];
		 
		 $pass = NULL;
	
	}
	
	// Sinon si le nom de compte et le mot de passe ont la même valeur :
	elseif($_POST["mail"] == $_POST["pass"]){
	
		 $error = TRUE;
		 
		 $errorMSG = "Le nom de compte et le mot de passe doivent être différents !";
	
	}
}
		
mysqli_close($BDD);
// On affiche les erreurs :
if($error == TRUE){ echo '<script language="javascript">alert("'.$errorMSG.'")</script>'; }
// Si l'inscription s'est bien déroulée on affiche le succès :
if($registerOK == TRUE){ 
echo '<script language="javascript">alert("'.$registerMSG.'")</script>';
}
 echo "<script language='javascript'>window.location = 'Connexion.html';</script>";

?>