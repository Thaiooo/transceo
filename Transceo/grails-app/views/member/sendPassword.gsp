<html>
	<head>
		<title>Forgot Password</title>
		<meta name="layout" content="index" />
	</head>
	<body>
	<g:if test="${flash.message != null}">
    	<div class="errors">
			<g:message code="${flash.message}" ></g:message>
		</div>
    </g:if>
	<g:form name="form" controller="member" action="sendPassword" >
		<p>
			<g:message code="sendPassword.code" />
    		<g:textField name="code" value="${code}"/>
    	</p>
    	<g:submitButton name="save" value="${message(code:'common.button.submit')}" />
	</g:form>
	
	</body>
</html>