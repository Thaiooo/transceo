<g:if test="${member.specialeConditions == null || member.specialeConditions.size() == 0}">
	<g:message code="message.speciale.condition.empty"/>
</g:if>
<g:else>
	<table class="spip">
		<thead>
			<tr class="row_first">
				<th></th>
				<th><g:message code="speciale.condition.label"/></th>
				<th><g:message code="speciale.condition.startDate"/></th>
				<th><g:message code="speciale.condition.endDate"/></th>
				<th><g:message code="speciale.condition.value"/></th>
			</tr>
		</thead>
		<tbody>
			<g:each status="i" in="${member.specialeConditions}" var="item">
				<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
					<td>
						<g:link action="initUpdateSpecialCondition" id="${item.id}" params="[memberId:member.id]"><g:message code="label.common.button.edit"/></g:link>
					</td>
					<td>${item.label}</td>
					<td><g:formatDate format="${message(code:'common.date.format')}" date="${item.startDate}"/></td>
					<td><g:formatDate format="${message(code:'common.date.format')}" date="${item.endDate}"/></td>
					<td>${item.value} <g:message code="special.condition.type.${item.type}" /></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:else>
<p class="boutons">
	<g:link action="initAddSpecialCondition" id="${member.id}"><g:message code="label.common.button.add"/></g:link>
</p>