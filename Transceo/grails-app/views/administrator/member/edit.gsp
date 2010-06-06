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
		ffff
    	<g:form name="updateForm" controller="administrator" action="updateCustomerInformation" >
    		<g:render template="/common/member/editCustomerInformation" bean="${member}" var="customer"/>
    		<p>
    			<g:submitButton name="save" value="${message(code:'common.button.save')}" />
    			<g:link controller="administrator" action="showProfile" id="${member.id}"><g:message code="common.button.cancel" /></g:link>
    		</p>
    	</g:form>
    </body>
</html>