<html>
    <head>
        <title><g:message code="title.travel.confirmation" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
    	<g:form name="form" controller="travel" action="confirmReservation" >
    		<g:hiddenField name="id" value="${id}" />
    		Confirmation Code <g:textField name="code" value="${code}"/>
    		<p>
    			<g:submitButton name="save" value="${message(code:'common.button.submit')}" />
    		</p>
    	</g:form>
    </body>
</html>