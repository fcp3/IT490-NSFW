<?php

require_once('include/path.inc');
require_once('include/get_host_info.inc');
require_once('include/rabbitMQLib.inc');
require_once('include/logger.inc');


$client = new rabbitMQClient("deploy.ini", "testServer");

function createPkg($argv){

	$path = $argv[4];
	$desc = $argv[3];
	$pkgName = $argv[2];
	
	var_dump($argv);
	$output = shell_exec("sudo tar czf ~/Desktop/testdeploy/$pkgName.tar.gz $path;
                  scp -P 22 ~/Desktop/testdeploy/$pkgName.tar.gz humza@25.55.23.200:~/Desktop ");
	
	var_dump($output);
	$request["type"] = "createPkg";
    $request["pkgName"] = $pkgName;
    $request["desc"] = $desc;
    $request["path"] = $path;

    return $request;

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
	case 'createPkg':
		
		$request = createPkg($argv);
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