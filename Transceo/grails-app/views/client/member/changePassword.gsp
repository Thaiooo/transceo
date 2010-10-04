<html>
    <head>
        <title><g:message code="title.member.password" /></title>
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
		<div class="formulaire_spip formulaire_editer_message_contact" id=formulaire_register>
			<form controller="member" action="changePassword" method="post" >
	    		<p>
	    		<g:message code="subscribe.password.old" /> <strong><g:message code="common.required" /></strong>
	    		<g:passwordField name="oldPassword" value="${oldPassword}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.password" /> <strong><g:message code="common.required" /></strong>
	    		<g:passwordField name="password" value="${password}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.password.confirm" /> <strong><g:message code="common.required" /></strong>
	    		<g:passwordField name="confirmPassword"/>
	    		</p>
	
	    		<p class="boutons"><g:submitButton name="register" value="${message(code:'label.common.button.submit')}" class="submit" /></p>
    		</form>
		</div>
    	
    	
    </body>
</html>