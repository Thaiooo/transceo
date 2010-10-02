<html>
    <head>
        <title><g:message code="title.reservation.toConfirm" /></title>
		<meta name="layout" content="admin" />		
    </head>
    
    <body>
    	<g:if test="${travels == null || travels.size() == 0}">
    		<g:message code="message.reservation.empty" />
    	</g:if>
    	<g:else>
	    	<table class="spip" width="100%">
    			<thead>
	    			<tr class="row_first">
		    			<th></th>
		    			<g:sortableColumn action="sortReservationToConfirm" property="id" title="${message(code:'travel.id')}" />
		    			<g:sortableColumn action="sortReservationToConfirm" property="creationDate" title="${message(code:'travel.creationdate')}" />
		    			<g:sortableColumn action="sortReservationToConfirm" property="customer" title="${message(code:'travel.member')}" />
		    			<g:sortableColumn action="sortReservationToConfirm" property="travelDate" title="${message(code:'travel.traveldate')}" />
		    			<th><g:message code="travel.depart" /></th>
		    			<th><g:message code="travel.destination" /></th>
		    			<g:sortableColumn action="sortReservationToConfirm" property="numberOfPersonne" title="${message(code:'travel.number.personne')}" />
		    		</tr>
	    		</thead>
	    		<tbody>
	    			<g:each status="i" in="${travels}" var="item">
						<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
			     			<td><g:link controller="administrator" action="showForConfirmReservation" id="${item.id}"><g:message code="travel.action.administrate" /></g:link></td>
			     			<td>${item.id}</td>
			     			<td>
			     				<g:formatDate format="${message(code:'common.date.time.format')}" date="${item.creationDate}"/>
			     			</td>
			     			<td>
			     				<g:if test="${item.customer.class.name == com.transceo.Member.class.name}">
			     					<g:message code="common.yes" />
			     				</g:if>
			     				<g:else>
			     					<g:message code="common.no" />
			     				</g:else>
			     			</td>
			     			<td><g:formatDate format="${message(code:'common.date.time.format')}" date="${item.travelDate}"/></td>
			     			<td>${item.depart.adresse} ${item.depart.postal} ${item.depart.city}, ${item.depart.country}</td>
			     			<td>${item.destination.adresse} ${item.destination.postal} ${item.destination.city}, ${item.destination.country}</td>
			     			<td>${item.numberOfPersonne}</td>
			     		</tr>
			     	</g:each>
	    		</tbody>
	    	</table>
    	</g:else>
    </body>
</html>