<html>
    <head>
        <title>Subscribe</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
    	
    	<form controller="member" action="registerFriend" method="post" >
    		<g:hiddenField name="invitationId" value="${invitation.id}" />
    		<p>Sponsor: ${invitation.author.firstName}</p>
    		<p>
    		<g:message code="subscribe.firstName" />
    		<g:textField name="firstName" value="${fieldValue(bean:member,field:'firstName')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.lastName" />
    		<g:textField name="lastName" value="${fieldValue(bean:member,field:'lastName')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.phoneNumber" />
    		<g:textField name="phoneNumber" value="${fieldValue(bean:member,field:'phoneNumber')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.eMail" />
    		<g:textField name="eMail" value="${fieldValue(bean:member,field:'eMail')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.adresse" />
    		<g:textField name="adresse" value="${fieldValue(bean:member,field:'adresse')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.city" />
    		<g:textField name="city" value="${fieldValue(bean:member,field:'city')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.postal" />
    		<g:textField name="postal" value="${fieldValue(bean:member,field:'postal')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.country" />
    		<g:textField name="country" value="${fieldValue(bean:member,field:'country')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.password" />
    		<g:textField name="password" value="${fieldValue(bean:member,field:'password')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.password.confirm" />
    		<g:textField name="confirmPassword"/>
    		</p>
    		
    		<p>
    		<g:submitButton name="register" value="${message(code:'subscribe.button.subscribe')}" />
    		</p>
    	</form>
    </body>
</html>