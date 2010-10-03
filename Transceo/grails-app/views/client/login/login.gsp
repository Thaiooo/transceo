<html>
    <head>
        <title><g:message code="title.login" /></title>
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
    	
    	<div id="formulaire">
	    	<g:form controller="login" action="login" method="post" >
	    		<ul>
					<li>
			   			<label><g:message code="label.page.login.code" /></label>
			   			<g:textField name="code" value="${code}"/>
			   		</li>
					<li>	    		
	    				<label><g:message code="label.page.login.password" /></label>
	    				<g:passwordField name="password" value="${password}"/>
					</li>
				</ul>
				
	    		<p class="boutons">
	    			<g:submitButton name="register" value="${message(code:'common.button.submit')}" class="submit" />
	    		</p>
	    		
	    	</g:form>
    	</div>
    	
    	<div class="link">
		    <a href="<g:createLink controller="member" action="initRegister" />#ancre" ><g:message code="label.page.login.register" /></a>
			<a href="${ resource(dir:'client/member', file:'sendPassword.gsp') }"><g:message code="label.page.login.forgot.password" /></a>
		</div>
		
    </body>
</html>