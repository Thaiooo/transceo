<html>
    <head>
        <title>Login</title>
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
	    	<g:form controller="login" action="login" method="post" >
	    		<p>
	    		<g:message code="login.code" />
	    		<g:textField name="code" value="${code}"/>
	    		</p>
	    		<p>
	    		<g:message code="login.password" />
	    		<g:passwordField name="password" value="${password}"/>
	    		</p>
	    		<p class="boutons">
	    		<g:submitButton name="register" value="${message(code:'common.button.submit')}" class="submit" />
	    		</p>
	    	</g:form>
	    	
	    	<p>
	    		<a href="<g:createLink controller="member" action="initRegister" />#ancre" title="Manage user" >Register</a>
				<a href="${ resource(dir:'client/member', file:'sendPassword.gsp') }">Forgot Password</a>
			</p>
		
    	</div>
    	
    	
    </body>
</html>