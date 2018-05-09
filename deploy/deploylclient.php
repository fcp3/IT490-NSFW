<?php

require_once('include/path.inc');
require_once('include/get_host_info.inc');
require_once('include/rabbitMQLib.inc');
require_once('include/logger.inc');


$client = new rabbitMQClient("deploy.ini", "testServer");

function sendPkg($argv){

	$path = $argv[3];
	$pkgName = $argv[2];
	$user = $argv[4];
	$hip = $argv[5];
	$vid = $argv[6];

	var_dump($argv);
	$output = shell_exec("sudo tar czf ~/Desktop/testdeploy/$pkgName.tar.gz $path;
                  scp -P 22 ~/Desktop/testdeploy/$pkgName.tar.gz $user@$hip:~/Desktop ");

	var_dump($output);
	$request["type"] = "createPkg";
    	$request["pkgName"] = $pkgName;
    	$request["desc"] = $desc;
    	$request["path"] = $path;

    //return $request;

    if($query = mysqli_prepare($conn, "INSERT INTO install (package, server, version) VALUES (?, ?, ?)")) {
      $query->bind_param("ssdis", $pkgName, $user, $vid);
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
