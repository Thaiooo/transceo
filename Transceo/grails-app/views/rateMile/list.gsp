<html>
    <head>
        <title>View</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<th>Level</th>
	    			<th>Rate</th>
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${rates}">
    				<tr>
    					<td><g:link action="initUpdate" id="${it.id}">Update</g:link></td>
    					<td>${it.level}</td>
    					<td>${it.rate}</td>
    				</tr>
    			</g:each>
    		</tbody>
    	</table>
    	
    	<br/>
    	
    	<g:link action="initAdd">Add</g:link>
    </body>
</html>