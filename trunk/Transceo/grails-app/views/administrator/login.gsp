<html>
    <head>
        <title>Login</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:if test="${flash.message != null}">
	    	<div class="errors">
				<g:message code="${flash.message}" ></g:message>
			</div>
    	</g:if>
    	<form name="administrator" controller="administrator" action="login" method="post" >
    		<p>
    		<g:message code="login.login" />
    		<g:textField name="login" value="${userLogin}"/>
    		</p>
    		<p>
    		<g:message code="login.password" />
    		<g:passwordField name="password" value="${password}"/>
    		</p>
    		<p>
    		<g:submitButton name="submit" value="${message(code:'common.button.submit')}" />
    		</p>
    	</form>
    </body>
</html>