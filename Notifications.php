<?php
	session_start();

	require 'configure.php';

	$BDD = mysqli_connect("localhost","root","");
	mysqli_select_db($BDD,"plouf_plouf");
?>

<!DOCTYPE html>

	<html>

	    <head>
	    
	        <title>Notification </title>
	    
	    </head>
	    
	    <body>
	    
	        <div>
	        	<?php
	        	$sql = "SELECT * FROM notification";
				    $result=mysqli_query($BDD,$sql);
				    while ($row = $result->fetch_assoc()) 
				    {
				    	$sql = "SELECT Surname FROM person WHERE ID=".$row["ID_Profil"]." ";
				    	
				    	$NB1=mysqli_query($BDD,$sql);	
				    	if ($gne = $NB1->fetch_assoc()) {
					    $nb= $gne['Surname'];
					    }
					    echo $nb;

					    if ($row["Type"]==0){
					    	echo " a aime une publication le ";
					    }
					    elseif ($row["Type"]==1){
					    	echo " a publie le ";
					    }

					    else{
					    	echo " a commente le ";
					    }

					    echo " ".$row["Date"]."<br />";


				    }

	        	?>
	        	

	        </div>
	    </body>

	</html>

