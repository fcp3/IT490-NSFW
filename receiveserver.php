#!/usr/bin/php
<?php
require_once('include/path.inc');
require_once('include/get_host_info.inc');
require_once('include/rabbitMQLib.inc');
//require_once('include/logServer.php');
//include the deployServer functions file when it's made

function recievePkg($request) {

	$pkgName = $request["pkgName"];
	$path = $request["path"];

  $out1 = shell_exec("sudo rm -rf /var/www/IT490-NSFW/$pkgName ");
  $out2 = shell_exec("cd ~/ ;
                sudo mkdir /var/www/IT490-NSFW/$pkgName;
                sudo tar -xvf $pkgName.tar.gz --strip-components=1 -C /var/www/IT490-NSFW/$pkgName ");

  var_dump($out1);
  var_dump($out2);
  
	
}
function rollbackPkg($request) {

  $pkgName = $request["pkgName"];
  $path = $request["path"];

  $out1 = shell_exec("sudo rm -rf /var/www/IT490-NSFW/$pkgName ");
  $out2 = shell_exec("cd ~/ ;
                sudo mkdir /var/www/IT490-NSFW/$pkgName;
                sudo tar -xvf $pkgName.tar.gz --strip-components=1 -C /var/www/IT490-NSFW/$pkgName ");

  var_dump($out1);
  var_dump($out2);
  
  
}

function validatePkg($request) {
	
}

function requestProcessor($request) {
  echo "received request".PHP_EOL;
  var_dump($request);
  if(!isset($request['type'])) {
    return "ERROR: Type is not set";
  }
  

  switch ($request['type']) {
    case "sendPkg":
      return recievePkg($request);
      break;
    default:
      echo "ERROR: BAD QUERY TYPE\n";
      break;
  }
  return array("returnCode" => '0', 'message'=>"ERROR: Type is not supported");
}

$server = new rabbitMQServer("deploy.ini", "testServer");
var_dump ($server);
$server->process_requests('requestProcessor');
exit();
?>
