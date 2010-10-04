	<g:if test="${member.friends.size() == 0}">
		<g:message code="message.no.friends" />
	</g:if>
	<g:else>
		<table border = "1">
			<thead>
				<tr>
					<th><g:message code="friends.firstanme" /></th>
				    <th><g:message code="friends.lasttanme" /></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${member.friends}">
					<tr>
						<td>${it.firstName}</td>
						<td>${it.lastName}</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</g:else>
	<p>
		<a href="<g:createLink controller="member" action="initAddFriend" />" title="Add Friend" ><g:message code="label.common.button.add" /></a>
	</p>