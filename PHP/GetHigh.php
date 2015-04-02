<?php
	ini_set('display_startup_errors',1);
	ini_set('display_errors',1);
	//error_reporting(-1);
   // database variables
   $dbHost = "localhost";
   $dbName = "LTT_HighScore";
   $dbUser = "root";
   $dbPass = "p45163281";
	
   // database connection functions
   function dbConnect() {
      global $dbCon, $dbHost, $dbName, $dbUser, $dbPass;
      $dbCon = mysql_connect($dbHost,$dbUser,$dbPass);
      return mysql_select_db($dbName);
   }
   
   function dbClose() {
      global $dbCon, $dbHost, $dbName, $dbUser, $dbPass;
      mysql_close($dbCon);
      unset($dbCon);
   }
   
   function echoArray($query) {
		$rows = array();
		while($r = mysql_fetch_assoc($query)) {
		   $rows[] = $r;
		}
		for ($x = 0; $x <= count($rows)-1; $x++) {
			echo '<pre>';
			print_r($rows[$x]);
			echo '</pre>';
		} 
   }
   
   $act=$_GET["act"];
   switch($act) {
		case "GetTop":
			dbConnect();
			$sql="SELECT * FROM HighScores
			ORDER BY Score DESC";
			$sql=mysql_query($sql) or die(mysql_error());
			echoArray($sql);
			dbClose();
		break;
		
		case "GetBottom":
			dbConnect();
			$sql="SELECT * FROM HighScores
			ORDER BY Score";
			$sql=mysql_query($sql) or die(mysql_error());
			echoArray($sql);
			dbClose();
		break;
		
		case "AZ":
			dbConnect();
			$sql="SELECT * FROM HighScores
			ORDER BY Name";
			$sql=mysql_query($sql) or die(mysql_error());
			echoArray($sql);
			dbClose();
		break;
		
		case "ZA":
			dbConnect();
			$sql="SELECT * FROM HighScores
			ORDER BY Name DESC";
			$sql=mysql_query($sql) or die(mysql_error());
			echoArray($sql);
			dbClose();
		break;
		
   
   }
    
?>











