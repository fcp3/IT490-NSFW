#!/usr/bin/php
<?php
require_once('rabbitMQLib.inc');

function logger($error){


$client = new rabbitMQClient("testRabbitMQ.ini","logServer");



$host_stamp = date('Y-m-d H:i:s', time())." ".gethostname()." ".$error.PHP_EOL;
file_put_contents("/var/log/local490/log.txt",$host_stamp,FILE_USE_INCLUDE_PATH | FILE_APPEND);



$publish = array();
$publish ['message'] = $host_stamp;   
$response = $client->publish($publish);


}

?>
