#!/usr/bin/php
<?php
require_once('../include/path.inc');
require_once('../include/get_host_info.inc');
require_once('../include/rabbitMQLib.inc');
require_once('../include/logServer.php');
require_once('../include/deploy.php.inc');
//READ: this file doesn't exist yet, it is the second part of the deployment server

function deploySwitch($type, $versionID, $dest, $dir, $origin, $user, $layer) {

  $deploy = new deployDB();

  switch($type) {
    case "newpkg":
      echo "Trying to receive a new package".PHP_EOL;
      //the validate function will be created in our functions file
      $deploystatus = validate($versionID, $dest, $origin, $layer, $user, "0");
      echo $deploystatus.PHP_EOL;
      return $deploystatus;
    case "checkversion":
      echo "Checking if the version exists";
      $deploystatus = $deploy->existingVer($origin, $versionID);
      echo $deploystatus.PHP_EOL;
      return $status;
    case "checkRoll":
      return $deploy->rollbackVer($origin, $versionID);
    case "DBver":
      return $deploy->newVer($origin, $versionID);
    case "approved":
      return $deploy->checkApprove($origin, $versionID);
    case "checkVer":
      return $deploy->checkVersion($origin);
    case "notapproved"
      return $deploy->versionNA($origin, $versionID);
    case "exit":
      echo "I will deploy".PHP_EOL;
      deployServer($versionID, $dest, $dir, $layer, $user, "1");
      $deploystatus = validate($versionID, $dest, $origin, $layer, $user, "1");
      echo $deploystatus.PHP_EOL;
      return $deploystatus;
    }
}

function requestProcessor($request) {
  echo "received request".PHP_EOL;
  var_dump($request);
  if(!isset($request['type'])) {
    return "ERROR: Type is not set";
  }
  switch ($request['type']) {
    case "rmq":
      return deploySwitch($request['type'], $request['versionID'],$request['dest'],$request['dir'],$request['origin'],"hkm9","rmq");
    case "frontend":
      return deploySwitch
    case "dmz":
      return deploySwitch
    case "backend":
      return deploySwitch
  }
  return array("returnCode" => '0', 'message'=>"ERROR: Type is not supported";
}

$server = new rabbitMQServer("../include/deploy.ini", "testserver");
$server->process_requests('requestProcessor');
exit();
?>
