<?php

require_once('../path.inc');
require_once('../get_host_info.inc');
require_once('../rabbitMQLib.inc');

$client = new rabbitMQClient("../testRabbitMQ.ini","queryServer");

//$request = "This is a test request over queryqueue\n";

$reqType = "pokeSearch";
//should be using:
//$request["type"] = $_POST["query"];

switch($request["type"]) {
	case "pokeSearch":
		/*
		REQUIRES:
		Game ID - currently either "red-blue-yellow" OR "gold-silver-crystal"
		Name OR Types
		*/

		//$request["game"] = "red-blue-yellow";
		//$request["name"] = "bulbasaur";
		//$request["type1"] = "grass";
		//$request["type2"] = "poison";
		break;
	case "userTeams":
		break;
	case "editPoke":
		break;
	case "tmSearch":
		break;
	case "saveTeam":
		break;
	case "generateTeam":
		break;
	case "addCaught":
		/*
		REQUIRES:
		AccountID of user
		PokemonID OR Name of original pokemon
		Custom Level & Stats OR blank Level & Stats
		*/
		break;
	default:
		echo "ERROR: BAD QUERY TYPE";
		break;
}

$response = $client->send_request($request);
//echo var_dump(json_decode($response));

?>
