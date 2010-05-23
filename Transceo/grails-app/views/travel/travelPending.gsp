<html>
    <head>
        <title>Travel Pending</title>
		<meta name="layout" content="main" />		
    </head>
    
    <body>
    	<g:if test="${travels == null || travels.size() == 0}">
    		<g:message code="message.travel.pending.empty" />
    	</g:if>
    	<g:else>
	    	<table border = "1">
	    		<thead>
		    		<tr>
		    			<th></th>
		    			<th>Creation Date</th>
		    			<th>Member</th>
		    			<th>Travel Date</th>
		    			<th>Depart</th>
		    			<th>Destination</th>
		    			<th>Nb Personne</th>
		    			<th>handicap</th>
		    		</tr>
	    		</thead>
	    		<tbody>
			    	<g:each in="${travels}">
			     		<tr>
			     			<td><g:link controller="travel" action="showForAdministrateTravel" id="${it.id}">Administrate</g:link></td>
			     			<td>
			     				<g:formatDate format="yyyy-MM-dd HH:mm" date="${it.creationDate}"/>
			     			</td>
			     			<td>
			     				<g:if test="${it.customer.class.name == 'com.transceo.Member'}">
			     					true
			     				</g:if>
			     				<g:else>
			     					false
			     				</g:else>
			     			</td>
			     			<td>
			     			<g:formatDate format="yyyy-MM-dd" date="${it.travelDate}"/>
			     			 ${it.travelHour}:${it.travelMinute}</td>
			     			<td>${it.depart.adresse} ${it.depart.postal} ${it.depart.city}, ${it.depart.country}</td>
			     			<td>${it.destination.adresse} ${it.destination.postal} ${it.destination.city}, ${it.destination.country}</td>
			     			<td>${it.numberOfPersonne}</td>
			     			<td>${it.handicap}</td>
			     		</tr>
			     	</g:each>
	    		</tbody>
	    	</table>
    	</g:else>
    </body>
</html>