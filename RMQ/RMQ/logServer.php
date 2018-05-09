#!/usr/bin/php
<?php
require_once('../include/path.inc');
require_once('../include/get_host_info.inc');
require_once('../include/rabbitMQLib.inc');



function logProcessor($log)
{
 	echo "received log".PHP_EOL; 
	echo $log;
	file_put_contents("/var/log/local490/masterLog.txt",$log.PHP_EOL,FILE_USE_INCLUDE_PATH | FILE_APPEND);

}

$server = new rabbitMQServer("../include/logServer.ini","logServer");
echo var_dump($server);

$server->process_requests('logProcessor');
exit();
?>

