<html>
    <head>
        <title><g:message code="title.rate.edit"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>

		<g:hasErrors bean="${rate}">
			<div class="errors">
				<g:renderErrors bean="${rate}" />
			</div>
		</g:hasErrors>    	
    	
    	<g:form method="post" >
    		<g:hiddenField name="id" value="${fieldValue(bean:rate,field:'id')}" />
    		<g:hiddenField name="level" value="${fieldValue(bean:rate,field:'level')}" />
    		<g:message code="rate.level" />: ${fieldValue(bean:rate,field:'level')}
    		<br/>
    		<g:message code="rate.value" />
    		<g:textField name="rate" value="${fieldValue(bean:rate,field:'rate')}" size="3"/>
    		
    		<p class="boutons">
	    		<g:actionSubmit value="${message(code:'common.button.save')}" action="update" /> 
    			<g:actionSubmit value="${message(code:'common.button.delete')}" action="deleteRate" />
    			<g:link action="list"><g:message code="common.button.back"/></g:link>
    		</p>
    	</g:form>
    </body>
</html>