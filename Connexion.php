<?php

session_start();
$BDD = mysqli_connect("localhost","root","");
mysqli_select_db($BDD,"plouf_plouf");

// On met les variables utilisé dans le code PHP à FALSE (C'est-à-dire les désactiver pour le moment).
$error = FALSE;
$registerOK = FALSE;

if($_POST["mail"] == NULL OR $_POST["pass"] == NULL){

            // On met la variable $error à TRUE pour que par la suite le navigateur sache qu'il y'a une erreur à afficher.
  $error = TRUE;

            // On écrit le message à afficher :
  $errorMSG = "Tout les champs doivent être remplis !";

}
$sql = "SELECT Mail FROM person WHERE Password = '".$_POST["pass"]."' ";
    $nb = mysqli_query($BDD,$sql);
    if ($row = $nb->fetch_assoc()) {
    $nb="mail ".$row['Mail'];
    }
    
if($_POST["mail"] != $_POST["pass"]){                             
  // Si c'est bon on regarde dans la base de donnée si le nom de compte est déjà utilisé :
  $sql = "SELECT Mail FROM person WHERE Mail = '".$_POST["mail"]."' ";
  $nb = mysqli_query($BDD,$sql);
                // On compte combien de valeur à pour nom de compte celui tapé par l'utilisateur.
  $sql = mysqli_num_rows($nb);
                     // Si $sql est égal à 1 (c'est-à-dire qu'il y a un nom de compte avec la valeur tapé par l'utilisateur
  if($sql == 1){
    $sql = "SELECT Password FROM person WHERE Mail = '".$_POST["mail"]."' ";
    $nb = mysqli_query($BDD,$sql);
    if ($row = $nb->fetch_assoc()) {
    $nb= $row['Password'];
    }
    if ($nb == $_POST["pass"]){
      //On met la variable $registerOK à TRUE pour que l'inscription soit finalisé
      $registerOK = TRUE;
                              // On l'affiche un message pour le dire que l'inscription c'est bien déroulé :
      $registerMSG = "Connexion reussie";

      // On  met des variables de session pour stocker le nom de compte et le mot de passe :
      $_SESSION["mail"] = $_POST["mail"];
      $_SESSION["pass"] = $_POST["pass"];


      $sql = "SELECT Surname FROM person WHERE Mail = '".$_POST["mail"]."' ";
      $nb = mysqli_query($BDD,$sql);
      if ($row = $nb->fetch_assoc()) 
      {
        $nb= $row['Surname'];
      }
      $_SESSION["Surname"] = $nb;

      $sql = "SELECT ID FROM person WHERE Mail = '".$_POST["mail"]."' ";
      $nb = mysqli_query($BDD,$sql);
      if ($row = $nb->fetch_assoc()) 
      {
        $nb= $row['ID'];
      }
      $_SESSION["ID"] = $nb;

      
    }

    else{
      $error = TRUE;
      $errorMSG ="le mot de passe ne correspond pas !";
    }

  }
}

mysqli_close($BDD);
 // On affiche les erreurs :
if($error == TRUE){ 
  echo "<p align='center' style='color:red;'>".$errorMSG."</p>"; 
}
if($registerOK == TRUE){ 
  echo "<p align='center' style='color:green;'><strong>".$registerMSG."</strong></p>"; 
  
  header('Location:Accueil.php');
  } 

?>



