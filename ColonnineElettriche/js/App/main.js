$(document).ready(function() {
	

	
	//init leaflet  map
	var map = new L.Map('map');                       
                
		L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors',
            maxZoom: 18
        }).addTo(map);
        map.attributionControl.setPrefix(''); // Don't show the 'Powered by Leaflet' text.
		

    
	//zoom to italy
	var italy = new L.LatLng(42.504154,12.646361); 
    map.setView(italy, 6);
	
	
	
	//create turf layers for route, buffer and markers
	//style--> add style to buffers and route layer
	//onEachFeature --> add popup to all marker
	var lineLayer = L.geoJson(null, {
			style: function (feature) {
				var style = {
					color: 'green',
					fillColor: '#561196',
					weight: 2
				};
				return style;
			}
	}).addTo(map);
	
	
	var buffer1Layer = L.geoJson(null, {
			style: function (feature) {
				var style = {
					color: 'red',
					fillColor: '#561196',
					weight: 2
				};
				return style;
			}
	}).addTo(map);
	
	
	var buffer2Layer = L.geoJson(null, {
			style: function (feature) {
				var style = {
					color: 'orange',
					fillColor: '#561196',
					weight: 3
				};
				return style;
			}
	}).addTo(map);
	

	var markerLayer = L.geoJson(null, {
		onEachFeature: function (feature, layer) {
			layer.bindPopup("<p>" + feature.properties.description + "</p>");
		}
	}).addTo(map); 
	
	
        
	
	//ajax call
	$( "#buttonSubmit" ).click(function() {
		
				// display load
				$("#loadApp").fadeIn(600);
				
				
				var dataAuto= $( "#selectAuto" ).val();
				var dataStart= $( "#selectStart" ).val();
				var dataArrive= $( "#selectArrive" ).val();
				var dataRange= $( "#BoxSelectRange span" ).html();
				
				
				
				
				
				
				$.ajax({  
					type: "GET",
					url: "PHP/ajaxCall.php", 
					dataType: "JSON",					
					data: {auto: dataAuto, start: dataStart, arrive: dataArrive, range: dataRange},
					success: function(resp) {  
						


						// get value of $data in php file
						var Ncharge= resp.numberCharg;
						var citDistance= resp.cityDistance;
						var range = resp.maxRange;
						var times= resp.time;
						times= secondsToHms(times);
						var stepss= resp.steps;
						var stepsCharge = resp.stepsCharge;
						
						

						//delete previus marker/route/buffer in map
						lineLayer.clearLayers();
						buffer1Layer.clearLayers();
						buffer2Layer.clearLayers();
						markerLayer.clearLayers();
						
						//delete previus html data
						$('#resultData').empty();
						
						
						
										
	
						//draw route with turf line (and add data in line layer)
						var line = turf.lineString(stepss)
						lineLayer.addData(line);
						
						
						//draw buffer with turf (and add data in buffer1 layer)
						var buffered = turf.buffer(line, range, {units: 'meters'});
						buffer1Layer.addData(buffered);
						
						
						//zoom to route
						map.fitBounds(lineLayer.getBounds());
						
						
						
						
						
						//Add markers in buffered area
						var countColumns= 0;
						var featuresMarkers = []
						for (var i=0; i < markers.length; i++) {
								
									var lon = markers[i][0];
									var lat = markers[i][1];
									var popupText = markers[i][2];
									
									//create point turfjs with features; if is inside buffer...
									var markerLocation = turf.point([lon,lat], {"marker-color": "#6BC65F", "description": popupText});
									if(turf.booleanWithin(markerLocation, buffered)) {
										
										
										console.log(markerLocation)
										//add point in marker layer
										markerLayer.addData(markerLocation)
										
										//markerLayer[_layers][countColumns].bindPopup("<p>" + markerLocation.properties.description + "</p>");
										
										
										//count columns
										countColumns++;
									}
						}


						console.log(markerLayer)
						
						//find buffer for stop to charge
						for (var i=0; i < stepsCharge.length; i++) {
							
							var lon = stepsCharge[i][0];
							var lat = stepsCharge[i][1];
							
							var stopCharge = turf.point([lon,lat]);

							var buffered = turf.buffer(stopCharge, range, {units: 'meters'});
							buffer2Layer.addData(buffered);
							
						}
						
						
							



						//add data in html
						$('#resultData').append('<p><b>Distanza:</b> ' + citDistance + ' Km<br/> <b>Tempo:</b> ' + times + '<br/> <b>Ricariche da fare:</b> ' + Ncharge + '<br/> <b>Colonnine in zona:</b> ' +  countColumns + '</p>');


						//hide load
						$("#loadApp").fadeOut(600);
						
													
					},
					error: function(){
						alert("Al momento ci sono troppe richieste, riprova tra qualche secondo o aggiorna la pagina");
						
						//hide load
						$("#loadApp").fadeOut(600);
					} 
				}); 
			});
	
	
	
	
	

});