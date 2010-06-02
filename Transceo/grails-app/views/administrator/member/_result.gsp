		<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<g:sortableColumn action="sortMember" property="code" title="${message(code:'search.member.code')}" />
	    			<g:sortableColumn action="sortMember" property="firstName" title="${message(code:'search.member.firstName')}" />	    			
	    			<g:sortableColumn action="sortMember" property="lastName" title="${message(code:'search.member.lastName')}" />
	    			<g:sortableColumn action="sortMember" property="phoneNumber" title="${message(code:'search.member.phone')}" />
	    			<g:sortableColumn action="sortMember" property="eMail" title="${message(code:'search.member.mail')}" />
	    			<g:sortableColumn action="sortMember" property="adresse" title="${message(code:'search.member.adresse')}" />
	    			<g:sortableColumn action="sortMember" property="city" title="${message(code:'search.member.city')}" />
	    			<g:sortableColumn action="sortMember" property="postal" title="${message(code:'search.member.postal')}" />
	    			<g:sortableColumn action="sortMember" property="active" title="${message(code:'search.member.activate')}" />
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${members}">
		     		<tr>
		     			<td>
		     				<g:link action="showProfile" id="${it.id}"><g:message code="search.member.view" /></g:link>
		     				<br/>
		     				<g:link controller="administrator" action="initMemberReservation" id="${it.id}"><g:message code="search.member.create.reservation" /></g:link>
		     			</td>
		     			<td>${it.code}</td>
		     			<td>${it.firstName}</td>
		     			<td>${it.lastName}</td>
		     			<td width="120px">${it.phoneNumber}</td>
						<td>${it.eMail}</td>
						<td>${it.adresse}</td>
		     			<td>${it.city}</td>
		     			<td>${it.postal}</td>
						<td width="20px">${it.active}</td>
		     		</tr>
				</g:each>
			</tbody>
    	</table>
    	
		<div>   	
	    	<g:paginate next="${message(code:'common.button.paginate.next')}" prev="${message(code:'common.button.paginate.back')}"
	    		max="2"  
	            maxsteps="0" 
	            controller="administrator" 
	            action="paginateMember" 
	            total="${total}" 
			/>
		</div>