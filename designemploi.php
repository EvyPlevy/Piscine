	<!DOCTYPE html>
	<html>
	
	
	<form method="POST" action="Deposit.php" >
		<?php 
			require "configure.php";
			$sql = "SELECT * FROM recruitment";
			$result=mysqli_query($BDD,$sql);
			while ($row = $result->fetch_assoc()) {
			$sql = "SELECT Picture_URL FROM profile WHERE ID=".$row["ID_Rectruter"]." ";
			   	$NB1=mysqli_query($BDD,$sql);	
			   	if ($gne = $NB1->fetch_assoc()) {
			    $nb2= $gne['Picture_URL'];
				}
				echo '<img src="'.$nb2.'">'."</br>";
				$sql = "SELECT Surname FROM person WHERE ID=".$row["ID_Rectruter"]." "; 	
				$NB1=mysqli_query($BDD,$sql);	
				if ($gne = $NB1->fetch_assoc()) {
				   $nb= $gne['Surname'];
				}
				echo $nb;
				echo " a publié une offre : ";
				echo $row["Title"]."</br>";
				echo $row["Description"]."</br>";
				echo " Date de depot : ".$row["DepositDate"]."</br>";
				echo " Date de  fin de depot de candidature : ".$row["EndPostDate"]."</br>";
				echo " Date de debut du stage: ".$row["BeginningDate"]."</br>";
				echo " Date de fin du stage: ".$row["EndDate"]."</br>";
				echo " Lieu du stage : ".$row["Country"]."</br>";
				echo " Langage : ".$row["Language"]."</br>";
				echo " Competences necessaires :  ".$row["RequiredSkills"]."</br>";

				echo '<form method="POST" action="Deposit.php" >';
				echo '<td><input type="text" name=IDMed id="IDMed" value ='.$row["ID"].' /></td>';
				echo '<td><label name="Comm" rows=10 COLS=40></label></td>';
	            echo '<td><input type="text" name="Comm" id="Comm"/></td>';
	            echo '<button type="submit" name="Deposit" value="Deposit">Deposer ma candidature</button>'."<br />";
				echo '</form >';

			}


		?>
		</form>

	</body>
	</html>