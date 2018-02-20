#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

function doLogin($username,$password)
{
	if ($username == "" || $password == "") {
         	$return_msg =  "<br>Invalid username or password.";
	} else {
             	$query = mysqli_query($conn, "SELECT * FROM Users where username = '$username' and password = '$password'");
       		$rows = mysqli_num_rows($query);
  		if ($rows == 1) {
           		//$_SESSION['login_user'] = $username;  
                	$return_msg =  "<br>Thank you for logging in.";
       		} else {
                      	$return_msg = "<br>Invalid username or password.";
             	}
       	}
    return $return_msg;
    //return false if not valid
}

function requestProcessor($request)
{
  echo "received request".PHP_EOL;

  /* login code */
  //include "config.php";

  /*
  $username = $request['username'];
  $password = $request['password'];
  $email = $request['email'];
  $request_type = $request['type'];
  $return_msg = "";
  $return_msg .= var_dump($request) . PHP_EOL;
  if ($request['type'] == "Login") {
                if ($username == "" || $password == "") {
                        $return_msg .=  "<br>Invalid username or password.";
                }
                else {
                        $query = mysqli_query($conn, "SELECT * FROM Users where username = '$username' and password = '$password'");
                        $rows = mysqli_num_rows($query);
                        if ($rows == 1) {
                                //$_SESSION['login_user'] = $username;  
                                $return_msg .=  "<br>Thank you for logging in.";
                        }
                        else {
                                $return_msg .= "<br>Invalid username or password.";
                        }
                }
  }
  else {
	$return_msg .= "test";
  } */


  //var_dump($request);
  //if(!isset($request['type']))
  //{
    //return "ERROR: unsupported message type";
  //}
  //switch ($request['type'])
  //{
    //case "Login":
		//echo "doing login" . PHP_EOL;      
		//return doLogin($request['username'],$request['password']);
    //case "validate_session":
      //return doValidate($request['sessionId']);
  //}
  //return array("returnCode" => '0', 'message'=> "didn't find a proper case");
	echo $request;
}

$server = new rabbitMQServer("testRabbitMQ.ini","logServer");

$server->process_requests('requestProcessor');
exit();
?>

