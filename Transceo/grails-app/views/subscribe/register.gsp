<html>
    <head>
        <title>Subscribe</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	Subscribe
    	
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
    	    	
    	<form controller="member" action="register" method="post" >
    		<g:message code="subscribe.firstName" />
    		<g:textField name="firstName" value="${fieldValue(bean:member,field:'firstName')}"/>
    		
    		<g:message code="subscribe.lastName" />
    		<g:textField name="lastName" value="${fieldValue(bean:member,field:'lastName')}"/>
    		
    		<g:message code="subscribe.phoneNumber" />
    		<g:textField name="phoneNumber" value="${fieldValue(bean:member,field:'phoneNumber')}"/>
    		
    		<g:message code="subscribe.eMail" />
    		<g:textField name="eMail" value="${fieldValue(bean:member,field:'eMail')}"/>
    		
    		<g:message code="subscribe.password" />
    		<g:textField name="password" value="${fieldValue(bean:member,field:'password')}"/>
    		
    		<g:message code="subscribe.password.confirm" />
    		<g:textField name="confirmPassword"/>
    		
    		<g:message code="subscribe.number" />
    		<g:textField name="number" value="${fieldValue(bean:member,field:'number')}"/>
    		
    		<g:message code="subscribe.street" />
    		<g:textField name="street" value="${fieldValue(bean:member,field:'street')}"/>
    		
    		<g:message code="subscribe.city" />
    		<g:textField name="city" value="${fieldValue(bean:member,field:'city')}"/>
    		
    		<g:message code="subscribe.postal" />
    		<g:textField name="postal" value="${fieldValue(bean:member,field:'postal')}"/>
    		
    		<g:submitButton name="register" value="${message(code:'subscribe.button.subscribe')}" />
    		<g:link controller="member" action="init"><g:message code="subscribe.button.cancel" /></g:link>
    	</form>
    </body>
</html>