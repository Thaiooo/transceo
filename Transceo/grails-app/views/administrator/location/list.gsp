<html>
    <head>
        <title><g:message code="title.location.manage"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
		<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<th><g:message code="view.adresse.label"/></th>
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${adresses}">
    				<tr>
    					<td><g:link action="initUpdate" id="${it.id}"><g:message code="common.button.edit"/></g:link></td>
    					<td>${it.label}</td>
    				</tr>
    			</g:each>
    		</tbody>
    	</table>
    	
    	<br/>
    	
    	<g:link action="initAdd"><g:message code="common.button.add"/></g:link>
    </body>
</html>