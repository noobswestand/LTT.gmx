<?php
   ini_set('display_startup_errors',1);
	ini_set('display_errors',1);
	error_reporting(-1);
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
   
   $key_value=rand(0,25);
   echo $key_value;
   echo "<br>";
    dbConnect();//
	$sql="UPDATE `Key` SET `number`=$key_value
	WHERE ID='KeyValue'";//
	$sql=mysql_query($sql) or die(mysql_error());
   dbClose();
   
   
?>