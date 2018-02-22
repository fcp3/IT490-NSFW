<?php

//Need autoload file to access PokePHP\PokeApi
require 'vendor/autoload.php';
use PokePHP\PokeApi;

//$api is an object used to reference everything in PokeApi
$api = new PokeApi;

//testing the $api object by referencing cheri berry (see PokePHP documentation)
//using '$api->*(_)' will return a json string, so use json_decode() to transform into an object
$cheri = json_decode($api->berry(1));
print($cheri->name);
//offset variable to increment calls to PokeAPI (scrolls through paginated responses)
$offset = 0;
$logfile = fopen("/var/log/local490/logtest.txt","w") or die("Unable to open");
while($offset<140){
	print("Pokemon "."$offset".PHP_EOL);
	//makes a call to pokeAPI for 20 pokemon
	$pokes = json_decode($api->resourceList('pokemon', '20', $offset));
	echo var_dump($pokes);
	//parsing through each pokemon the above line above returns
	foreach($pokes->results as $poke){
		$name = $poke->name;
		$typetxt = "";
		
		$pokedata = json_decode($api->pokemon($name));
		$typedata = $pokedata->types;
		foreach($typedata as $singleType){
			$typetxt .= $singleType->type->name;
		}

		$logger = date('Y-m-d H:i:s', time())." ".gethostname()." "."Pokemon: ".$name.", Type: ".$typetxt.PHP_EOL;
		fwrite($logger, $logfile);
	}
	$offset += 20;
}
fclose($logfile);
echo "nothing seems broken".PHP_EOL;
print("Berry Test: ".$cheri->item->name.PHP_EOL);

?>
