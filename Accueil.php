<?php
	session_start();

	require 'configure.php';

	$BDD = mysqli_connect("localhost","root","");
	mysqli_select_db($BDD,"plouf_plouf");
?>

 
<!DOCTYPE htmlL>
	<html>

	    <head>
	    <style type="text/css">
	    .moody
	    {

	        width:50px;
	        height:50px;
	    }
		</style>
	    <title>Bienvenue</title>
	    </head>
	    
	    <body>
	    	<title>Accueil </title>       

	    	<p>
		        Salut <?php echo $_SESSION["Surname"]; ?> !<br />
		        Tu es a l'accueil de mon site.  Tu veux aller sur une autre page ?

			</p>

			<form action="Publier.php" method="POST" enctype="multipart/form-data">

				<table>

	           	<tr>

				<td><label name="Comm" rows=10 COLS=40></label></td>
	            <td><input type="text" name="Comm" id="Comm"/></td>
        		<td><input type="file" name="file"/></td>
				


				<td><label for="Place"><strong>Lieu :</strong></label></td>
	            <td><input type="text" name="Place" id="Place"/></td>

				<input type="submit" name="Mood" value="Mood"/>
				<input type="submit" name="Activity" value="Activity"/>
				<select id="Mood">
				<?php
					
							/*$sql = "SELECT * FROM mood";
						    $result=mysqli_query($BDD,$sql);
						    while ($row = $result->fetch_assoc()) 
						    {
						    	
						        echo '<option value="value1">'.$row['MoodTxt'].'</option>' ;
						        //echo '<option value="value1">'.'<img class="moody" src="'.$row['MoodImg'].'">'.'</option>';
						    }*/
				    ?>
				</select>
					
				<select id="Activity">
				<?php
					
							/*$sql = "SELECT * FROM activity";
						    $result=mysqli_query($BDD,$sql);
						    while ($row = $result->fetch_assoc()) 
						    {
						    	$nb= $row['ActivityTxt']."</br>";
						        echo '<option value="value1">'.$nb.'</option>' ;
						        echo '<img src="'.$row['ActivityTxt'].'">';
						    }*/
				    ?>
				</select>
	            </tr>
	       		</table>
	       		<button type="submit" name="submit" value="Publier ">Publier !</button>
			</form>

			<form action="Reaction.php" method="POST">
				<p><?php
					$sql = "SELECT * FROM media";
				    $result=mysqli_query($BDD,$sql);
				    while ($row = $result->fetch_assoc()) 
				    {
				    	$sql = "SELECT Surname FROM person WHERE ID=".$row["ID_Profil"]." ";
				    	
				    	$NB1=mysqli_query($BDD,$sql);	
				    	if ($gne = $NB1->fetch_assoc()) {
					    $nb= $gne['Surname'];
					    }
					    echo "name : ".$nb."<br />";
				    	echo "date : ".$row["Date"]."<br />";
				    	if ($row["URL"]!=" "){
				    	echo '<img src="'.$row["URL"].'">';
				    	}
				        echo $row["Texte"]."<br />" ;

				        $sql = "SELECT * FROM commentary WHERE ID_Media=".$row["ID"]." ";
				    	
				    	$NB2=mysqli_query($BDD,$sql);	
				    	while ($gne1 = $NB2->fetch_assoc()) {
						    $sql = "SELECT Surname FROM person WHERE ID=".$row["ID_Profil"]." ";
					    	
					    	$NB3=mysqli_query($BDD,$sql);	
					    	if ($gne2 = $NB3->fetch_assoc()) {
						    $nb= $gne2['Surname'];
						    }
						    echo "name : ".$nb."<br />";
					    	echo "date : ".$gne1["Date"]."<br />";
					    	echo "Texte : ".$gne1["Content"]."<br />";
					    }


				        $_SESSION["Post"] = $row["ID"];
				        echo '<button type="submit" name="Like" value="Like ">Liker</button>';
	           			echo '<form action="Reaction.php" method="POST">';
	           			echo '<td><input type="text" name="textComm" id="textComm"/></td>';
	            		echo '<button type="submit" name="Commenter" value="Commenter">Commenter</button>'."<br />";

				        echo '</form >';
				    }


				?></p>

				<a href="Notifications.php">Notifications</a>


			</form>
    		 	    
	    </body>

	</html>

