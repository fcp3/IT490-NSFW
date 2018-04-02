
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

//$user = $_POST["username"];
//$pass = $_POST["password"];
//$email = $_POST["email"];
//$type = $_POST["type"];

$client = new rabbitMQClient("testRabbitMQ.ini","testServer");
if (isset($argv[1]))
{
  $msg = $argv[1];
}
else
{
  $msg = "test message";
}

//$request = array();
//if(isset($_POST["login"])) {
//	$request['type'] = "Login";
//}
//else {
//	$request['type'] = "Register";
//}
//$request['username'] = $user;
//$request['password'] = $pass;
//$request['email'] = $email;
//$request['message'] = $msg;
//$request['type'] = $type;
$request = "Testing publish message";
//echo var_dump($request);
//$response = $client->send_request($request);
$response = $client->send_request($request);

//echo "client received response: ".PHP_EOL;
//print_r($response);
//echo "\n\n";

echo $argv[0]." END".PHP_EOL;

?>

