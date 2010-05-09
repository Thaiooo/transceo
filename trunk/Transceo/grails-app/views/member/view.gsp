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
    	</div>
    	
    	<div>
    		<p>Miles: ${member.miles}</p>
    		<p>Miles from friends: ${member.miles}</p>
    		<p>Total: ${member.miles}</p>
    	</div>
    	
    	<div>
    		<p>Sponsor: ${member.sponsor}</p>
    	</div>
    	
    	<div>
    		Friends:
    		<table border = "1">
	    		<thead>
		    		<tr>
		    			<th></th>
		    			<th>Code</th>
		    			<th>First Name</th>
		    			<th>Last Name</th>
		    		</tr>
	    		</thead>
	    		<tbody>
			    	<g:each in="${member.friends}">
			     		<tr>
			     			<td width="50px"><g:link action="show" id="${it.id}">View</g:link></td>
			     			<td>${it.code}</td>
			     			<td>${it.firstName}</td>
			     			<td>${it.lastName}</td>
			     		</tr>
					</g:each>
				</tbody>
	    	</table>
    	</div>
    	
    </body>
</html>