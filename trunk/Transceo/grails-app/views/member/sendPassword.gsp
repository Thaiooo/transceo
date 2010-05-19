<html>
	<head>
		<title>View</title>
		<meta name="layout" content="main" />
	</head>
	<body>
	
	<g:form name="form" controller="member" action="sendPassword" >
		<p>
			<g:message code="sendPassword.eMail" />
    		<g:textField name="password"/>
    	</p>
    	<g:submitButton name="save" value="${message(code:'common.button.submit')}" />
	</g:form>
	
	</body>
</html>