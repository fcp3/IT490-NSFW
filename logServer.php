#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');



function logProcessor($log)
{
 	echo "received log".PHP_EOL; 
	echo $log;
	file_put_contents("/var/log/local490/masterLog.txt",$log.PHP_EOL,FILE_USE_INCLUDE_PATH | FILE_APPEND);

}

$server = new rabbitMQServer("testRabbitMQ.ini","logServer");

$server->process_requests('logProcessor');
exit();
?>

