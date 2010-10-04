<html>
    <head>
        <title><g:message code="title.reservation.simulation" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
		<jq:jquery>
    		// Pour google map
   			$(window).load(function () {
  				initialize();
  				calcRoute();
			});

			function initialize() {
				directionsDisplay = new google.maps.DirectionsRenderer();
				var latlng = new google.maps.LatLng(48.8572, 2.3399);
				var myOptions = {
					zoom:11,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					center: latlng,
					scrollwheel: false,
					streetViewControl: true
				}
				var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				directionsDisplay.setMap(map);
				directionsDisplay.setPanel(document.getElementById("directionsPanel"));
			}

			function calcRoute() {
				var start = $('#depart_adresse').val() + " " + $('#depart_postal').val() + " " + $('#depart_city').val() + " " + $('#depart_country').val();
				var end = $('#destination_adresse').val() + " " + $('#destination_postal').val() + " " + $('#destination_city').val() + " " + $('#destination_country').val();
				var request = {
					origin:start,
					destination:end,
					travelMode: google.maps.DirectionsTravelMode.DRIVING
				};
				var directionsService = new google.maps.DirectionsService();
				directionsService.route(
					request,
					function(response, status) {
						if (status == google.maps.DirectionsStatus.OK) {
							directionsDisplay.setDirections(response);
						}
					}
				);
			}
			
			$('#simulate').click(function() {
 				calcRoute()
			});
		</jq:jquery>
		
		

		<table width="100%">
			<tr>
				<td >
					<g:set var="legendDepart" value="${message(code:'travel.section.travel.depart')}" />
					<g:render template="/common/travel/editAdresseSection2"
						bean="${depart}"
						var="adresse"
						model='["beanName":"depart", "legend":"${legendDepart}", "adrZoneID":"adrZone1", "locationId":"${locationDepartId}"]'
					/>
				</td>
				<td>
					<g:set var="legendDestination" value="${message(code:'travel.section.travel.destination')}" />
					<g:render template="/common/travel/editAdresseSection2"
						bean="${destination}"
						var="adresse"
						model='["beanName":"destination", "legend":"${legendDestination}", "adrZoneID":"adrZone2", "locationId":"${locationDestId}"]'
					/>
				</td>
			</tr>
		</table>

		<p class="boutons">
			<g:submitButton id="simulate" name="simulate" value="${message(code:'label.common.button.simulate')}" />
			<a href="<g:createLink controller="administrator" action="reservationMain" />" ><g:message code="label.common.button.back"/></a>
		</p>

		<br/>

		<fieldset>
			<legend><g:message code="label.travel.section.plan" /></legend>
			<div id="map_canvas" style="width: 810px; height: 300px"></div>
			<div id="directionsPanel" style="width:100%; height:100%;"></div>
		</fieldset>
    </body>
</html>