<?php
//MAKE SYMLINK TO amqp.ini IN /etc/php/7.0/apache2/conf.d
//AMQPConnections WILL NOT WORK WITHOUT IT
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

$user = $_POST["username"];
$pass = $_POST["password"];

echo $user.$pass;

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
$request['type'] = "Login";
$request['username'] = $user;
$request['password'] = $pass;
$request['message'] = $msg;

echo json_encode($request);


$response = $client->send_request($request);

//$response = $client->publish($request);


echo "client received response: ".PHP_EOL;
print_r($response);
echo "\n\n";

echo $argv[0]." END".PHP_EOL;

?>
