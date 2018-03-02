
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

$client = new rabbitMQClient("testRabbitMQ.ini","testServer");

//$request = array();
/*
This will end up being an array anyways, so you can try messing around with it
You can do $request[<name of array member>] = <value>
*/

//place holder request for now
$request = "Testing request query message";

$response = $client->send_request($request);

echo var_dump($response);

echo $argv[0]." END".PHP_EOL;

?>
