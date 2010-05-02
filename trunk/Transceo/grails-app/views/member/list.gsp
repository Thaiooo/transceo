<html>
    <head>
        <title>Member - List</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<g:sortableColumn property="firstName" title="First Name" />	    			
	    			<g:sortableColumn property="lastName" title="Last Name" />
	    			<g:sortableColumn property="phoneNumber" title="Phone Number" />
	    			<g:sortableColumn property="eMail" title="E-Mail" />
	    			<g:sortableColumn property="subscribeDate" title="Subscribe Date" />
	    			<g:sortableColumn property="active" title="Status" />
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${members}">
		     		<tr>
		     			<td width="50px"><g:link action="show" id="${it.id}">Update</g:link></td>
		     			<td>${it.firstName}</td>
		     			<td>${it.lastName}</td>
		     			<td width="120px">${it.phoneNumber}</td>
						<td>${it.eMail}</td>
						<td width="70px"><g:formatDate format="yyyy-MM-dd" date="${it.subscribeDate}"/></td>
						<td width="20px">${it.active}</td>
		     		</tr>
				</g:each>
			</tbody>
    	</table>
    	
    	<g:paginate next="Forward" prev="Back"
    		max="2"  
            maxsteps="0" controller="member"
            action="list" total="${com.transceo.Member.count()}" />
            
    </body>
</html>