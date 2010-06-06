<html>
    <head>
        <title><g:message code="title.member.my.profile.edit" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
    	<g:form name="updateForm" controller="member" action="updateCustomerInformation" >
    		<g:render template="/common/member/editCustomerInformation" bean="${member}" var="customer"/>
    		<p>
    			<g:submitButton name="save" value="${message(code:'common.button.save')}" />
    			<g:link controller="member" action="showMyProfile"><g:message code="common.button.cancel" /></g:link>
    		</p>
    	</g:form>
    </body>
</html>