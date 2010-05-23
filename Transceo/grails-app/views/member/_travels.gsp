Travels:
<g:if test="${member.travels.size() == 0}">
	No travels
</g:if>
<g:else>
	<table border = "1">
		<thead>
			<tr>
				<th></th>
			    <th>Creation Date</th>
			    <th>Travel Date</th>
			    <th>Depart</th>
			    <th>Destination</th>
			    <th>Price</th>
			    <th>Status</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${member.travels}">
				<tr>
					<td width="50px"><g:link controller="travel" action="show" id="${it.id}">View</g:link></td>
				    <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${it.creationDate}"/></td>
				    <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${it.travelDate}"/></td>
				    <td>${it.depart.adresse} ${it.depart.city}, ${it.depart.country}</td>
				    <td>${it.destination.adresse} ${it.destination.city}, ${it.destination.country}</td>
				    <td>${it.price}</td>
				    <td>${it.status}</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:else>