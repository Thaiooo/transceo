<html>
    <head>
        <title><g:message code="title.member.edit" /></title>
		<meta name="layout" content="admin" />		
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
	    		<g:message code="view.member.code" />: ${member.code}
    		</p>
			<p>    		
	    		<g:message code="subscribe.firstName" />
    			<g:textField name="firstName" value="${member.firstName}"/>
    		</p>
    		<p>
    			<g:message code="subscribe.lastName" />
    			<g:textField name="lastName" value="${member.lastName}"/>
    		</p>
    		<p>
	    		<g:message code="subscribe.phoneNumber" />
    			<g:textField name="phoneNumber" value="${member.phoneNumber}"/>
    		</p>
    		<p>
    			<g:message code="subscribe.eMail" />
    			<g:textField name="eMail" value="${member.eMail}"/>
    		</p>
    		<p>
    			<g:message code="subscribe.adresse" />
    			<g:textField name="adresse" value="${member.adresse}"/>
    		</p>
    		<p>
    			<g:message code="subscribe.city" />
    			<g:textField name="city" value="${member.city}"/>
    		</p>
    		<p>
    			<g:message code="subscribe.postal" />
    			<g:textField name="postal" value="${member.postal}"/>
    		</p>
    		<p>
    			<g:message code="subscribe.country" />
    			<g:textField name="country" value="${member.country}"/>
    		</p>
    		<p>
    			<g:submitButton name="save" value="${message(code:'common.button.save')}" />
    			<g:if test="${session[com.transceo.SessionConstant.ADMIN_VIEW.name()] == true}"> 
    				<g:link controller="administrator" action="showProfile" id="${member.id}"><g:message code="common.button.cancel" /></g:link>
    			</g:if>
    			<g:else>
    				<g:link controller="member" action="showMyProfile"><g:message code="common.button.cancel" /></g:link>
    			</g:else>
    		</p>
    	</g:form>
    	
    </body>
</html>