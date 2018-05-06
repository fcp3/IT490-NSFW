#!/usr/bin/php
<?php
require_once('../include/path.inc');
require_once('../include/get_host_info.inc');
require_once('../include/rabbitMQLib.inc');
require_once('../include/logServer.php');

if(empty($argv[1])){
  echo "Choose a function".PHP_EOL;
  echo "Functions: Push | Deploy | Rollback".PHP_EOL;
  echo "Usage: ".$argv[0]."<Function> <Version ID> <DestinationIP> <Destination Directory> ".PHP_EOL;
  exit(0);
}

if(empty($argv[2])){
  echo "Enter the Version ID".PHP_EOL;
  echo "Usage: ".$argv[0]."<Function> <Version ID> <DestinationIP> <Destination Directory> ".PHP_EOL;
  exit(0);
}

$arg1 = strtolower($argv[1]);
$arg2 = $argv[2];

function deployNew($versionID) {
  shell_exec("cd ../
    mkdir $versionID;
    rsync -Rr * $versionID;
    rmdir $versionID/$versionID;
    tar -cvzf $version_id.tar.gz $versionID;
    rm -r $versionID;
    scp $versionID //enter whoever it is sent to here
    rm $versionID.tar.gz");
}

function deploy($arg2, $destIP, $dir) {
  sendtoServer("comm", "deployExt", $arg2, $destIP, $dir);
}

function checkVer($arg2) {

