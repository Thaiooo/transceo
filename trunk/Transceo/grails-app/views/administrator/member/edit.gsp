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
		<div id="formulaire">
	    	<g:form name="updateForm" controller="administrator" >
	    		<g:if test="${member.class.name == com.transceo.Member.class.name}">
	    			<g:render template="/common/member/editMemberInformation" bean="${member}" var="customer"/>
	    		</g:if>
	    		<g:if test="${member.class.name == com.transceo.Customer.class.name}">
	    			<g:render template="/common/member/editCustomerInformation" bean="${member}" var="customer"/>
	    		</g:if>
	    		<g:if test="${member.class.name == com.transceo.CustomerQuotation.class.name}">
	    			<g:render template="/common/member/editCustomerQuotationInformation" bean="${member}" var="customer"/>
	    		</g:if>
	    		<p class="boutons">
	    			<g:actionSubmit class="submit" action="showProfile" value="${message(code:'common.button.cancel')}" />
	    			<g:actionSubmit class="submit" action="updateCustomerInformation" value="${message(code:'common.button.save')}" />
	    		</p>
	    	</g:form>
    	</div>
    </body>
</html>