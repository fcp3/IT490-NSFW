<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

$client = new rabbitMQClient("../testRabbitMQ.ini","queryServer");

//$request = "This is a test request over queryqueue\n";

$reqType = "pokeSearch";

switch($reqType) {
	case "pokeSearch":
		$request["type"] = $reqType;
		$request["game"] = "red-blue-yellow";
		//$request["name"] = "bulbasaur";
		$request["type1"] = "grass";
		$request["type2"] = "poison";
}

$response = $client->send_request($request);
echo var_dump(json_decode($response));

?>
