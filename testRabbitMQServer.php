#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

function doLogin($username,$password) {
  //connecting to the sample database
  $conn = mysqli_connect("localhost", "humza", "123", "testlogin");

  if(!$conn) {
    die("ERROR: Could not connect." . mysqli_connect_error());
  }
  else {
    echo "SUCCESS: Connected to database";
  }

  //creating the query
  $query = "SELECT password from Users where username = '$username'";
  $result = mysqli_query($conn, $query);
  $count = mysqli_num_rows($result);
  $array = mysqli_fetch_assoc($result);
  $pass = $array["password"];
  if($count == 1) {
    return true;
  }
  else {
    return false;
  }
}

function requestProcessor($request)
{

  echo "received request".PHP_EOL;
  var_dump($request);
  if(!isset($request['type']))
  {
    return "ERROR: unsupported message type";
  }
  switch ($request['type'])
  {
    case "Login":
      print_r($request);
      return doLogin($request['username'],$request['password']);
    case "validate_session":
      return doValidate($request['sessionId']);
  }
  return array("returnCode" => '0', 'message'=>$result);
}

$server = new rabbitMQServer("testRabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>

