#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

$client = new rabbitMQClient("testRabbitMQ.ini","testServer");
if (isset($argv[1]))
{
  $msg = $argv[1];
}
else
{
  $msg = "test message";
}

$request = array();
$request['type'] = $_POST["type"];
$request['username'] = $_POST["username"];
$request['password'] = $_POST["password"];
$request['message'] = $_POST["email"];
$response = $client->send_request($request);
//$response = $client->publish($request);

echo "client received response: ".PHP_EOL;
echo $response["message"] . PHP_EOL;
echo "\n\n";

echo $argv[0]." END".PHP_EOL;

?>
