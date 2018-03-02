<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

function requestProcessor($request) {

	echo "Found request!" . PHP_EOL;
	echo $request . PHP_EOL;
	return "Request was received!\n";

}

$server = new rabbitMQServer("../testRabbitMQ.ini","queryServer");

$server->process_requests('requestProcessor');
exit();

?>
