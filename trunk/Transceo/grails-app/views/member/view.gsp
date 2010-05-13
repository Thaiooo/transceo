<html>
    <head>
        <title>View</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
		
		<div>
			<p>    		
	    		<g:message code="subscribe.firstName" />:
    			${fieldValue(bean:member,field:'firstName')}
    		</p>
    		<p>
    			<g:message code="subscribe.lastName" />:
    			${fieldValue(bean:member,field:'lastName')}
    		</p>
    		<p>
	    		<g:message code="subscribe.phoneNumber" />:
    			${fieldValue(bean:member,field:'phoneNumber')}
    		</p>
    		<p>
    			<g:message code="subscribe.eMail" />:
    			${fieldValue(bean:member,field:'eMail')}
    		</p>
    		<p>
    			<g:message code="subscribe.adresse" />:
    			${fieldValue(bean:member,field:'adresse')}
    		</p>
    		<p>
    			<g:message code="subscribe.city" />:
    			${fieldValue(bean:member,field:'city')}
    		</p>
    		<p>
    			<g:message code="subscribe.postal" />:
    			${fieldValue(bean:member,field:'postal')}
    		</p>
    		<p>
    			<g:message code="subscribe.country" />:
    			${fieldValue(bean:member,field:'country')}
    		</p>
    		<g:link controller="member" action="initUpdate" id="${fieldValue(bean:member,field:'id')}">Update</g:link>
    	</div>
    	
    	<br/>
    	
    	<div>
    		<p>Miles: ${member.miles}</p>
    		<p>Miles from friends: ${member.miles}</p>
    		<p>Total: ${member.miles}</p>
    	</div>
    	
    	<br/>
    	
    	<div>
    		<p>Sponsor: 
    			<g:if test="${member.sponsor != null}">${member.sponsor.firstName} ${member.sponsor.lastName}</g:if>
    			<g:else>No sponsor</g:else>
    		</p>
    	</div>
    	
    	<br/>
    	
    	<div>
    		Friends: 
    		<g:if test="${member.friends.size() == 0}">
    			No friends
    		</g:if>
    		<g:else>
	    		<table border = "1">
		    		<thead>
			    		<tr>
			    			<th>Code</th>
			    			<th>First Name</th>
			    			<th>Last Name</th>
			    		</tr>
		    		</thead>
		    		<tbody>
				    	<g:each in="${member.friends}">
				     		<tr>
				     			<td>${it.code}</td>
				     			<td>${it.firstName}</td>
				     			<td>${it.lastName}</td>
				     		</tr>
						</g:each>
					</tbody>
		    	</table>
		    </g:else>
    	</div>
    	
    	<br/>
    	
    	<div>
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
    	</div>
    	
    	<br/>
    	
    	<g:link controller="member" action="back">Retour</g:link>
    	
    </body>
</html>