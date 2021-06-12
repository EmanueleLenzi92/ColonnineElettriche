
<?php
//include connect do db and distance function
include ('../ApiDb/config.php');
include ('distanceBetweenCoordinates.php');

// get value passed from ajax call in js
$result = $_GET['start'];
$result_explode = explode('|', $result);
$longPartenza= $result_explode[0];   
$latPartenza= $result_explode[1]; 

$result2 = $_GET['arrive'];
$result_explode = explode('|', $result2);
$longArrivo= $result_explode[0];   
$latArrivo= $result_explode[1]; 

$result3 = $_GET['auto'];
$result_explode = explode('|', $result3);
$totKmUnPieno= $result_explode[0];  
$totKmUnPieno= intval($totKmUnPieno);
$euroUnPieno= $result_explode[1];

$range = $_GET['range'];




//init curl for distance calculate
//API CALL TO PROJECT OSRM
$curl = curl_init();
curl_setopt_array($curl, [
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_URL => 'https://routing.openstreetmap.de/routed-car/route/v1/driving/' . $longPartenza . ',' . $latPartenza .';' . $longArrivo . ',' . $latArrivo . '?geometries=geojson&steps=true', //'http://router.project-osrm.org/route/v1/driving/' . $longPartenza . ',' . $latPartenza .';' . $longArrivo . ',' . $latArrivo . '?overview=false&steps=true',  'https://routing.openstreetmap.de/routed-car/route/v1/driving/9.1904984,45.4667971;10.4018624,43.7159395?overview=false&geometries=polyline&steps=true',
	//CURLOPT_URL => 'http://router.project-osrm.org/route/v1/driving/' . $longPartenza . ',' . $latPartenza .';' . $longArrivo . ',' . $latArrivo . '?overview=false', 
    CURLOPT_USERAGENT => 'Codular Sample cURL Request'
]);
$resp = curl_exec($curl);
curl_close($curl);
$array= json_decode($resp, true);



// Get Steps Coordinates in legs.steps.geometry.coordinates
$steps=[];
$chargingSteps=[];
$travekedKm= 0;
for ($j=0; $j < sizeOf($array['routes'][0]['legs'][0]['steps']); $j++){
	
	for ($k=0; $k < sizeOf($array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates']); $k++){
		
		$a= [ $array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k][0] ,  $array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k][1]];
		
		//insert in array the coordinates
		array_push($steps,$a);
	
		
		//if there is another coordinates element... 
		if (isset($array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k+1])){
			
			//calculate distance between theese cordinates and the next one and sum
			$distanceBetween2Points= distanceCoord($array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k][1], $array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k][0], $array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k+1][1], $array['routes'][0]['legs'][0]['steps'][$j]['geometry']['coordinates'][$k+1][0], "K");
			
			$travekedKm = $travekedKm + $distanceBetween2Points;
			
			//if this sum > of my totKm...
			if( $travekedKm >  $totKmUnPieno){
				
				//get this coordinates as Stop-Station for charging
				array_push($chargingSteps,$a);
				
				$travekedKm= 0;
			
			}
		}

		
	}
	
}



//get distance and time 
$distanza= $array['routes'][0]['distance'];
$tempo= $array['routes'][0]['duration'];
$distanza= $distanza / 1000;
$distanza= intval($distanza);



//calculate number of charging
$ricariche=0;
$i= $totKmUnPieno;
while($i <= $distanza){
	$ricariche ++;
	$i= $i + $totKmUnPieno;
}


// create a arrey json
$arrayJson= array( "numberCharg" => $ricariche, "cityDistance" => $distanza, "totKm1Charge" => $totKmUnPieno, "time" => $tempo, "steps" => $steps, "maxRange" => $range, "stepsCharge" =>$chargingSteps);		
$data= json_encode($arrayJson);

echo $data;

?>