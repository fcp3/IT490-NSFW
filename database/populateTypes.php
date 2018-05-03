<?php

require '../code/vendor/autoload.php';
use PokePHP\PokeApi;
$api = new PokeApi;

function typeNullTo($type) {
	$nullTo = array();
	foreach($type->damage_relations->no_damage_to as $null) {
		array_push($nullTo, $null->name);
	}
	var_dump($nullTo);
}

function typeHalfTo($type) {
	$halfTo = array();
	foreach($type->damage_relations->half_damage_to as $half) {
		array_push($halfTo, $half->name);
	}
	var_dump($halfTo);
}

function typeDoubleTo($type) {
	$doubleTo = array();
	foreach($type->damage_relations->double_damage_to as $double) {
		array_push($doubleTo, $double->name);
	}
	var_dump($doubleTo);
}

function typeNullFrom($type) {
	$nullFrom = array();
	foreach($type->damage_relations->no_damage_from as $null) {
		array_push($nullFrom, $null->name);
	}
	var_dump($nullFrom);
}

function typeHalfFrom($type) {
	$halfFrom = array();
	foreach($type->damage_relations->half_damage_from as $half) {
		array_push($halfFrom, $half->name);
	}
	var_dump($halfFrom);
}

function typeDoubleFrom($type) {
	$doubleFrom = array();
	foreach($type->damage_relations->double_damage_from as $double) {
		array_push($doubleFrom, $double->name);
	}
	var_dump($doubleFrom);
}

$types = json_decode($api->resourceList('type'));

foreach($types->results as $type) {
	echo $type->name . PHP_EOL;	
	$name = $type->name;
	$refType = json_decode($api->pokemonType($name));
	echo "**************" . $name . "**************" . PHP_EOL;
	echo "-------------NULL TO--------------";
	echo typeNullTo($refType);
	echo "-------------HALF TO--------------";
	echo typeHalfTo($refType);
	echo "-------------DOUBLE TO------------";
	echo typeDoubleTo($refType);
	echo "-------------NULL FROM--------------";
	echo typeNullFrom($refType);
	echo "-------------HALF FROM--------------";
	echo typeHalfFrom($refType);
	echo "-------------DOUBLE FROM------------";
	echo typeDoubleFrom($refType);
}

?>