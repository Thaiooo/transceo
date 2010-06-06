<fieldset>
	<legend><g:message code="view.member.section.travel" /></legend>
	<g:if test="${member.travels.size() == 0}">
		<g:message code="message.no.travel" />
	</g:if>
	<g:else>
		<table border = "1">
			<thead>
				<tr>
					<th></th>
				    <th><g:message code="view.member.travels.creationdate" /></th>
				    <th><g:message code="view.member.travels.traveldate" /></th>
				    <th><g:message code="view.member.travels.depart" /></th>
				    <th><g:message code="view.member.travels.destination" /></th>
				    <th><g:message code="view.member.travels.price" /></th>
				    <th><g:message code="view.member.travels.status" /></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${member.travels}">
					<tr>
						<td width="50px">
							<g:if test="${ADMIN_VIEW == true}">
								<g:link controller="administrator" action="showTravel" id="${it.id}"><g:message code="view.member.travels.view" /></g:link>
							</g:if>
							<g:else>
								<g:link controller="travel" action="show" id="${it.id}"><g:message code="view.member.travels.view" /></g:link>
							</g:else>
						</td>
					    <td><g:formatDate format="${message(code:'common.date.time.format')}" date="${it.creationDate}"/></td>
					    <td><g:formatDate format="${message(code:'common.date.time.format')}" date="${it.travelDate}"/></td>
					    <td>${it.depart.adresse} ${it.depart.city}, ${it.depart.country}</td>
					    <td>${it.destination.adresse} ${it.destination.city}, ${it.destination.country}</td>
					    <td>${it.price}</td>
					    <td>${it.status}</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</g:else>
</fieldset>