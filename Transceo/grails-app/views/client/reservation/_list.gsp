<jq:jquery>
	// Pour google map
	$('.shwoDetails').click(function() {
		var travelId = $(this).attr('id');
		${remoteFunction(controller:'travel', action:'dispalyTravelDetailsPopup', update:'details_canvas', params:'\'id=\' + travelId', onComplete:'displayPopup()')};
	});
	
	function displayPopup(){
		$("#dialog-modal").show();
		initialize();
		
		var end = $("#destination").html();
		if(end == null){
			codeAddress();
		}else{
			calcRoute();
		}
		
		$("#dialog-modal").dialog({
			width: 700,
			resizable: false,
			modal: true
		});
	}

	var map;	
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
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		directionsDisplay.setMap(map);
	}

	function calcRoute() {					
		var start = $("#depart").html();
		var end = $("#destination").html();
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
	
	function codeAddress() {
		var address = $("#depart").html();
		var geocoder = new google.maps.Geocoder();
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
					var contentString = $("#depart").html();
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
</jq:jquery>
			
<g:if test="${member.travels.size() == 0}">
	<g:message code="message.no.travel" />
</g:if>
<g:else>
	<table class="spip">
		<thead>
			<tr class="row_first">
				<th></th>
			    <th><g:message code="travels.creationdate" /></th>
			    <th><g:message code="travels.traveldate" /></th>
			    <th><g:message code="travels.depart" /></th>
			    <th><g:message code="travels.destination" /></th>
			    <th><g:message code="travels.price" /></th>
			    <th><g:message code="travels.status" /></th>
			</tr>
		</thead>
		<tbody>
			<g:each status="i" in="${member.travels}" var="item">
				<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
					<td width="22px">
						<a class="shwoDetails" id="${item.id}">
							<img src="${resource(dir:'images',file:'loupe.png')}" alt="${message(code:'travels.view')}" />
						</a>
					</td>
				    <td><g:formatDate format="${message(code:'common.date.time.format')}" date="${item.creationDate}"/></td>
				    <td><g:formatDate format="${message(code:'common.date.time.format')}" date="${item.travelDate}"/></td>
				    <td>${item.depart.adresse} ${item.depart.city}, ${item.depart.country}</td>
				    <td>
				    	<g:if test="${item.destination != null}">
				    		${item.destination.adresse} ${item.destination.city}, ${item.destination.country}
				    	</g:if>
				    </td>
				    <td>${item.price}&#8364;</td>
				    <td><g:message code="reservation.status.${item.status}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:else>