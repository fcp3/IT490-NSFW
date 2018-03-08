<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

function pokeSearch($request, $conn) {
	echo "running pokeSearch funtion\n";
			$pokeGame = $request["gameID"];
			$pokeArr = array();
			echo "GameID: " . $pokeGame . PHP_EOL;
			if(isset($request["name"]) || isset($request["pokeID"])){
				if(isset($request["name"])) {
					$pokeName = $request["name"];
					echo $pokeName . PHP_EOL;	
				} else {
					$pokeID = $request["pokeID"];
					echo "Searching for ID: " . $pokeID . PHP_EOL;
				}
				
				if($query = mysqli_prepare($conn, "SELECT pokedexID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ? AND (Name = ? OR pokedexID = ?)")) {
					$query->bind_param("ssi", $pokeGame, $pokeName, $pokeID);
					$query->execute();
					$query->bind_result($pokeID, $name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);
					echo "AFFECTED ROWS: " . $query->affected_rows . PHP_EOL;
					/*if($query->affected_rows < 0) {
						echo "ERROR: " . $query->error;
						return "THERE WAS AN ERROR SEARCHING POKEMON BY NAME\n";
					}*/	
				} else {
					echo "ERROR HERE IN QUERYING POKEMON BY NAME: " . $conn->error . PHP_EOL;
				}

			} elseif(isset($requst["type1"]) || isset($request["type2"])) {
				echo "running pokeSearch for GAME ONLY\n";
				$pokeType1 = $request["type1"];
				$pokeType2 = $request["type2"];

				if($query = mysqli_prepare($conn, "SELECT pokedexID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ? AND (type_1 = ? OR type_1 = ? OR type_2 = ? OR type_2 = ?)")) {
					$query->bind_param("sssss", $pokeGame, $pokeType1, $pokeType2, $pokeType1, $pokeType2);
					$query->execute();
					$query->bind_result($pokeID, $name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);
					
				} else {
					echo "ERROR RUNNING POKESEARCH BY TYPE\n";
				}
			} else {
				if($query = mysqli_prepare($conn, "SELECT pokedexID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ?")) {
					$query->bind_param("s", $pokeGame);
					$query-> execute();
					$query->bind_result($pokeID, $name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);

				} else {
					echo "ERROR RUNNING POKESEARCH FOR ALL POKEMON IN GAME\n";
				}
				
			}

			while($query->fetch()) {
						//echo var_dump($name);
						//echo var_dump($t1);
						$pokemon = array();
						$pokemon["pokeID"] = htmlspecialchars($pokeID);
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
			$result = json_encode($pokeArr);
			echo "AT END OF pokeSearch FUNCTION: " . $result . PHP_EOL;
			$query->close();
			return $result;
}

function userTeams($request, $conn) {
	echo "running userTeams function\n";
			$acct = $request["accountID"];
			$teams = array();
			if($query = mysqli_prepare($conn, "SELECT Name, gameID, pokemon_ID FROM Team WHERE accountID = ?")) {
				$query->bind_param("i", $acct);
				$query->execute();
				//$query->bind_result($teamName, $game, $pokemonID);
				$queryResult = $query->get_result();
				echo "TRYING TO GET ALL RESULTS AT ONCE: " . var_dump($queryResult) . PHP_EOL;
				while($data = $queryResult->fetch_assoc()) {
					//echo var_dump($data);
					
					$pokemon["team"] = $data["Name"];
					if($pokemonID < 1000) {
						$poke["game"] = $data["gameID"];
						$poke["pokeID"] = $data["pokemon_ID"]; 
						$pokeData = json_decode(pokeSearch($poke, $conn));
						$pokemon["pokemon"] = $pokeData;
						array_push($teams, $pokemon);
					} elseif ($pokemonID >= 1000) {
						//code for teams with custom pokemon
					}
					
				}
				$result = json_encode($teams);
				echo "RESULT OF userTeams: " . $result . PHP_EOL;
			}
			$query->close();
			return $result;
}

function userCaught($request, $conn) {
	echo "running userCaught function\n";
	$acct = $request["accountID"];
	$caught = array();
	if($query = mysqli_prepare($conn, "SELECT pokemonID, name, level, hp, speed, attack, defense, sp_att, sp_def, sprite FROM Caught WHERE accountID = ?")) {
		$query->bind_param("i", $acct);
		$query->execute();
		$queryResult = $query->get_result();
		while($data = $queryResult->fetch_assoc()) {
			//echo var_dump($data);
			$caughtPoke["pokemonID"] = $data["pokemonID"];
			$caughtPoke["name"] = $data["name"];;
			$caughtPoke["level"] = $data["level"];
			$caughtPoke["hp"] = $data["hp"];
			$caughtPoke["speed"] = $data["speed"];
			$caughtPoke["att"] = $data["attack"];
			$caughtPoke["spAtt"] = $data["sp_att"];
			$caughtPoke["def"] = $data["defense"];
			$caughtPoke["spDef"] = $data["sp_def"];
			array_push($caught, $caughtPoke);
		}
		//echo var_dump($caught);
		$result = json_encode($caught);
	} else {
		$query->close();
		return "test error val for userCaught";
	}
	$query->close();
	return $result;
}

function editPoke($request, $conn) {
	echo "running editPoke function\n";
	$pokeID = $request["pokemonID"];
	$level = $request["level"];
	$hp = $request["hp"];
	$speed = $request["speed"];
	$att = $request["att"];
	$spAtt = $request["spAtt"];
	$def = $request["def"];
	$spDef = $request["spDef"];
	if($query = mysqli_prepare($conn, "UPDATE Caught SET level = ?, hp = ?, speed = ?, attack = ?, defense = ?, sp_att = ?, sp_def = ? WHERE pokemonID = ?")) {
			$query->bind_param("iiiiiiii", $level, $hp, $speed, $att, $def, $spAtt, $spDef, $pokeID);
			$query->execute();
			echo "RESULT: " . var_dump($query->get_result()) . PHP_EOL;
			echo "ROWS AFFECTED: " . $query->affected_rows . PHP_EOL;
			if($query->affected_rows <= 0) {
				echo "ERROR: " . $query->error;
				$query->close();
				return false;
			}
	}
	$query->close();
	return true;
	
}

function saveTeam($request, $conn) {
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
			$query->close();
			return true;
}

function generateTeam($resquest, $conn) {

}

function addCaught($request, $conn) {
	echo "running addCaught function\n";
	$acct = $request["accountID"];
	$game = $request["gameID"];
	if(isset($request["name"])) {
		$pokemon = $request["name"];
		$default["name"] = $pokemon;
	} else if (isset($request["pokemonID"])) {
		$pokemon = $request["pokemonID"];
		$default["pokemonID"] = $pokemon;
	}

	if(isset($request["level"])) {
		$level = $request["level"];
		$hp = $request["hp"];
		$speed = $request["speed"];
		$att = $request["att"];
		$spAtt = $request["spAtt"];
		$def = $request["def"];
		$spDef = $request["spDef"];
	}
	$default["gameID"] = $game;
	$defaultPoke = json_decode(pokeSearch($default, $conn));
	foreach($defaultPoke as $poke) {
		if(!isset($request["level"])){
			$level = $poke->level;
			$hp = $poke->hp;
			$speed = $poke->speed;
			$att = $poke->att;
			$spAtt = $poke->spAtt;
			$def = $poke->def;
			$spDef = $poke->spDef;
		}
		$sprite = $poke->sprite; 
	}

	echo "adding to Caught: " . $pokemon . " " . $level . " " . $hp . " " . $speed . " " . $att . " " . $spAtt . " " . $def . " " . $spDef . PHP_EOL;


	if($query = mysqli_prepare($conn, "INSERT INTO Caught (accountID, gameID, name, level, hp, speed, attack, defense, sp_att, sp_def, sprite) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
		$query->bind_param("issiiiiiiis", $acct, $game, $pokemon, $level, $hp, $speed, $att, $def, $spAtt, $spDef, $sprite);
		$query->execute();
		echo "INSERTED INTO Caught  " .PHP_EOL;
		echo "ROWS AFFECTED: " . $query->affected_rows . PHP_EOL;
		if ($query->affected_rows < 0) {
			echo "ERROR: " . $query->error;
			$query->close();
			return false;
		}
	}
	$query->close();
	return true;
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
			//echo "OUT OF pokeSearch FUNCTION: " . $result . PHP_EOL;
			break;
		case "userTeams":
			$result = userTeams($request, $conn);
			break;
		case "userCaught":
			$result = userCaught($request, $conn);
			break;
		case "editPoke":
			$result = editPoke($request, $conn);
			break;
		case "tmSearch":
			break;
		case "saveTeam":
			$result = saveTeam($request, $conn);
			break;
		case "generateTeam":
			break;
		case "addCaught":
			$result = addCaught($request, $conn);
			break;
		default:
			echo "ERROR: BAD QUERY TYPE\n";
			break;
	}
	//echo "RESULT AFTER SWITCH: " . var_dump($result);
	return $result;

}

$server = new rabbitMQServer("../testRabbitMQ.ini","queryServer");

$server->process_requests('requestProcessor');
exit();

?>
