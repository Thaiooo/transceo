<html>
    <head>
        <title>Update Rate</title>
		<meta name="layout" content="main" />		
    </head>
    <body>

		<g:hasErrors bean="${rate}">
			<div class="errors">
				<g:renderErrors bean="${rate}" />
			</div>
		</g:hasErrors>    	
    	
    	<g:form action="update" method="post" >
    		<g:hiddenField name="id" value="${fieldValue(bean:rate,field:'id')}" />
    		<g:hiddenField name="level" value="${fieldValue(bean:rate,field:'level')}" />
    		<g:message code="rate.level" /> ${fieldValue(bean:rate,field:'level')}
    		<br/>
    		<g:message code="rate.rate" />
    		<g:textField name="rate" value="${fieldValue(bean:rate,field:'rate')}"/>
    		<g:submitButton name="create" value="Save" />
    	</g:form>
    	
    	<g:link action="list">Back</g:link>
    	
    </body>
</html>