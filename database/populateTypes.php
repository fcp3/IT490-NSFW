<?php

require '../code/vendor/autoload.php';
use PokePHP\PokeApi;
$api = new PokeApi;

function typeNullTo($type) {
	$nullTo = array();
	foreach($type->damage_relations->no_damage_to as $null) {
		array_push($nullTo, $null->name);
	}
	return $nullTo;
}

function typeHalfTo($type) {
	$halfTo = array();
	foreach($type->damage_relations->half_damage_to as $half) {
		array_push($halfTo, $half->name);
	}
	return $halfTo;
}

function typeDoubleTo($type) {
	$doubleTo = array();
	foreach($type->damage_relations->double_damage_to as $double) {
		array_push($doubleTo, $double->name);
	}
	return $doubleTo;
}

function typeNullFrom($type) {
	$nullFrom = array();
	foreach($type->damage_relations->no_damage_from as $null) {
		array_push($nullFrom, $null->name);
	}
	return $nullFrom;
}

function typeHalfFrom($type) {
	$halfFrom = array();
	foreach($type->damage_relations->half_damage_from as $half) {
		array_push($halfFrom, $half->name);
	}
	return $halfFrom;
}

function typeDoubleFrom($type) {
	$doubleFrom = array();
	foreach($type->damage_relations->double_damage_from as $double) {
		array_push($doubleFrom, $double->name);
	}
	return $doubleFrom;
}

$types = json_decode($api->resourceList('type'));

/*
$typesText = json_encode($types);
$typeFile = 'types.json';
$handle = fopen($typeFile, 'w') or die ("Cannot open file: " . $typeFile);
fwrite($handle, $typesText);
*/

$conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");

if(!$conn) {
	logger( __FILE__ . " : " . __LINE__ . " :error: " . mysqli_connect_error());
    die("ERROR: Could not connect." . mysqli_connect_error());
} else {
    echo "SUCCESS: Connected to database\n";
}

foreach($types->results as $type) {
	//echo $type->name . PHP_EOL;	
	$name = $type->name;
	$refType = json_decode($api->pokemonType($name));
	//echo "**************" . $name . "**************" . PHP_EOL;

	$typeMatches = array();
	//echo "-------------NULL TO--------------";
	$typeMatches["nullAttack"] = typeNullTo($refType);
	//echo "-------------HALF TO--------------";
	$typeMatches["halfAttack"] = typeHalfTo($refType);
	//echo "-------------DOUBLE TO------------";
	$typeMatches["doubleAttack"] = typeDoubleTo($refType);
	//echo "-------------NULL FROM--------------";
	$typeMatches["nullDefend"] = typeNullFrom($refType);
	//echo "-------------HALF FROM--------------";
	$typeMatches["halfDefend"] = typeHalfFrom($refType);
	//echo "-------------DOUBLE FROM------------";
	$typeMatches["doubleDefend"] = typeDoubleFrom($refType);
	//var_dump($typeMatches);

	foreach($typeMatches["nullAttack"] as $nullAttack) {
		echo $name . " " . $nullAttack . PHP_EOL;
		if($insert = mysqli_prepare($conn, "INSERT INTO NullTo (Attacking, Defending) VALUES (?, ?)")) {
			mysqli_stmt_bind_param($insert, "ss", $name, $nullAttack);
			mysqli_stmt_execute($insert);
			mysqli_stmt_close($insert);
		}
	}
	foreach($typeMatches["halfAttack"] as $halfAttack) {
		echo $name . " " . $halfAttack . PHP_EOL;
		if($insert = mysqli_prepare($conn, "INSERT INTO HalfTo (Attacking, Defending) VALUES (?, ?)")) {
			mysqli_stmt_bind_param($insert, "ss", $name, $halfAttack);
			mysqli_stmt_execute($insert);
			mysqli_stmt_close($insert);
		}
	}
	foreach($typeMatches["doubleAttack"] as $doubleAttack) {
		echo $name . " " . $doubleAttack . PHP_EOL;
		if($insert = mysqli_prepare($conn, "INSERT INTO DoubleTo (Attacking, Defending) VALUES (?, ?)")) {
			mysqli_stmt_bind_param($insert, "ss", $name, $doubleAttack);
			mysqli_stmt_execute($insert);
			mysqli_stmt_close($insert);
		}
	}
}

?>