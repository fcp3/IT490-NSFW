<?php

$conn = mysqli_connect("localhost", "root", "1234", "SlowPokeBase");
if(!$conn) {
    logger( __FILE__ . " : " . __LINE__ . " :error: " . mysqli_connect_error());
    die("ERROR: Could not connect." . mysqli_connect_error());
} else {
    echo "SUCCESS: Connected to database\n";
}

$query = "SELECT * FROM Pokemon WHERE pokedexID < 10;";
$result = $conn->query($query);


$pokemonArr = array();

while($row = $result->fetch_assoc()) {
	$pokemonObj = new stdClass();
	$pokemonObj->id = $row["pokedexID"];
	$pokemonObj->name = $row["Name"];
	$pokemonObj->sprite = $row["sprite"];
	$pokemonObj->type1 = $row["type_1"];
	$pokemonObj->type2 = $row["type_2"];
	$pokemonObj->att = $row["attack"];
	$pokemonObj->sp_att = $row["sp_att"];
	$pokemonObj->def = $row["defense"];
	$pokemonObj->sp_def = $row["sp_def"];
	$pokemonObj->speed = $row["speed"];
	$pokemonObj->hp = $row["hp"];
	array_push($pokemonArr, $pokemonObj);
}

$jsonArr = json_encode($pokemonArr);

$conn->close();

?>
