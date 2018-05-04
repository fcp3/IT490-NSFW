<?php

require_once('../include/path.inc');
require_once('../include/get_host_info.inc');
require_once('../include/rabbitMQLib.inc');
require_once('../include/logger.inc');
include('../include/db.inc');

function pokeSearch($request, $conn) {
	echo "running pokeSearch funtion\n";
			$pokeGame = $request["gameID"][0];
			$pokeArr = array();
			echo "GameID: " . $pokeGame . PHP_EOL;
			if($request["type1"][0] == '') {
				echo "setting null type\n";
				$request["type1"][0] == null;
			}
			if($request["type2"][0] == '') {
				echo "setting null type\n";
				$request["type2"][0] == null;
			}

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
					if($request["name"] == "") {
						logger( __FILE__ . " : " . __LINE__ . " :error: " . "NO POKEMON NAME ENTERED");
					}
					echo "AFFECTED ROWS: " . $query->affected_rows . PHP_EOL;
					/*if($query->affected_rows < 0) {
						echo "ERROR: " . $query->error;
						return "THERE WAS AN ERROR SEARCHING POKEMON BY NAME\n";
					}*/	
				} else {
					logger( __FILE__ . " : " . __LINE__ . " :error: " . "Bad Pokemon Name Search");
					echo "ERROR HERE IN QUERYING POKEMON BY NAME: " . $conn->error . PHP_EOL;
				}

			} elseif($request["type1"][0] != null) {
				echo "running pokeSearch for TYPES\n";
				$pokeType1 = $request["type1"][0];
				$pokeType2 = $request["type2"][0];

				if($query = mysqli_prepare($conn, "SELECT pokedexID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ? AND (type_1 = ? OR type_1 = ? OR type_2 = ? OR type_2 = ?)")) {
					$query->bind_param("sssss", $pokeGame, $pokeType1, $pokeType2, $pokeType1, $pokeType2);
					$query->execute();
					$query->bind_result($pokeID, $name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);

				} else {
					logger( __FILE__ . " : " . __LINE__ . " :error: " . "Bad Pokemon Type Search");
					echo "ERROR RUNNING POKESEARCH BY TYPE\n";
				}
			} else {
				echo "running pokeSearch for GAME ONLY\n";
				if($query = mysqli_prepare($conn, "SELECT pokedexID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite, level  FROM Pokemon WHERE gameID = ?")) {
					$query->bind_param("s", $pokeGame);
					$query-> execute();
					$query->bind_result($pokeID, $name, $t1, $t2, $att, $def, $spAtt, $spDef, $spd, $hp, $sprite, $lvl);

				} else {
					logger( __FILE__ . " : " . __LINE__ . " :error: " . "Failed To Run Search For All Pokemon");
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
				$counter = 0;
				$team = array();
				while($data = $queryResult->fetch_assoc()) {
					//echo var_dump($data);
					$pokemon["team"] = $data["Name"];
					if($counter == 0) {
						$lastTeam = $pokemon["team"];
						$team["name"] = $lastTeam;
					}
					
					
					echo "Last team was: " . $lastTeam . PHP_EOL;
					echo "Currently looking at pokemon from team: " . $pokemon["team"] . PHP_EOL;
					echo "Counter: " . $counter;
					if($pokemon["team"] != $lastTeam && $counter >= 1) {
						//echo "Adding complete team\n";
						//echo var_dump($team);
						$lastTeam = $pokemon["team"];
						array_push($teams, $team);
						//echo "Currently accumulated teams: \n";
						//echo var_dump($teams);
						$team = array();
						$team["name"] = $lastTeam;
					}
					$pokemonID = $data["pokemon_ID"];
					if($pokemonID < 1000) {
						//echo "About to run pokeSearch IN userTeams\n";
						$poke["gameID"] = array($data["gameID"]);
						$poke["pokeID"] = $data["pokemon_ID"];
						//echo "POKE DATA SEARCHING FOR TEAM: " . var_dump($poke) . PHP_EOL; 
						$pokeData = json_decode(pokeSearch($poke, $conn));
						//echo "POKE DATA FOUND FROM pokeSearch: " . var_dump($pokeData) . PHP_EOL;
						$pokemon["pokemon"] = $pokeData;
						echo var_dump($pokemon["pokemon"]) . PHP_EOL;
						echo var_dump($team) . PHP_EOL;
						array_push($team, $pokemon["pokemon"]);
						echo var_dump($team) . PHP_EOL;
					} elseif ($pokemonID >= 1000) {
						//code for teams with custom pokemon
					}
					$counter += 1;
					
				}
				array_push($teams, $team);
				$result = json_encode($teams);
				echo "RESULT OF userTeams: " . var_dump($result) . PHP_EOL;
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
			$caughtPoke["sprite"] = $data["sprite"];
			array_push($caught, $caughtPoke);
		}
		//echo var_dump($caught);
		$result = json_encode($caught);
	} else {
		$query->close();
		logger( __FILE__ . " : " . __LINE__ . " :error: " . "Failed To Obtain User's Caught Pokemon");
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
			$game = $request["gameID"][0];

			//echo var_dump($request["pokemonIDs"]);
			foreach($request["pokemonIDs"] as $pokemonID) {
				if($pokemonID == "") {
					break;
				}
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
	$sprite = $request["sprite"];

	if($request["level"] > 0) {
		$level = $request["level"];
		$hp = $request["hp"];
		$speed = $request["speed"];
		$att = $request["att"];
		$spAtt = $request["spAtt"];
		$def = $request["def"];
		$spDef = $request["spDef"];
	} else {
		$default["gameID"] = $game;
		$defaultPoke = json_decode(pokeSearch($default, $conn));

		foreach($defaultPoke as $poke) {
			
			$level = $poke->level;
			$hp = $poke->hp;
			$speed = $poke->speed;
			$att = $poke->att;
			$spAtt = $poke->spAtt;
			$def = $poke->def;
			$spDef = $poke->spDef;
			
		}
	}

	echo "adding to Caught: " . $pokemon . " " . $level . " " . $hp . " " . $speed . " " . $att . " " . $spAtt . " " . $def . " " . $spDef . PHP_EOL;


	if($query = mysqli_prepare($conn, "INSERT INTO Caught (accountID, gameID, name, level, hp, speed, attack, defense, sp_att, sp_def, sprite) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
		$query->bind_param("issiiiiiiis", $acct, $game[0], $pokemon, $level, $hp, $speed, $att, $def, $spAtt, $spDef, $sprite);
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

function teamAnalyze($request, $conn) {
	echo "running team analyzer\n";
	$teamPokes = $request["pokemon"];

	//array for holding types of each pokemon in team
	$teamTypes = array();

	//arrays for holding stats for team matchups
	$teamWeaknesses = array();
	$teamStrengths = array();
	$teamResistantTo = array();
	$teamVulnerabilities = array();
	$teamInvulnerabilities = array();
	$teamIneffectives = array();

	//array for overall result to send back
	$result = array();

	foreach($teamPokes as $poke) {

		//getting type composition of team
		if($query = mysqli_prepare($conn, "SELECT type_1, type_2 FROM Pokemon WHERE Name = ?")) {
			$query->bind_param("s", $poke);
			$query->execute();
			$queryResult = $query->get_result();
			while($data = $queryResult->fetch_assoc()) {
				array_push($teamTypes, $data["type_1"]);
				if($data["type_2"] != "none") {
					array_push($teamTypes, $data["type_2"]);
				}
			}
		}
		$query->close();

	}

	//getting type matchups of team types
	foreach($teamTypes as $type) {
		echo "********TYPE: " . $type  . " *********\n";
		//getting what types team is strong against (attacking)
		echo "----------ACCUMULATING STRENGTHS--------\n";
		if($queryStrong = mysqli_prepare($conn, "SELECT Defending FROM DoubleTo WHERE Attacking = ?")) {
			$queryStrong->bind_param("s", $type);
			$queryStrong->execute();
			$queryStrongRes = $queryStrong->get_result();
			while($data = $queryStrongRes->fetch_assoc()) {
				//echo $data["Defending"] . PHP_EOL;
				$teamStrengths[$data["Defending"]] += 1;
			}

		}
		$queryStrong->close();
		//getting what types team is weak against (attacking)
		echo "----------ACCUMULATING WEAKNESSES--------\n";
		if($queryWeak = mysqli_prepare($conn, "SELECT Defending FROM HalfTo WHERE Attacking = ?")) {
			$queryWeak->bind_param("s", $type);
			$queryWeak->execute();
			$queryWeakRes = $queryWeak->get_result();
			while($data = $queryWeakRes->fetch_assoc()) {
				//echo $data["Defending"] . PHP_EOL;
				$teamWeaknesses[$data["Defending"]] += 1;
			}

		}
		$queryWeak->close();
		//getting what types team is resistant to (defending)
		echo "----------ACCUMULATING RESISTANCES--------\n";
		if($queryResist = mysqli_prepare($conn, "SELECT Attacking FROM HalfTo WHERE Defending = ?")) {
			$queryResist->bind_param("s", $type);
			$queryResist->execute();
			$queryResistRes = $queryResist->get_result();
			while($data = $queryResistRes->fetch_assoc()) {
				//echo $data["Attacking"] . PHP_EOL;
				$teamResistantTo[$data["Attacking"]] += 1;
			}

		}
		$queryResist->close();
		//getting what types team is vulnerable to (defending)
		echo "----------ACCUMULATING VULNERABILITIES--------\n";
		if($queryVuln = mysqli_prepare($conn, "SELECT Attacking FROM DoubleTo WHERE Defending = ?")) {
			$queryVuln->bind_param("s", $type);
			$queryVuln->execute();
			$queryVulnRes = $queryVuln->get_result();
			while($data = $queryVulnRes->fetch_assoc()) {
				//echo $data["Attacking"] . PHP_EOL;
				$teamVulnerabilities[$data["Attacking"]] += 1;
			}

		}
		$queryVuln->close();
		//getting what types team is invulnerable to (defending)
		echo "----------ACCUMULATING INVULNERABILITIES--------\n";
		if($queryInvuln = mysqli_prepare($conn, "SELECT Attacking FROM NullTo WHERE Defending = ?")) {
			$queryInvuln->bind_param("s", $type);
			$queryInvuln->execute();
			$queryInvulnRes = $queryInvuln->get_result();
			while($data = $queryInvulnRes->fetch_assoc()) {
				//echo $data["Attacking"] . PHP_EOL;
				$teamInvulnerabilities[$data["Attacking"]] += 1;
			}

		}
		$queryInvuln->close();
		//getting what types team has no effect on (attacking)
		echo "----------ACCUMULATING NO EFFECTS--------\n";
		if($queryNoEff = mysqli_prepare($conn, "SELECT Defending FROM NullTo WHERE Attacking = ?")) {
			$queryNoEff->bind_param("s", $type);
			$queryNoEff->execute();
			$queryNoEffRes = $queryNoEff->get_result();
			while($data = $queryNoEffRes->fetch_assoc()) {
				//echo $data["Defending"] . PHP_EOL;
				$teamIneffectives[$data["Defending"]] += 1;
			}

		}
		$queryNoEff->close();
	}

	//testing type matchup results
	echo "****TEAM STRONG TO:****\n";
	while($type_name = current($teamStrengths)) {
		echo key($teamStrengths).PHP_EOL;
		next($teamStrengths);
	}
	echo "****TEAM WEAK TO:****\n";
	while($type_name = current($teamWeaknesses)) {
		echo key($teamWeaknesses).PHP_EOL;
		next($teamWeaknesses);
	}
	echo "****TEAM RESISTS:****\n";
	while($type_name = current($teamResistantTo)) {
		echo key($teamResistantTo).PHP_EOL;
		next($teamResistantTo);
	}
	echo "****TEAM IS VULNERABLE TO:****\n";
	while($type_name = current($teamVulnerabilities)) {
		echo key($teamVulnerabilities).PHP_EOL;
		next($teamVulnerabilities);
	}
	echo "****TEAM INVULNERABLE TO:****\n";
	while($type_name = current($teamInvulnerabilities)) {
		echo key($teamInvulnerabilities).PHP_EOL;
		next($teamInvulnerabilities);
	}
	echo "****TEAM HAS NO EFFECT TO:****\n";
	while($type_name = current($teamIneffectives)) {
		echo key($teamIneffectives).PHP_EOL;
		next($teamIneffectives);
	}

	$result["strengths"] = $teamStrengths;
	$result["weaknesses"] = $teamWeaknesses;
	$result["resistances"] = $teamResistantTo;
	$result["vulnerabilities"] = $teamVulnerabilities;
	$result["invulnerabilities"] = $teamInvulnerabilities;
	$result["noeffects"] = $teamIneffectives;

	return $result;

}

function requestProcessor($request) {

	echo "Found request!" . PHP_EOL;
	echo var_dump($request);
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
			$result = json_encode(saveTeam($request, $conn));
			break;
		case "generateTeam":
			break;
		case "addCaught":
			$result = json_encode(addCaught($request, $conn));
			break;
		case "teamAnalyze":
			$result = json_encode(teamAnalyze($request, $conn));
			break;
		default:
			echo "ERROR: BAD QUERY TYPE\n";
			break;
	}
	//echo "RESULT AFTER SWITCH: " . var_dump($result);
	echo var_dump($result);
	return $result;

}
echo $host . $db . $user . $pass . PHP_EOL;
$server = new rabbitMQServer("../include/queryServer.ini","queryServer");
echo var_dump($server);

$server->process_requests('requestProcessor');
exit();

?>
