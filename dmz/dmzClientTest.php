<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

$client = new rabbitMQClient("../testRabbitMQ.ini","queryServer");

//Starter database can be found in SlowPokeBasev2.sql
//import to sql with 'mysql -u <username> -p <database name> < SlowPokeBasev2.sql'

//$request = "This is a test request over queryqueue\n";

//$request["type"] = "pokeSearch";
//$request["type"] = "saveTeam";
$request["type"] = "userTeams";
//$request["type"] = "userCaught";
//$request["type"] = "addCaught";
//$request["type"] = "editPoke";
//should be using:
//$request["type"] = $_POST["query"];

switch($request["type"]) {
	case "pokeSearch":
		/*
		REQUIRES:
		 	- Game ID - currently either "red-blue-yellow" OR "gold-silver-crystal"
		 	- Name OR Types
		*/

		$request["gameID"] = "red-blue-yellow";
		//$request["name"] = "bulbasaur";
		//$request["pokeID"] = 1;
		//$request["type1"] = "grass";
		//$request["type2"] = "poison";
		//returns json array of pokemon searched for, use json_decode to parse through array
		break;
	case "userTeams":
		/* LISTING ALL USER TEAMS
		REQUIRES:
			- accountID
		*/

		$request["accountID"] = 1;
		//returns pokemon from each of users saved teams
		break;

	case "userCaught":
		/* LISTING ALL USER CAUGHT POKEMON
		REQUIRES:
			- accountID
		*/

		$request["accountID"] = 1;

		//returns json of all caught pokemon
		break;
	case "editPoke":
		/* EDITING CAUGHT POKEMON
		REQUIRES:
			- accountID
			- gameID
			- pokemonID
			- level & stats
		*/

		/* //Editing caught pokemon with id 1001 with zeroed stats
		$request["pokemonID"] = 1001;
		$request["level"] = 0;
		$request["hp"] = 0;
		$request["speed"] = 0;
		$request["att"] = 0;
		$request["spAtt"] = 0;
		$request["def"] = 0;
		$request["spDef"] = 0;
		*/
		//returns true or false on udpate success/failure
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

		/* //SAVING Test Team 1 TO user with accountID 1, gen1, with pokemon 1, 2, 3, 4, 5, 6 */
		$request["accountID"] = 1;
		$request["teamName"] = "Test Team 2";
		$request["gameID"] = "red-blue-yellow";
		$request["pokemonIDs"] = array(101, 102, 103, 104, 105, 106);
		/**/

		//will return true if team inserted and false if error
		break;
	case "generateTeam":
		break;
	case "addCaught":
		/*
		REQUIRES:
			- AccountID of user
			- PokemonID OR Name of original pokemon
			- GameID
			- Custom Level & Stats OR blank Level & Stats
		*/

		/* //ADDING DEFAULT BULBASAUR
		$request["accountID"] = 1;
		$request["gameID"] = "red-blue-yellow";
		$request["name"] = "bulbasaur";
		*/

		/* ADDING CUSTOM BULBASAUR
		$request["accountID"] = 1;
		$request["gameID"] = "red-blue-yellow";
		$request["name"] = "bulbasaur";
		$request["level"] = 100;
		$request["hp"] = 255;
		$request["speed"] = 255;
		$request["att"] = 255;
		$request["spAtt"] = 255;
		$request["def"] = 255;
		$request["spDef"] = 255;
		*/

		//returns true or false on successful/failed insert
		break;
	default:
		echo "ERROR: BAD QUERY TYPE";
		break;
}

$response = $client->send_request($request);
$resultArr = json_decode($response);
foreach($resultArr as $res) {
	echo var_dump($res);
	echo $res->team . PHP_EOL;
	foreach($res->pokemon as $pokeData) {
		echo var_dump($pokeData);
		echo $pokeData->name;
		echo $pokeData->level;
		echo $pokeData->type1;
		echo $pokeData->type2;
		echo $pokeData->sprite;
		echo $pokeData->hp;
		echo $pokeData->speed;
		echo $pokeData->att;
		echo $pokeData->spAtt;
		echo $pokeData->def;
		echo $pokeData->spDef;
		echo PHP_EOL;
	}

}

/*
HOW TO PARSE THROUGH userTeam json
	- use json decode to use it as a PHP array
	- use foreach to go through each pokemon saved in a user's teams
	- use nested foreach to loop through array of pokemon data
  **** TO PARSE THROUGH pokeSearch items, just use the nested foreach loop
$resultArr = json_decode($response);
foreach($resultArr as $res) {
	//echo var_dump($res);
	echo $res->team . PHP_EOL;
	foreach($res->pokemon as $pokeData) {
		//echo var_dump($pokeData);
		echo $pokeData->name;
		echo $pokeData->level;
		echo $pokeData->type1;
		echo $pokeData->type2;
		echo $pokeData->sprite;
		echo $pokeData->hp;
		echo $pokeData->speed;
		echo $pokeData->att;
		echo $pokeData->spAtt;
		echo $pokeData->def;
		echo $pokeData->spDef;
		echo PHP_EOL;
	}

}
*/

?>
