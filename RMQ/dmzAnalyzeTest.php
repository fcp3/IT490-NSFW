<?php 
require_once('../include/path.inc');
require_once('../include/get_host_info.inc');
require_once('../include/rabbitMQLib.inc');
require_once('../include/logger.inc');
include('../include/db.inc');

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

$conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");
if(!$conn) {
 		logger( __FILE__ . " : " . __LINE__ . " :error: " . mysqli_connect_error());
   		die("ERROR: Could not connect." . mysqli_connect_error());
} else {
    	echo "SUCCESS: Connected to database\n";
}

$pokemon = array();
array_push($pokemon, "rattata");
array_push($pokemon, "charmander");
array_push($pokemon, "bulbasaur");
$team["pokemon"] = $pokemon;
var_dump($team);

var_dump(teamAnalyze($team, $conn));
?>