<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

function pokeSearch($request, $conn) {
	echo "running pokeSearch funtion\n";
			$pokeGame = $request["game"];
			$pokeArr = array();
			echo "GameID: " . $pokeGame . PHP_EOL;
			if(isset($request["name"])){
				$pokeName = $request["name"];
				echo $pokeName . PHP_EOL;
				if($query = mysqli_prepare($conn, "SELECT Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ? AND Name = ?")) {
					$query->bind_param("ss", $pokeGame, $pokeName);
					$query->execute();
					$query->bind_result($name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);
					echo "AFFECTED ROWS: " . $query->affected_rows . PHP_EOL;
					/*if($query->affected_rows < 0) {
						echo "ERROR: " . $query->error;
						return "THERE WAS AN ERROR SEARCHING POKEMON BY NAME\n";
					}*/
					while($query->fetch()) {
						echo var_dump($name);
						echo var_dump($t1);
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
						//echo var_dump($pokemon) . PHP_EOL;
						array_push($pokeArr, $pokemon);
					}	
				} else {
					echo "ERROR HERE IN QUERYING POKEMON BY NAME\n";
				}

			} else {
				echo "running pokeSearch for pokemon types\n";
				$pokeType1 = $request["type1"];
				$pokeType2 = $request["type2"];

				if($query = mysqli_prepare($conn, "SELECT Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ? AND (type_1 = ? OR type_1 = ? OR type_2 = ? OR type_2 = ?)")) {
					$query->bind_param("sssss", $pokeGame, $pokeType1, $pokeType2, $pokeType1, $pokeType2);
					$query->execute();
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
				} else {
					echo "ERROR RUNNING POKESEARCH BY TYPE\n";
				}
			}
			$result = json_encode($pokeArr);
			echo "AT END OF pokeSearch FUNCTION: " . $result . PHP_EOL;
			return $result;
}

function requestProcessor($request) {

	echo "Found request!" . PHP_EOL;
	//echo $request . PHP_EOL;
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
			$result = pokeSearch($request, $conn);
			echo "OUT OF pokeSearch FUNCTION: " . $result . PHP_EOL;
			return $result;
			break;
		case "userTeams":
			echo "running userTeams function\n";
			$acct = $request["accountID"];
			$teams = array();
			if($query = mysqli_prepare($conn, "SELECT Name, pokemon_ID FROM Team WHERE accountID = ?")) {
				$query->bind_param("i", $acct);
				$query->execute();
				$query->bind_result($teamName, $pokemonID);
				while($query->fetch()) {
					$pokemon["team"] = $teamName;
					if($pokemonID < 1000) {
						if($pokemonQuery){

						}
					} elseif ($pokemonID >= 1000) {

					}
				}
			}
			break;
		case "editPoke":
			break;
		case "tmSearch":
			break;
		case "saveTeam":
			echo "running saveTeam function\n";
			$acct = $request["accountID"];
			$team = $request["teamName"];
			$game = $request["gameID"];
			//echo var_dump($request["pokemonIDs"]);
			foreach($request["pokemonIDs"] as $pokemonID) {
				if($query = mysqli_prepare($conn, "INSERT INTO Team (accountID, Name, gameID, pokemon_ID) VALUES (?, ?, ?, ?)")) {
					$query->bind_param("issi", $acct, $team, $game, $pokemonID);
					$query->execute();
					echo "SAVED " . $pokemonID . " INTO TEAM  " . $team . PHP_EOL;
					echo "ROWS AFFECTED: " . $query->affected_rows . PHP_EOL;
					if ($query->affected_rows < 0) {echo "ERROR: " . $query->error;
						return false;
					}
					
				}
			}
			return true;
			break;
		case "generateTeam":
			break;
		case "addCaught":
			break;
		default:
			echo "ERROR: BAD QUERY TYPE\n";
			break;
	}
	echo "RESULT AFTER SWITCH: " . var_dump($result);
	return $result;

}

$server = new rabbitMQServer("../testRabbitMQ.ini","queryServer");

$server->process_requests('requestProcessor');
exit();

?>
