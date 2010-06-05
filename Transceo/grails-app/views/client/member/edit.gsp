<html>
    <head>
        <title><g:message code="title.member.my.profile.edit" /></title>
        <g:if test="${session[com.transceo.SessionConstant.ADMIN_VIEW.name()] == true}"> 
			<meta name="layout" content="admin" />
		</g:if>
		<g:else>
			<meta name="layout" content="client" />
		</g:else>		
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
    	    	
    	<g:form name="updateForm" controller="member" action="update" >
    		<g:render template="/common/member/editCustomerInformation" bean="${member}" var="customer"/>
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