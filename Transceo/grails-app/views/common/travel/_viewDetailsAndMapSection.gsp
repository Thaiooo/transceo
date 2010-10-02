<jq:jquery>
    		<g:if test="${travel.destination != null}">
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
					var start = "${travel.depart.adresse} ${travel.depart.city}, <g:message code="country.${travel.depart.country}" />";
					var end = "${travel.destination.adresse} ${travel.destination.city}, <g:message code="country.${travel.destination.country}" />";
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
    		</g:if>
    		<g:else>
    			// Pour google map
   				$(window).load(function () {
  					initialize();
  					codeAddress();
				});
				
				var geocoder;
				var map;
				function initialize() {
				  geocoder = new google.maps.Geocoder();
				  var latlng = new google.maps.LatLng(48.8572, 2.3399);
				  var myOptions = {
				    zoom: 11,
				    center: latlng,
				    mapTypeId: google.maps.MapTypeId.ROADMAP,
				    scrollwheel: false,
					streetViewControl: true
				  }
				  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
				}
				
				function codeAddress() {
				    var address = "${travel.depart.adresse}, ${travel.depart.city}, <g:message code="country.${travel.depart.country}" />";
				    if (geocoder) {
				      geocoder.geocode( { 'address': address}, function(results, status) {
				        if (status == google.maps.GeocoderStatus.OK) {
				          map.setCenter(results[0].geometry.location);
				          
				          var marker = new google.maps.Marker({
				              map: map, 
				              position: results[0].geometry.location,
				              title:address
				          });

						  // Pour l'info bulle				          
				          var contentString = "<br/>${travel.depart.adresse} <br/> ${travel.depart.postal} ${travel.depart.city} <br/> <g:message code="country.${travel.depart.country}" />";
				      	  var infowindow = new google.maps.InfoWindow({
				        	content: contentString
				      	  });
					      google.maps.event.addListener(marker, 'click', function() {
	      					infowindow.open(map,marker);
	    				  });
				          
				        } else {
				          alert("Geocode was not successful for the following reason: " + status);
				        }
				      });
					}
				}
    		</g:else>
</jq:jquery>

<fieldset>
	<legend><g:message code="travel.section.travel" /></legend>
	<g:if test="${resume != true}">
		<p>
	    	<g:message code="travel.creation.date" />: <g:formatDate format="${message(code:'common.date.time.format')}" date="${travel.creationDate}"/>
		</p>
	</g:if>
	<p>
		<g:message code="travel.traveldate" />: <g:formatDate format="${message(code:'common.date.time.format')}" date="${travel.travelDate}"/>
	</p>
	<g:if test="${resume != true}">
		<p>
			<g:message code="travel.status" />: <g:message code="reservation.status.${travel.status}" /> 
		</p>
	</g:if>
	<p>
		<g:message code="travel.depart" />: ${travel.depart.adresse}, ${travel.depart.postal} ${travel.depart.city}, <g:message code="country.${travel.depart.country}" />  
	</p>
	<g:if test="${travel.destination != null}">
		<p>
			<g:message code="travel.destination" />: ${travel.destination.adresse}, ${travel.destination.postal} ${travel.destination.city}, <g:message code="country.${travel.destination.country}" />
		</p>
	</g:if>
	<p>
		<g:message code="travel.number.personne" />: ${travel.numberOfPersonne}
	</p>
	<p>
		<g:message code="travel.comment" />: ${travel.comment}
	</p>
	<br/>
	<div id="map_canvas" style="width: 810px; height: 300px"></div>
    <g:if test="${ADMIN_VIEW == true}">
    	<br/>
    	<div id="directionsPanel" style="width:100%; height:100%;"></div>
	    <p>
			<g:link action="initUpdateReservationInformation" id="${travel.id}"><g:message code="common.button.edit" /></g:link>
		</p>
	</g:if>
</fieldset>