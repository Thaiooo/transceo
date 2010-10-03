<html>
	<head>
		<title><g:message code="title.member.forgot.password" /></title>
		<meta name="layout" content="client" />
	</head>
	<body>
		<g:if test="${flash.message != null}">
	    	<div class="erreur_message">
	    		<ul>
					<li>
						<g:message code="${flash.message}" ></g:message>
					</li>
				</ul>
			</div>
	   	</g:if>
	    <div id="formulaire_password">
			<g:form name="form" controller="member" action="sendPassword" >
				<ul>
					<li>
				   		<label><g:message code="member.code" /></label>
				   		<g:textField name="code" value="${code}"/>
				   		<g:submitButton name="register" value="${message(code:'common.button.submit')}" class="submit" />
			   		</li>
			   	</ul>
			</g:form>
		</div>
	</body>
</html>