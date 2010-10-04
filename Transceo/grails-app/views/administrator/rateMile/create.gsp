<html>
    <head>
        <title><g:message code="title.rate.create"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>

		<g:hasErrors bean="${rate}">
			<div class="errors">
				<g:renderErrors bean="${rate}" />
			</div>
		</g:hasErrors>    	
    	
    	<g:form action="create" method="post" >
    		<g:hiddenField name="level" value="${level}" />
    		<g:message code="label.rate.level" /> ${level}
    		<br/>
    		<g:message code="label.rate.value" />
    		<g:textField name="rate" value="${fieldValue(bean:rate,field:'rate')}"/>
    		<p>
    		<g:submitButton name="create" value="${message(code:'label.common.button.add')}" />
    		<g:link action="list"><g:message code="label.common.button.back"/></g:link>
    		</p>
    	</g:form>
    </body>
</html>