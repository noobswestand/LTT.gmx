<?php 
	$string = file_get_contents("./words.json");
	$json = json_decode($string, true);
	foreach ($json as $word){
		echo $word[rand(0,12)]." ";
	}
?>