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
  $pure = substr($pkgName, 0, -3);

  $out1 = shell_exec("sudo mv -v /var/www/IT490-NSFW/$pure/* ~/Desktop/IT490temp/ ");
  $out2 = shell_exec("cd ~/ ;
                      sudo tar -xvf $pkgName.tar.gz -C /var/www/IT490-NSFW ");

  var_dump($out1);
  var_dump($out2);
  
  
}
function rollbackPkg($request) {

  $pkgName = $request["pkgName"];
  $path = $request["path"];
  $pure = substr($pkgName, 0, -3);

  $out1 = shell_exec("sudo mv -v /var/www/IT490-NSFW/$pure/* ~/Desktop/IT490temp/ ");
  $out2 = shell_exec("cd ~/ ;
                      sudo tar -xvf $pkgName.tar.gz -C /var/www/IT490-NSFW ");

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
    case "rollback":
    case "sendPkg":
      return recievePkg($request);
      break;
    case "rollback":
      return rollbackPkg($request);
      break;
    default:
      echo "ERROR: BAD QUERY TYPE\n";
      break;
  }
  return array("returnCode" => '0', 'message'=>"ERROR: Type is not supported");
}

$server = new rabbitMQServer("deploy/deploy.ini", "testserver");
var_dump ($server);
$server->process_requests('requestProcessor');
exit();
?>
