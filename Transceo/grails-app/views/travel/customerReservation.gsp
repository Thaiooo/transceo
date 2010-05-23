<html>
    <head>
        <title>Reservation - Step 1</title>
		<meta name="layout" content="main" />
    </head>
    <body>
    	<jq:jquery>
    		// Pour google map
   			$(window).load(function () {
  				initialize();
			});
			
			var directionDisplay;
			var directionsService = new google.maps.DirectionsService();
			var map;

			function initialize() {
				directionsDisplay = new google.maps.DirectionsRenderer();
				var chicago = new google.maps.LatLng(41.850033, -87.6500523);
				var myOptions = {
					zoom:11,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					center: chicago
				}
				map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				directionsDisplay.setMap(map);
			}
  
			function calcRoute() {
				var start = $("#departCity").val();
				var end = $("#destinationCity").val();
				if(start == '' || end == '' || start == null || end == null){
					return;
				}
				
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
			
			// Pour le popup des dates
			$(function() {
	    		//$("#travelDate").datepicker({ showAnim: '' });
	    		$("#travelDate").datepicker({ dateFormat: 'dd/mm/yy' });
			});
			
			$("#departCity, #destinationCity").focusout(function() {
				calcRoute() 
			});
		</jq:jquery>
    
    	<g:hasErrors bean="${customer}">
    		Customer errors
			<div class="errors">
				<g:renderErrors bean="${customer}" />
			</div>
		</g:hasErrors>
		
		<g:hasErrors bean="${travel}">
			Travel errors
			<div class="errors">
				<g:renderErrors bean="${travel}" />
			</div>
		</g:hasErrors>
		
		<g:hasErrors bean="${depart}">
			Depart errors
			<div class="errors">
				<g:renderErrors bean="${depart}" />
			</div>
		</g:hasErrors>
		
		<g:hasErrors bean="${destination}">
			Destination errors
			<div class="errors">
				<g:renderErrors bean="${destination}" />
			</div>
		</g:hasErrors>
			
		Customer Information:    	
    	<form controller="travel" action="customerReserve" method="post" >
    		
    		<g:render template="/travel/customer" bean="${customer}" var="customer"/>
    		<br/>

    		<g:render template="/travel/travel" bean="${travel}"/>
    		<br/>
    		
    		Depart:
    		<g:render template="/travel/adresse" bean="${depart}" var="adresse"  model="['beanName':'depart']"/>
    		<br/>
    		
    		Destination:
    		<g:render template="/travel/adresse" bean="${destination}" var="adresse"  model="['beanName':'destination']"/>
    		<br/>
    	
    		<div id="map_canvas" style="width: 500px; height: 300px"></div>

			<br/>
			    			
    		<p>
    		<g:submitButton name="create" value="Create" />
    		<g:link url="/Transceo">Cancel</g:link>
    		</p>
    		
    	</form>
    </body>
</html>