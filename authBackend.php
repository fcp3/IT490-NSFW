#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');
require_once('creds.inc');

function doLogin($username,$password) {
  //connecting to the sample database
  $conn = mysqli_connect("localhost", "root", "1234", "testdb");

  if(!$conn) {
    die("ERROR: Could not connect." . mysqli_connect_error());
  }
  else {
    echo "SUCCESS: Connected to database";
  }

  //creating the query
  $query = "SELECT * from TestUsers where username = '$username' AND password = '$password'";
  $result = mysqli_query($conn, $query);
  $count = mysqli_num_rows($result);
  $array = mysqli_fetch_assoc($result);
  $pass = $array["password"];
  if($count == 1) {
    echo "VALID USER" . PHP_EOL;
    return "VALID";
  }
  else {
    echo "INVALID CREDENTIALS" . PHP_EOL;
    return "INVALID";
  }
}

function doRegister($username, $password, $email) {
	$conn = mysqli_connect("localhost", "root", "1234", "testdb");

	if(!$conn) {
		die("ERROR: Could not connect:" . mysqli_connect_error());
	} else {
		echo "SUCCESS: Connected to db";	
	}

	$query = "SELECT * from TestUsers where username = '$username' AND password = '$password'";
	$result = mysqli_query($conn, $query);
	$count = mysqli_num_rows($result);

	if($count == 0) {
		$registerQuery = "INSERT into TestUsers (username, password, email) VALUES('$username', '$password', '$email')";
		$register = mysqli_query($conn, $registerQuery);
		return "USER CREATED!";	
	} elseif ($count == 1) {
		return "USER ALREADY EXISTS!";
	} else {
		return "ERROR CREATING USER";
	}
}

function requestProcessor($request)
{
	$response = "";
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
      		$response = doLogin($request['username'],$request['password']);
		break;
    	case "validate_session":
      		$response = doValidate($request['sessionId']);
		break;
	case "Register":
		print_r($request);
		$response = doRegister($request['username'], $request['password'], $request['message']);
		break;
  	}
	echo var_dump($response);
  	return array("returnCode" => '0', 'message'=>$response);
}

$server = new rabbitMQServer("testRabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>

