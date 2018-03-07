<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

function requestProcessor($request) {

	echo "Found request!" . PHP_EOL;
	echo $request . PHP_EOL;
	//return "Request was received!\n";
	
	$conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");
	if(!$conn) {
 		logger( __FILE__ . " : " . __LINE__ . " :error: " . mysqli_connect_error());
   		die("ERROR: Could not connect." . mysqli_connect_error());
	} else {
    	echo "SUCCESS: Connected to database\n";
	}

	switch($request["type"]){
		
		case "pokeSearch":

			$pokeArr = array();

			if(isset($request["name"])){
				$pokeName = $request["name"];
				$pokeGame = $request["game"];
				
				if($query = mysqli_prepare($conn, "SELECT Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ? AND Name = ?")) {
					$query->bind_param("ss", $pokeGame, $pokeName);
					$query->bind_result($name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);

					while($query->fetch()) {
						$pokemon = array();
						$pokemon["name"] = htmlspecialchars($name);
						$pokemon["type1"] = htmlspecialchars($t1);
						$pokemon["type2"] = htmlspecialchars($t2);
						$pokemon["att"] = htmlspecialchars($att);
						$pokemon["def"] = htmlspecialchars($def);
						$pokemon["spAtt"] = htmlspecialchars($spAtt);
						$pokemon["spDef"] = htmlspecialchars($spDef);
						$pokemon["speed"] = htmlspecialchars($spd);
						$pokemon["hp"] = htmlspecialchars($hp);
						$pokemon["level"] = htmlspecialchars($lvl);
						$pokemon["sprite"] = htmlspecialchars($sprite);
						array_push($pokeArr, $pokemon);
					}	
				}

			}			
			break;
	}

}

$server = new rabbitMQServer("../testRabbitMQ.ini","queryServer");

$server->process_requests('requestProcessor');
exit();

?>
