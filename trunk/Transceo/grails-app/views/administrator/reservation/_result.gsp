		<g:if test="${reservations == null || reservations.size() == 0}">
    		<g:message code="message.search.reservation.empty" />
    	</g:if>
    	<g:else>
	    	<table class="spip" width="100%">
    			<thead>
	    			<tr class="row_first">
		    			<th></th>
		    			<g:sortableColumn action="sortReservation" property="id" title="${message(code:'view.travel.id')}" />
		    			<g:sortableColumn action="sortReservation" property="creationDate" title="${message(code:'view.travel.creationdate')}" />
		    			<g:sortableColumn action="sortReservation" property="customer" title="${message(code:'view.travel.member')}" />
		    			<g:sortableColumn action="sortReservation" property="travelDate" title="${message(code:'view.travel.traveldate')}" />
		    			<th><g:message code="view.travel.depart" /></th>
		    			<th><g:message code="view.travel.destination" /></th>
		    			<g:sortableColumn action="sortReservation" property="numberOfPersonne" title="${message(code:'view.travel.number.personne')}" />
		    			<g:sortableColumn action="sortReservation" property="status" title="${message(code:'view.travel.status')}" />
		    		</tr>
	    		</thead>
	    		<tbody>
	    			<g:each status="i" in="${reservations}" var="item">
						<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
			     			<td>
			     				<g:link controller="administrator" action="showReservationDetails" id="${item.id}"><g:message code="view.travel.action.view" /></g:link>
			     			</td>
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
			     			<td>
			     			<g:formatDate format="${message(code:'common.date.time.format')}" date="${item.travelDate}"/></td>
			     			<td>${item.depart.adresse} ${item.depart.postal} ${item.depart.city}, ${item.depart.country}</td>
			     			<td>
			     				<g:if test="${item.destination != null}">
			     					${item.destination.adresse} ${item.destination.postal} ${item.destination.city}, ${item.destination.country}
			     				</g:if>
			     			</td>
			     			<td>${item.numberOfPersonne}</td>
			     			<td><g:message code="reservation.status.${item.status}" /></td>
			     		</tr>
			     	</g:each>
	    		</tbody>
	    	</table>
	    	
	    	<div id="pagination"> 	
		    	<g:paginate next="${message(code:'common.button.paginate.next')}" prev="${message(code:'common.button.paginate.back')}"
		    		max="2"
		            maxsteps="0" 
		            controller="administrator" 
		            action="paginateReservation" 
		            total="${total}" 
				/>
			</div>
    	</g:else>