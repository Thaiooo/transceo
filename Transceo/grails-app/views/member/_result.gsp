		<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<g:sortableColumn action="sortMember" property="code" title="Code" />
	    			<g:sortableColumn action="sortMember" property="firstName" title="First Name" />	    			
	    			<g:sortableColumn action="sortMember" property="lastName" title="Last Name" />
	    			<g:sortableColumn action="sortMember" property="phoneNumber" title="Phone Number" />
	    			<g:sortableColumn action="sortMember" property="eMail" title="E-Mail" />
	    			<g:sortableColumn action="sortMember" property="adresse" title="Adresse" />
	    			<g:sortableColumn action="sortMember" property="city" title="City" />
	    			<g:sortableColumn action="sortMember" property="postal" title="Postal" />
	    			<g:sortableColumn action="sortMember" property="subscribeDate" title="Subscribe Date" />
	    			<g:sortableColumn action="sortMember" property="active" title="Status" />
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${members}">
		     		<tr>
		     			<td>
		     				<g:link action="showProfile" id="${it.id}">View</g:link>
		     				<g:link controller="administrator" action="initMemberReservation" id="${it.id}">Add Reservation</g:link>
		     			</td>
		     			<td>${it.code}</td>
		     			<td>${it.firstName}</td>
		     			<td>${it.lastName}</td>
		     			<td width="120px">${it.phoneNumber}</td>
						<td>${it.eMail}</td>
						<td>${it.adresse}</td>
		     			<td>${it.city}</td>
		     			<td>${it.postal}</td>
						<td width="70px"><g:formatDate format="yyyy-MM-dd" date="${it.subscribeDate}"/></td>
						<td width="20px">${it.active}</td>
		     		</tr>
				</g:each>
			</tbody>
    	</table>
    	
    	<g:paginate next="Forward" prev="Back"
    		max="2"  
            maxsteps="0" 
            controller="administrator" 
            action="paginateMember" 
            total="${total}" 
		/>