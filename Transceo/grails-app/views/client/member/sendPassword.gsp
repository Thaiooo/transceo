<html>
	<head>
		<title>Forgot Password</title>
		<meta name="layout" content="index" />
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
    <div class="formulaire_spip formulaire_editer_message_contact" id=formulaire_register>
		<g:form name="form" controller="member" action="sendPassword" >
			<p>
				<g:message code="sendPassword.code" />
	    		<g:textField name="code" value="${code}"/>
	    	</p>
	    	<p class="boutons">
	    		<g:submitButton name="register" value="${message(code:'common.button.submit')}" class="submit" />
	    	</p>
		</g:form>
	</div>
	
	</body>
</html>