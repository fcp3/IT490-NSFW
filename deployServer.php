<?php

require_once('include/path.inc');
require_once('include/get_host_info.inc');
require_once('include/rabbitMQLib.inc');
require_once('include/logger.inc');


$client = new rabbitMQClient("deploy.ini", "testserver");

function sendPkg($argv){

	$path = $argv[3];
	$pkgName = $argv[2];
	$user = $argv[4];
	$hip = $argv[5];
	$vid = $argv[6];
	$pure = substr($pkgName, 0, -3);

	var_dump($argv);
	$output = shell_exec("scp -P 22 ~/Desktop/$pkgName.tar.gz $user@$hip:~/ ");

	$conn = mysqli_connect("localhost", "root", "1234", "deployServer");
 	if(!$conn) {
    		die("ERROR: Could not connect." . mysqli_connect_error());
  	}
  	else {
        	echo "SUCCESS: Connected to database\n";
  	}

	var_dump($output);
	$request["type"] = "sendPkg";
    	$request["pkgName"] = $pure;
    	$request["path"] = $path;

    return $request;

    if($query = mysqli_prepare($conn, "INSERT INTO install (package, server, version) VALUES (?, ?, ?)")) {
      $query->bind_param("ssd", $pkgName, $user, $vid);
      $query->execute();
      echo "INSERTED INTO install DB  " .PHP_EOL;
      echo "ROWS AFFECTED: " . $query->affected_rows . PHP_EOL;
      if ($query->affected_rows < 0) {
        echo "ERROR: " . $query->error;
        $query->close();
        return "FAIL";
      }
    }
    return "SUCCESS";
}

function validatePkg(){

	$hostname = gethostname();
	$pkgName = $argv[1];

	$request["type"] = "validatePkg";
	$request["host"] = $hostname;
	$request["pkgName"] = $pkgName;

	return $request;

}

switch($argv[1]) {
	case 'sendPkg':
		$request = sendPkg($argv);
		break;
	case 'validatePkg':
		$request = validatePkg();
		break;
	default:
		echo "BAD ARGUMENT";
		$request = "bad type";
}

$response = $client->send_request($request);
echo $response;

?>
