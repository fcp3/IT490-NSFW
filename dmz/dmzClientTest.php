<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

$client = new rabbitMQClient("../testRabbitMQ.ini","queryServer");

//Starter database can be found in SlowPokeBasev2.sql
//import to sql with 'mysql -u <username> -p <database name> < SlowPokeBasev2.sql'

//$request = "This is a test request over queryqueue\n";

$request["type"] = "pokeSearch";
//$request["type"] = "saveTeam";
//should be using:
//$request["type"] = $_POST["query"];

switch($request["type"]) {
	case "pokeSearch":
		/*
		REQUIRES:
		 	- Game ID - currently either "red-blue-yellow" OR "gold-silver-crystal"
		 	- Name OR Types
		*/

		$request["game"] = "red-blue-yellow";
		$request["name"] = "bulbasaur";
		//$request["type1"] = "grass";
		//$request["type2"] = "poison";
		//returns json array of pokemon searched for, use json_decode to parse through array
		break;
	case "userTeams":
		/*
		REQUIRES:
			- accountID
		*/
		break;
	case "editPoke":
		/* EDITING CAUGHT POKEMON
		REQUIRES:
			- accountID
			- gameID
			- pokemonID
			- level & stats

		*/
		break;
	case "tmSearch":
		break;
	case "saveTeam":
		/*
		REQUIRES:
			- accountID
			- teamName
			- gameID
			- array of pokemonIDs
		*/
		//$request["accountID"] = 1;
		//$request["teamName"] = "Test Team 1";
		//$request["gameID"] = "red-blue-yellow";
		//$request["pokemonIDs"] = array(1, 2, 3, 4, 5, 6);

		//will return true if team inserted and false if error
		break;
	case "generateTeam":
		break;
	case "addCaught":
		/*
		REQUIRES:
			- AccountID of user
			- PokemonID OR Name of original pokemon
			- Custom Level & Stats OR blank Level & Stats
		*/
		break;
	default:
		echo "ERROR: BAD QUERY TYPE";
		break;
}

$response = $client->send_request($request);
//echo var_dump(json_decode($response));

?>
