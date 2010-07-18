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
    	<g:form name="updateForm" controller="administrator" action="updateCustomerInformation" >
    		<g:if test="${member.class.name == com.transceo.Member.class.name}">
    			<g:render template="/common/member/editMemberInformation" bean="${member}" var="customer"/>
    		</g:if>
    		<g:if test="${member.class.name == com.transceo.Customer.class.name}">
    			<g:render template="/common/member/editCustomerInformation" bean="${member}" var="customer"/>
    		</g:if>
    		<g:if test="${member.class.name == com.transceo.CustomerQuotation.class.name}">
    			<g:render template="/common/member/editCustomerQuotationInformation" bean="${member}" var="customer"/>
    		</g:if>
    		<p>
    			<g:submitButton name="save" value="${message(code:'common.button.save')}" />
    			<g:link controller="administrator" action="showProfile" id="${member.id}"><g:message code="common.button.cancel" /></g:link>
    		</p>
    	</g:form>
    </body>
</html>