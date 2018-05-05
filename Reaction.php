<?php

	session_start();

	require 'configure.php';

	$BDD = mysqli_connect("localhost","root","");
	mysqli_select_db($BDD,"plouf_plouf");

$error = FALSE;

if (isset($_POST['Like'])){
	$sql = "INSERT INTO `reaction` VALUES ('".$_SESSION["ID"]."','".$_SESSION["Post"]."','".date("Y-m-d").' '.date("H:i")."')";
	$sql = mysqli_query($BDD,$sql);
	$sql1 = "SELECT * FROM reaction";    	
	$NB1=mysqli_query($BDD,$sql1);	
	$ID = mysqli_num_rows($NB1);
	
	$sql2 = "INSERT INTO `notification` VALUES ('".$_SESSION["ID"]."','".$ID."','0','".date("Y-m-d").' '.date("H:i")."')";
	echo $sql2;
	$nb2 = mysqli_query($BDD,$sql2);
	header('Location:Accueil.php');
	

}


if (isset($_POST['Commenter'])){
	$sql = "INSERT INTO `commentary` VALUES (NULL,'".$_SESSION["Post"]."','".$_SESSION["ID"]."','".date("Y-m-d").' '.date("H:i")."','".$_POST["textComm"]."')";
	$sql = mysqli_query($BDD,$sql);

	$sql1 = "SELECT * FROM commentary";    	
	$NB1=mysqli_query($BDD,$sql1);	
	$ID = mysqli_num_rows($NB1);
	
	$sql2 = "INSERT INTO `notification` VALUES ('".$_SESSION["ID"]."','".$ID."','2','".date("Y-m-d").' '.date("H:i")."')";
	echo $sql2;
	$nb2 = mysqli_query($BDD,$sql2);
	header('Location:Accueil.php');

}
?>