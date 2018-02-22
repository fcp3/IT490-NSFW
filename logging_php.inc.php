#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

function logger($error){


$client = new rabbitMQClient("testRabbitMQ.ini","logServer");



$host_stamp = date('Y-m-d H:i:s', time())." ".gethostname()." ".$error.PHP_EOL;
file_put_contents("/var/log/local490/log.txt",$host_stamp,FILE_USE_INCLUDE_PATH | FILE_APPEND);


$response = $client->publish($host_stamp);
echo $argv[0]." END".PHP_EOL;


}

?>


