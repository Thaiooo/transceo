<html>
    <head>
        <title>Login</title>
		<meta name="layout" content="index" />		
    </head>
    <body>
    	<g:if test="${flash.message != null}">
	    	<div class="errors">
				<g:message code="${flash.message}" ></g:message>
			</div>
    	</g:if>
    	<g:form controller="login" action="login" method="post" >
    		<p>
    		<g:message code="login.code" />
    		<g:textField name="code" value="${code}"/>
    		</p>
    		<p>
    		<g:message code="login.password" />
    		<g:passwordField name="password" value="${password}"/>
    		</p>
    		<p>
    		<g:submitButton name="register" value="${message(code:'common.button.submit')}" />
    		</p>
    	</g:form>
    	
    	<br/>
    	<g:link controller="member" action="initRegister">Register</g:link>
		<br/>
		<a href="${ resource(dir:'member', file:'sendPassword.gsp') }">Forgot Password</a>
    </body>
</html>