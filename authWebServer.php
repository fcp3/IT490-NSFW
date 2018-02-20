<?php

session_start();

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

//echo "client received response: ".PHP_EOL;
//echo $response["message"] . PHP_EOL;
//echo "\n\n";

switch ($response["message"]["type"]) {
	case "login":
		if ($response["message"]["result"]) {
			$_SESSION["userID"] = $request["username"];
			$_SESSION["password"] = $request["password"];
			header("Location: /samplehome.php");
		} else {
			echo "Login error!" . PHP_EOL;
		}
		break;
	case "register":
		if ($response["message"]["result"]) {
			$_SESSION["userID"] = $request["username"];
			$_SESSION["password"] = $request["password"];
			header("Location: /sampleregistered.php");
		} else {
			echo "Registration error!" . PHP_EOL;
		}		
		break;
	default:
		echo "REQUEST ERROR!" . PHP_EOL;
}




//echo $argv[0]." END".PHP_EOL;

?>
