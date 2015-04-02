<?php
   //ini_set('display_startup_errors',1);
	//ini_set('display_errors',1);
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
   //get the offset
   dbConnect();
	$query="SELECT * 
FROM  `LTT_HighScore`.`Key` 
WHERE  `Key`.`ID` =  'KeyValue'";
	$keyValue = mysql_query ($query) or die ("Error in query: $query. " .mysql_error());
	$keyValue=mysql_fetch_assoc($keyValue);
	$keyValue=$keyValue['number'];
	dbClose();
	//echo $keyValue;
   
   
	function decrypt($input) {
		//var str,copy,char;
		$str='';
		$copy='';
		$char='';
		$arg1=25;
		$input2=$input;
		$arg1=max(0,min(197,$arg1));
		$char=chr(58+$arg1);
		while (strpos($input2,$char)>0) {
		$copy=substr($input2,0,strpos($input2,$char));
		$input2=substr_replace($input2,"",0,strpos($input2,$char)+1);
		$str.=chr(intval($copy)-$arg1);
		}
		
		return $str;
	}
	function encrypt($input){
		$str="";
		$arg1=25;
		$input2=$input;
		$arg1=max(0,min(197,$arg1));
		$char=chr(58+$arg1);
		while (strlen($input2)>0) {
		$str.=strval(ord(substr($input2,0,1))+$arg1).$char;
		$input2=substr_replace($input2,"",0,1);
		}
		return $str;
	}
	
	
	
	function decrypt2($input) {
		//var str,copy,char;
		global $keyValue;
		$str='';
		$copy='';
		$char='';
		$arg1=$keyValue;
		$input2=$input;
		$arg1=max(0,min(197,$arg1));
		$char=chr(58+$arg1);
		while (strpos($input2,$char)>0) {
		$copy=substr($input2,0,strpos($input2,$char));
		$input2=substr_replace($input2,"",0,strpos($input2,$char)+1);
		$str.=chr(intval($copy)-$arg1);
		}
		
		return $str;
	}
	function encrypt2($input){
		global $keyValue;
		$str="";
		$arg1=$keyValue;
		$input2=$input;
		$arg1=max(0,min(197,$arg1));
		$char=chr(58+$arg1);
		while (strlen($input2)>0) {
		$str.=strval(ord(substr($input2,0,1))+$arg1).$char;
		$input2=substr_replace($input2,"",0,1);
		}
		return $str;
	}
	
	function rc4($key, $str) {
		$s = array();
		for ($i = 0; $i < 256; $i++) {
			$s[$i] = $i;
		}
		$j = 0;
		for ($i = 0; $i < 256; $i++) {
			$j = ($j + $s[$i] + ord($key[$i % strlen($key)])) % 256;
			$x = $s[$i];
			$s[$i] = $s[$j];
			$s[$j] = $x;
		}
		$i = 0;
		$j = 0;
		$res = '';
		for ($y = 0; $y < strlen($str); $y++) {
			$i = ($i + 1) % 256;
			$j = ($j + $s[$i]) % 256;
			$x = $s[$i];
			$s[$i] = $s[$j];
			$s[$j] = $x;
			$res .= $str[$y] ^ chr($s[($s[$i] + $s[$j]) % 256]);
		}
		return $res;
	}
	
	
	
	
	
	
	$wordact=encrypt("act");
	$act=decrypt($_POST[$wordact]);
	
   switch($act) {
   
		case "GetTime":
			dbConnect();
			$query="SELECT * 
FROM  `LTT_HighScore`.`Key` 
WHERE  `Key`.`ID` =  'KeyValue'";
			$key_value = mysql_query ($query) or die ("Error in query: $query. " .mysql_error());
			$key_value=mysql_fetch_assoc($key_value);
			$key_value=$key_value['number'];
			//echo $key_value;
			echo rc4("xPWnLVha3kNSYsPFTXg72Xna",strval($key_value));
			//echo base64_encode(strval($key_value));
			dbClose();
		break;

   }
  
?>