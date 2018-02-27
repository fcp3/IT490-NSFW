<?php

//Need autoload file to access PokePHP\PokeApi
require 'code/vendor/autoload.php';
use PokePHP\PokeApi;
$api = new PokeApi;

function pokeTypes($pokemon) {
	$pokeTypes = array();
	$pokeTypes["type1"] = "none";
	$pokeTypes["type2"] = "none";
	$numType = 0;
	foreach($pokemon->types as $type) {
			if($numType == 1) { 
				$pokeTypes["type2"] = $type->type->name;			
			} else {
				$pokeTypes["type1"] = $type->type->name;
			}
			$numType += 1;
	}
	return $pokeTypes;
}

function pokeSprite($pokemon) {
		return $pokemon->sprites->front_default;
}

function pokeStats($pokemon) {
	$pokeStats = array();
	foreach($pokemon->stats as $stat) {
		switch($stat->stat->name){
			case 'attack':
				$pokeStats["attack"] = $stat->base_stat;
				break;	
			case 'special-attack':
				$pokeStats["sp-att"] = $stat->base_stat;
				break;	
			case 'defense':
				$pokeStats["defense"] = $stat->base_stat;
				break;	
			case 'special-defense':
				$pokeStats["sp-def"] = $stat->base_stat;
				break;
			case 'speed':
				$pokeStats["speed"] = $stat->base_stat;
				break;	
			case 'hp':
				$pokeStats["hp"] = $stat->base_stat;
				break;
			default:
				echo "Error with stats" . PHP_EOL;
		}
	}
	return $pokeStats;
}

function pokeGames($pokemon) {
	
}

function pokeMoves($pokemon) {

}

$conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");
if(!$conn) {
    logger( __FILE__ . " : " . __LINE__ . " :error: " . mysqli_connect_error());
    die("ERROR: Could not connect." . mysqli_connect_error());
} else {
    echo "SUCCESS: Connected to database\n";
}

$offset = 0;
$pokesPerPage = 20;
$pokeID = 0;
while($offset<180) {
	$pokes = json_decode($api->resourceList('pokemon', $pokesPerPage, $offset));
	foreach($pokes->results as $poke){
		echo"========================================\n";

		$id = $pokeID;
		$pokeID += 1;
		echo $id . PHP_EOL;

		$gameID = "N/A";

		$name = $poke->name;
		echo $name . PHP_EOL;
		$pokemon = json_decode($api->pokemon($poke->name));

		$sprite = pokeSprite($pokemon);
		echo $sprite . PHP_EOL;

		$types = pokeTypes($pokemon);
		print_r($types);

		$stats = pokeStats($pokemon);
		print_r($stats);


		echo(PHP_EOL);

		//$insertPoke = "INSERT INTO Pokemon (pokedexID, gameID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite) VALUES ('$id', '$gameID', '$name', '$types[type1]', '$types[type2]', '$stats[attack]', '$stats[defense]', '$stats[sp-att]', '$stats['sp-def']', '$stats[speed]', '$stats[hp]', '$sprite')";
		//$insertQuery = mysqli_query($conn, $insertPoke); 

		if($insert = mysqli_prepare($conn, "INSERT INTO Pokemon (pokedexID, gameID, Name, type_1, type_2, attack, defense, sp_att, sp_def, speed, hp, sprite) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
			mysqli_stmt_bind_param($insert, "issssiiiiiis", $id, $gameID, $name, $types["type1"], $types["type2"], $stats["attack"], $stats["defense"], $stats["sp-att"], $stats["sp-def"], $stats["speed"], $stats["hp"], $sprite);
			mysqli_stmt_execute($insert);
			mysqli_stmt_close($insert);
		}
	}
	$offset += $pokesPerPage;
}
?>
