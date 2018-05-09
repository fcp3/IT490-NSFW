#!/usr/bin/php
<?php
require_once('include/path.inc');
require_once('include/get_host_info.inc');
require_once('include/rabbitMQLib.inc');
//require_once('include/logServer.php');
//include the deployServer functions file when it's made

function createPkg($request, $conn) {

	$pkgName = $request["pkgName"];
	$desc = $request["desc"];
	$path = $request["path"];
	$ver = 1.0;
	$valid = 0;

	if($query = mysqli_prepare($conn, "INSERT INTO packages (package, description, version, validated, path) VALUES (?, ?, ?, ?, ?)")) {
		$query->bind_param("ssdis", $pkgName, $desc, $ver, $valid, $path);
		$query->execute();
		echo "INSERTED INTO packages DB  " .PHP_EOL;
                echo "ROWS AFFECTED: " . $query->affected_rows . PHP_EOL;
                if ($query->affected_rows < 0) {
                        echo "ERROR: " . $query->error;
                        $query->close();
                        return "FAIL";
                }
	}
	return "SUCCESS";
}

function validatePkg($request) {
	
}

function requestProcessor($request) {
  echo "received request".PHP_EOL;
  var_dump($request);
  if(!isset($request['type'])) {
    return "ERROR: Type is not set";
  }
  $conn = mysqli_connect("localhost", "root", "1234", "deployServer");
  if(!$conn) {
    die("ERROR: Could not connect." . mysqli_connect_error());
  }
  else {
        echo "SUCCESS: Connected to database\n";
  }

  switch ($request['type']) {
    case "createPkg":
      return createPkg($request, $conn);
      break;
    default:
      echo "ERROR: BAD QUERY TYPE\n";
      break;
  }
  return array("returnCode" => '0', 'message'=>"ERROR: Type is not supported");
}

$server = new rabbitMQServer("deploy.ini", "testserver");
var_dump ($server);
$server->process_requests('requestProcessor');
exit();
?>
