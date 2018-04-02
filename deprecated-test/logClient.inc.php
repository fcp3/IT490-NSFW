
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');


$client = new rabbitMQClient("testRabbitMQ.ini","logServer");

/*
Put logging code here
$log = "Testing publish message"; // test message to publish
*/

$response = $client->publish($log);
echo $argv[0]." END".PHP_EOL;

?>
