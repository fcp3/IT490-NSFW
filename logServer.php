#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');



function logProcessor($log)
{
 	echo "received log".PHP_EOL; 
	echo $log;
	/*
	do stuff with logs here
	*/
}

$server = new rabbitMQServer("testRabbitMQ.ini","logServer");

$server->process_requests('logProcessor');
exit();
?>

