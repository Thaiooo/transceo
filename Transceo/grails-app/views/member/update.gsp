<html>
    <head>
        <title>View</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
    	    	
    	<g:form name="updateForm" controller="member" action="update" >
    		<g:hiddenField name="id" value="${member.id}" />
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
    			<g:submitButton name="register" value="${message(code:'subscribe.button.update')}" />
    			<g:link controller="member" action="search"><g:message code="subscribe.button.cancel" /></g:link>
    			<g:link controller="member" action="delete" id="${member.id}"><g:message code="subscribe.button.delete" /></g:link>
    		</p>
    	</g:form>
    	
    	<p>Sponsor: ${member.sponsor}</p>
    	<p>Friends: ${member.friends}</p>
    	<p>Miles: ${member.miles}</p> 
    	
    </body>
</html>