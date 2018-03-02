#!/usr/bin/php
<?php
require_once('path.inc');
require_once('get_host_info.inc');
require_once('rabbitMQLib.inc');

function requestProcessor($request)
{
  echo "received request".PHP_EOL;
  echo $request;
  
  //makes an object that will store data and be converted to json later
  //$pokemons = new stdClass();

  //array of pokemon that will be stored in the database
  //$pokeArr = array();

  //$pokeObj = (object)

  $testjson = "

  return 


}

$server = new rabbitMQServer("testRabbitMQ.ini","testServer");

$server->process_requests('requestProcessor');
exit();
?>

