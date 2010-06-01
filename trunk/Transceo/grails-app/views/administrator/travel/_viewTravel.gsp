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

<fieldset>
	<legend><g:message code="view.travel.section.travel" /></legend>
	<p>
    	<g:message code="view.travel.creationdate" />: <g:formatDate format="${message(code:'common.date.time.format')}" date="${travel.creationDate}"/>
	</p>
	<p>
		<g:message code="view.travel.traveldate" />: <g:formatDate format="${message(code:'common.date.time.format')}" date="${travel.travelDate}"/>
	</p>
	<p>
		<g:message code="view.travel.status" />: ${travel.status}
	</p>
	<p>
		<g:message code="view.travel.depart" />: ${travel.depart.adresse} ${travel.depart.city}, ${travel.depart.country}
	</p>
	<p>
		<g:message code="view.travel.destination" />: ${travel.destination.adresse} ${travel.destination.city}, ${travel.destination.country}
	</p>
	<p>
		<g:message code="view.travel.handicap" />: ${travel.handicap}
	</p>
	<p>
		<g:message code="view.travel.comment" />: ${travel.comment}
	</p>
	<br/>
	<div id="map_canvas" style="width: 500px; height: 300px"></div>
</fieldset>