		<g:if test="${reservations == null || reservations.size() == 0}">
    		<g:message code="message.search.reservation.empty" />
    	</g:if>
    	<g:else>
	    	<table border = "1">
	    		<thead>
		    		<tr>
		    			<th></th>
		    			<g:sortableColumn action="sortReservation" property="creationDate" title="${message(code:'view.travel.creationdate')}" />
		    			<g:sortableColumn action="sortReservation" property="customer.code" title="${message(code:'view.travel.member')}" />
		    			<g:sortableColumn action="sortReservation" property="travelDate" title="${message(code:'view.travel.traveldate')}" />
		    			<th><g:message code="view.travel.depart" /></th>
		    			<th><g:message code="view.travel.destination" /></th>
		    			<g:sortableColumn action="sortReservation" property="numberOfPersonne" title="${message(code:'view.travel.number.personne')}" />
		    			<g:sortableColumn action="sortReservation" property="handicap" title="${message(code:'view.travel.handicap')}" />
		    			<g:sortableColumn action="sortReservation" property="status" title="${message(code:'view.travel.status')}" />
		    		</tr>
	    		</thead>
	    		<tbody>
			    	<g:each in="${reservations}">
			     		<tr>
			     			<td>
			     				<g:link controller="administrator" action="showForPriceReservation" id="${it.id}"><g:message code="view.travel.administrate" /></g:link>
			     			</td>
			     			<td>
			     				<g:formatDate format="${message(code:'common.date.time.format')}" date="${it.creationDate}"/>
			     			</td>
			     			<td>
			     				<g:if test="${it.customer.class.name == com.transceo.Member.class.name}">
			     					<g:message code="common.yes" />
			     				</g:if>
			     				<g:else>
			     					<g:message code="common.no" />
			     				</g:else>
			     			</td>
			     			<td>
			     			<g:formatDate format="${message(code:'common.date.time.format')}" date="${it.travelDate}"/></td>
			     			<td>${it.depart.adresse} ${it.depart.postal} ${it.depart.city}, ${it.depart.country}</td>
			     			<td>${it.destination.adresse} ${it.destination.postal} ${it.destination.city}, ${it.destination.country}</td>
			     			<td>${it.numberOfPersonne}</td>
			     			<td>
			     				<g:if test="${it.handicap}">
			     					<g:message code="common.yes" />
			     				</g:if>
			     				<g:else>
			     					<g:message code="common.no" />
			     				</g:else>
			     			</td>
			     			<td><g:message code="reservation.status.${it.status}" /></td>
			     		</tr>
			     	</g:each>
	    		</tbody>
	    	</table>
    	</g:else>