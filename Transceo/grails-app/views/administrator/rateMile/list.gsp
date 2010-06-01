<html>
    <head>
        <title><g:message code="title.rate.manage"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<th><g:message code="view.rate.level"/></th>
	    			<th><g:message code="view.rate.value"/></th>
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${rates}">
    				<tr>
    					<td><g:link action="initUpdate" id="${it.id}"><g:message code="common.button.edit"/></g:link></td>
    					<td>${it.level}</td>
    					<td>${it.rate}</td>
    				</tr>
    			</g:each>
    		</tbody>
    	</table>
    	
    	<br/>
    	
    	<g:link action="initAdd"><g:message code="common.button.add"/></g:link>
    </body>
</html>