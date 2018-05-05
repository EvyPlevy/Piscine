<?php

	session_start();

	require 'configure.php';

	$BDD = mysqli_connect("localhost","root","");
	mysqli_select_db($BDD,"plouf_plouf");

$error = FALSE;


if($_POST["Comm"] == NULL){

            // On met la variable $error à TRUE pour que par la suite le navigateur sache qu'il y'a une erreur à afficher.
  $error = TRUE;

 	// On écrit le message à afficher :
  echo "Tout les champs doivent être remplis !";
}

else
{


	if (isset($_POST['submit']))
	{
		if ($_FILES['file']['error']!=4)
		{
		$file = $_FILES['file'];
		$fileTmpName = $_FILES['file']['tmp_name'];
		$fileError = $_FILES['file']['error'];
		$fileSize = $_FILES['file']['size'];
		$fileName =$file['name'];
		$fileExt = explode('.',$fileName);
		$fileActualExt = strtolower(end($fileExt));
		$allowed=array('jpg', 'png', 'mp4', 'pdf');

		if (in_array($fileActualExt, $allowed) && $fileError == 0 && $fileSize < 10000000){
			$fileNameNew = uniqid('',true).".".$fileActualExt;
			$fileDestination = 'upload/'.$fileNameNew;
			move_uploaded_file($fileTmpName, $fileDestination);

			if ($fileActualExt == 'jpg' || $fileActualExt == 'png'){
				$type = 1;
			}

			elseif ($fileActualExt == 'mp4'){
				$type = 2;
			}

			elseif ($fileActualExt == 'pdf'){
				$type = 3;
			}


		}
		else  {
			echo"erreur d'upload"; 
		}

	}
	else{
		$type = 0;
		$fileDestination = " ";
	}
	$sql = "INSERT INTO `media` VALUES (NULL,'".$type."','".$fileDestination."',' ','".$_POST['Comm']."','".date("Y-m-d").' '.date("H:i")."','".$_POST['Place']."','".$_SESSION["ID"]."',1,2 )";
	$sql = mysqli_query($BDD,$sql);

	$sql = "SELECT ID FROM media WHERE media.Date=".date("Y-m-d").' '.date("H:i")." ";    	
	$NB1=mysqli_query($BDD,$sql);	
	if ($gne = $NB1->fetch_assoc()) {
	$nb= $gne['ID'];
	$sql2 = "INSERT INTO `notification` VALUES ('".$_SESSION["ID"]."','".$nb."','1','".date("Y-m-d").' '.date("H:i")."'')";
	echo $sql2;
	$sql2 = mysqli_query($BDD,$sql2);
	//header('Location:Accueil.php');
	}

	
	}
	}

?>