#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

function doLogin($username,$password)
{
    // lookup username in database
    // check password
    return true;
    //return false if not valid
}

function requestProcessor($request)
{
  echo "received request".PHP_EOL;

  /* login code */
  include "config.php";
  $username = $request['username'];
  $password = $request['password'];
  $email = $request['email'];
  $request_type = $request['type'];
  $return_msg = "";
  if ($request['type'] == "Login") {
                if ($username == "" || $password == "") {
                        $return_msg =  "<br>Invalid username or password.";
                }
                else {
                        $query = mysqli_query($conn, "SELECT * FROM Users where username = '$username' and password = '$password'");
                        $rows = mysqli_num_rows($query);
                        if ($rows == 1) {
                               /* $_SESSION['login_user'] = $username; */ 
                                $return_msg =  "<br>Thank you for logging in.";
                        }
                        else {
                                $return_msg = "<br>Invalid username or password.";
                        }
                }
  }
  else {
	$return_msg = "test";
  }


  var_dump($request);
  if(!isset($request['type']))
  {
    return "ERROR: unsupported message type";
  }
  switch ($request['type'])
  {
    case "login":
      return doLogin($request['username'],$request['password']);
    case "validate_session":
      return doValidate($request['sessionId']);
  }
  return array("returnCode" => '0', 'message'=> $return_msg);
}

$server = new rabbitMQServer("testRabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>

