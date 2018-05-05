<?php


	require 'configure.php';

	$BDD = mysqli_connect("localhost","root","");
	mysqli_select_db($BDD,"plouf_plouf");

$error = FALSE;

if (isset($_POST['Deposit'])){
	$sql = "INSERT INTO `waitinglist` VALUES ('".$_POST["IDMed"]."','".$_SESSION["ID"]."','".$_POST['Comm']."','".date("Y-m-d").' '.date("H:i")."')";
	$sql1 = mysqli_query($BDD,$sql);
	echo $sql;

	header('Location:designemploi.php');
	
}
?>