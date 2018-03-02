<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

$client = new rabbitMQClient("../testRabbitMQ.ini","queryServer");

$request = "This is a test request over queryqueue\n";

$response = $client->send_request($request);
echo $response;

?>
