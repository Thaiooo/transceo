Friends: 
<g:if test="${member.friends.size() == 0}">
	No friends
</g:if>
<g:else>
	<table border = "1">
		<thead>
			<tr>
				<th>First Name</th>
			    <th>Last Name</th>
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