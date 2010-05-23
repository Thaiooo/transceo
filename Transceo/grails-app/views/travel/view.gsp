<html>
    <head>
        <title>View</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<jq:jquery>
    		// Pour google map
   			$(window).load(function () {
  				initialize();
  				calcRoute();
			});
			
			var directionDisplay;
			var directionsService = new google.maps.DirectionsService();
			var map;

			function initialize() {
				directionsDisplay = new google.maps.DirectionsRenderer();
				var chicago = new google.maps.LatLng(48.8572, 2.3399);
				var myOptions = {
					zoom:11,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					center: chicago
				}
				map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				directionsDisplay.setMap(map);
			}
  
			function calcRoute() {
				var start = "${travel.depart.adresse} ${travel.depart.city}, ${travel.depart.country}";
				var end = "${travel.destination.adresse} ${travel.destination.city}, ${travel.destination.country}";
				
				var request = {
					origin:start, 
					destination:end,
					travelMode: google.maps.DirectionsTravelMode.DRIVING
				};
				directionsService.route(
					request, 
					function(response, status) {
						if (status == google.maps.DirectionsStatus.OK) {
							directionsDisplay.setDirections(response);
						}
					}
				);
				
			}
			
		</jq:jquery>
    
    	<p>
    	Creation Date: <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.creationDate}"/>
    	</p>
    	<p>
    	Travel Date: <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.travelDate}"/>
    	</p>
    	<p>
    	Price: ${travel.price}
    	</p>
    	<p>
    	Status: ${travel.status}
    	</p>
    	<p>
    	Depart:${travel.depart.adresse} ${travel.depart.city}, ${travel.depart.country} 
    	</p>
    	<p>
    	Destination: ${travel.destination.adresse} ${travel.destination.city}, ${travel.destination.country}
    	</p>
    	<p>
    	Handicap: ${travel.handicap}
    	</p>
    	<p>
    	Comment: ${travel.comment}
    	</p>
    	<br/>
    	<div id="map_canvas" style="width: 500px; height: 300px"></div>
    	<br/>
    	<g:link controller="member" action="show" id="${travel.customer.id}">Retour</g:link>
    </body>
</html>