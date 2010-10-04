<html>
    <head>
        <title><g:message code="title.reservation.toPrice" /></title>
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
		    			<g:sortableColumn action="sortReservationToPrice" property="id" title="${message(code:'label.travel.id')}" />
		    			<g:sortableColumn action="sortReservationToPrice" property="creationDate" title="${message(code:'label.travel.creation.date')}" />
		    			<g:sortableColumn action="sortReservationToPrice" property="customer" title="${message(code:'label.travel.member')}" />
		    			<g:sortableColumn action="sortReservationToPrice" property="travelDate" title="${message(code:'label.travel.traveldate')}" />
		    			<th><g:message code="label.travel.depart" /></th>
		    			<th><g:message code="label.travel.destination" /></th>
		    			<g:sortableColumn action="sortReservationToPrice" property="numberOfPersonne" title="${message(code:'label.travel.number.personne')}" />
		    		</tr>
	    		</thead>
	    		<tbody>
	    			<g:each status="i" in="${travels}" var="item">
						<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
			     			<td>
			     				<g:link controller="administrator" action="showForPriceReservation" id="${item.id}"><g:message code="label.travel.action.administrate" /></g:link>
			     			</td>
			     			<td>${item.id}</td>
			     			<td>
			     				<g:formatDate format="${message(code:'label.common.date.time.format')}" date="${item.creationDate}"/>
			     			</td>
			     			<td>
			     				<g:if test="${item.customer.class.name == com.transceo.Member.class.name}">
			     					<g:message code="label.common.yes" />
			     				</g:if>
			     				<g:else>
			     					<g:message code="label.common.no" />
			     				</g:else>
			     			</td>
			     			<td>
			     			<g:formatDate format="${message(code:'label.common.date.time.format')}" date="${item.travelDate}"/></td>
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