#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');
include('creds.inc');

function doLogin($username,$password) {
  //connecting to the sample database
  $conn = mysqli_connect($hname, $uname, $pword, $dbCreds);

  if(!$conn) {
    die("ERROR: Could not connect." . mysqli_connect_error());
  }
  else {
    echo "SUCCESS: Connected to database";
  }

  //creating the query
  $query = "SELECT password from TestUsers where username = '$username'";
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

function doRegister($username, $password, $email) {
	$conn = mysqli_connect($hname, $uname, $pword, $dbCreds);

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
		echo true;	
	} else {
		return false;
	}

	return false;
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

		case "Register":
			print_r($request);
			return doRegister($request['username'], $request['password'], $request['email']);
  	}
  	return array("returnCode" => '0', 'message'=>$result);
}

$server = new rabbitMQServer("testRabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>

