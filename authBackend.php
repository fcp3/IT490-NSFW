#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');
require_once('creds.inc');
require_once('logging_php.inc.php');

function doLogin($username,$password) {
  //connecting to the sample database
  $conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");
  $response = array();
  if(!$conn) {
    logger( __FILE__ . " : " . __LINE__ . " :error: " . mysqli_connect_error());
    die("ERROR: Could not connect." . mysqli_connect_error());
  }
  else {
    echo "SUCCESS: Connected to database";
  }

  //creating the query
  $query = "SELECT * from Account where username = '$username' AND password = '$password'";
  $result = mysqli_query($conn, $query);
  $count = mysqli_num_rows($result);
  $array = mysqli_fetch_assoc($result);
  $response["email"] = $array["email"];
  $response["user"] = $array["username"];
  $response["acct"] = $array["accountID"];
  if($count == 1) {
    echo "VALID USER" . PHP_EOL;
    $response["value"] = true;
    return $response;
  }
  else {
    echo "INVALID CREDENTIALS" . PHP_EOL;
    $response["value"] = false;
    return $response;
  }
}

function doRegister($username, $password, $email) {
	$conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");
    $response = array();
	if(!$conn) {
		die("ERROR: Could not connect:" . mysqli_connect_error());
	} else {
		echo "SUCCESS: Connected to db";	
	}

	$query = "SELECT * from Account where username = '$username'";
	$result = mysqli_query($conn, $query);
	$count = mysqli_num_rows($result);

	if($count == 0) {
		$registerQuery = "INSERT into Account (username, password, email) VALUES('$username', '$password', '$email')";
		$register = mysqli_query($conn, $registerQuery);

        $query = "SELECT * from Account where username = '$username' AND password = '$password'";
        $result = mysqli_query($conn, $query);
        $count = mysqli_num_rows($result);
        $array = mysqli_fetch_assoc($result);
        $response["email"] = $array["email"];
        $response["user"] = $array["username"];
        $response["acct"] = $array["accountID"];
        $response["value"] = true;
		return $response;	
	} elseif ($count == 1) {
        $response["value"] = false;
		return $response;
	} else {
        $response["value"] = false;
		return $response;
	}
}

function requestProcessor($request)
{
	$response = array();
  	echo "received request".PHP_EOL;
  	var_dump($request);
  	if(!isset($request['type']))
  	{
    	return "ERROR: unsupported message type";
  	}
  	switch ($request['type'])
  	{
    	case "login":
        	print_r($request);
            $response["type"] = "login";
      		$response["result"] = doLogin($request['username'],$request['password']);
		break;
    	case "validate_session":
      		$response = doValidate($request['sessionId']);
		break;
	case "register":
		//print_r($request);
		$response["type"] = "register";
		$response["result"] = doRegister($request['username'], $request['password'], $request['message']);
		break;
  	}
	echo var_dump($response);
	$result = array();
	$result["returnCode"] = 0;
	$result["message"] = $response;
	echo var_dump($result);
  	return $result;
}

$server = new rabbitMQServer("testRabbitMQ.ini","testServer");
echo var_dump($server);

$server->process_requests('requestProcessor');
exit();
?>

