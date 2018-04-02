<?php

//Need autoload file to access PokePHP\PokeApi
require 'vendor/autoload.php';
use PokePHP\PokeApi;

//$api is an object used to reference everything in PokeApi
$api = new PokeApi;

//testing the $api object by referencing cheri berry (see PokePHP documentation)
//using '$api->*(_)' will return a json string, so use json_decode() to transform into an object
//$cheri = json_decode($api->berry(1));
//print($cheri->name);

//offset variable to increment calls to PokeAPI (scrolls through paginated responses)
$offset = 0;

function pokeTypes($pokemon) {}
function pokeSprite($pokemon) {}
function pokeStats($pokemon) {}
function pokeGames($pokemon) {}
function pokeMoves($pokemon) {}

while($offset<1){
	//print("Pokemon "."$offset".PHP_EOL);
	//makes a call to pokeAPI for 20 pokemon
	$pokes = json_decode($api->resourceList('pokemon', '1', $offset));
	//parsing through each pokemon the above line above returns
	foreach($pokes->results as $poke){
		$name = $poke->name;
		$typetxt = "";
		
		$pokedata = json_decode($api->pokemon($name));
		echo "<div class=\"row\"><div class=\"column\" style=\"width:33%;float:left;\">";
		print("<br>------POKEMON: " . $name . "-------</br>");

		echo "<br>--------SPRITE--------</br>\n";
		echo "<br><img src=\"" . $pokedata->sprites->front_default . "\" ></br>";
		
		echo "<br>--------TYPES--------</br>\n";
		foreach($pokedata->types as $type){
			echo "<br>" . $type->type->name . "</br>";

			$typeData = json_decode($api->pokemonType($type->type->name));
			foreach($typeData->damage_relations->double_damage_to as $strength) {
				echo "<br>STRONG TO: " . $strength->name . "</br>";
			}
			foreach($typeData->damage_relations->double_damage_from as $weakness) {
				echo "<br>WEAK TO: " . $weakness->name . "</br>";
			}
		}

		echo "<br>--------STATS--------</br>\n";		
		foreach($pokedata->stats as $pokestat) {
			echo "<br>" . $pokestat->stat->name . " " . $pokestat->base_stat . "</br>";
		}
		echo "</div>";
		echo "<div class=\"column\" style=\"width:33%;float:left;\">";
		echo "<br>--------GAMES--------</br>\n";
		foreach($pokedata->game_indices as $game) {
			echo "<br>" . $game->version->name . "</br>"; 		
		}
		echo "</div>";
		echo "<div class=\"column\" style=\"width:33%;float:left;\"";
		echo "<table>";
		echo "<br>--------TM/HM & GAME--------\n";
		
		foreach($pokedata->moves as $move) {
			$gen1flag = false;
			$gen2flag = false;
			foreach($move->version_group_details as $version) {
				if($version->move_learn_method->name == "machine") {
					switch($version->version_group->name) {
						case 'red-blue':
						case 'yellow':
							if(!$gen1flag){
								echo "<br>" . $move->move->name . " in game: " . $version->version_group->name . "</br>";
								$gen1flag = true;
							}
							break;
						case 'gold-silver':
						case 'crystal':
							if(!$gen2flag){
								echo "<br>" . $move->move->name . " in game: " . $version->version_group->name . "</br>";
								$gen2flag = true;
							}
							break;
						default:
							break;
					}					
				}			
			}		
		}
	echo "</div></div>";
	echo "\n\n\n\n";
	}
	$offset += 1;
}


?>
