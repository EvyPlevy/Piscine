<?PHP 
	define('DB_SERVER', 'localhost');
	define('DB_USER','root');
	define('DB_PASS','');
	$database = "famille";
	$db_handle = mysqli_connect(DB_SERVER, DB_USER, DB_PASS);
	$db_found = mysqli_select_db($db_handle,$database);
?>