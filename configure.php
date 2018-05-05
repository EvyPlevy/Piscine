<?php
session_start();

$BDD = mysqli_connect("localhost","root","");
mysqli_select_db($BDD,"plouf_plouf");
// On met les variables utilisé dans le code PHP à FALSE (C'est-à-dire les désactiver pour le moment).
$error = FALSE;
$registerOK = FALSE;

?>