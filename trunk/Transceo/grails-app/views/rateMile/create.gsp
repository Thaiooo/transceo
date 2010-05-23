<html>
    <head>
        <title>Create Rate</title>
		<meta name="layout" content="main" />		
    </head>
    <body>

		<g:hasErrors bean="${rate}">
			<div class="errors">
				<g:renderErrors bean="${rate}" />
			</div>
		</g:hasErrors>    	
    	
    	<g:form action="create" method="post" >
    		<g:hiddenField name="level" value="${level}" />
    		<g:message code="rate.level" /> ${level}
    		<br/>
    		<g:message code="rate.rate" />
    		<g:textField name="rate" value="${fieldValue(bean:rate,field:'rate')}"/>
    		<g:submitButton name="create" value="Add" />
    	</g:form>
    	
    	<g:link action="list">Back</g:link>
    	
    </body>
</html>