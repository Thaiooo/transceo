	<g:if test="${member.travels.size() == 0}">
		<g:message code="message.no.travel" />
	</g:if>
	<g:else>
		<table class="spip" width="100%">
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
						<td width="50px">
							<g:if test="${ADMIN_VIEW == true}">
								<g:link controller="administrator" action="showTravel" id="${item.id}"><g:message code="travels.view" /></g:link>
							</g:if>
							<g:else>
								<g:link controller="travel" action="show" id="${item.id}"><g:message code="travels.view" /></g:link>
							</g:else>
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