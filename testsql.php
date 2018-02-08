#!/usr/bin/php

<?php

$mydb = new mysqli('127.0.0.1', 'root', '1234', testdb);

if($mydb->errno != 0){
	echo "failed to connect! : " . $mydb->error . PHP_EOL;
	exit(0);
}

echo "successful connection! ".PHP_EOL;

$my_query = "SELECT * from TestTable;";

$response = $mydb->query($my_query);
if($mydb->errno != 0){
	echo "query failed!".PHP_EOL;
	echo __FILE__.":"__LINE__.":error:".$mydb->error.PHP_EOL;
	exit(0);
}

?>
