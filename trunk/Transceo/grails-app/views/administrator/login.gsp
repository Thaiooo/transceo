<html>
    <head>
        <title><g:message code="title.admin.login" /></title>
		<meta name="layout" content="admin" />			
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
    	<g:form name="administrator" controller="administrator" action="login" method="post" >
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
    	</g:form>
    </body>
</html>