<html>
    <head>
        <title><g:message code="title.rate.manage"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<table class="spip">
    		<thead>
	    		<tr class="row_first">
	    			<th></th>
	    			<th><g:message code="view.rate.level"/></th>
	    			<th><g:message code="view.rate.value"/></th>
	    		</tr>
    		</thead>
    		<tbody>
    			<g:each status="i" in="${rates}" var="item">
					<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
    					<td><g:link action="initUpdate" id="${item.id}"><g:message code="common.button.edit"/></g:link></td>
    					<td>${item.level}</td>
    					<td>${item.rate}</td>
    				</tr>
    			</g:each>
    		</tbody>
    	</table>
    	
    	<g:link action="initAdd"><g:message code="common.button.add"/></g:link>
    </body>
</html>