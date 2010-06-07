<html>
    <head>
        <title><g:message code="title.reservation.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:form action="updateReservationInformation">
    		<g:hiddenField name="id" value="${travel.id}" />
	    	<g:render template="/common/travel/editSection" bean="${travel}" var="travel"/>
	    	<br/>
	    	<g:submitButton name="update" value="${message(code:'common.button.submit')}" />
			<g:if test="${session[com.transceo.SessionConstant.ADMIN_PAGE.name()] == 'price'}">
	    		<g:link controller="administrator" action="showForPriceReservation" id="${travel.id}"><g:message code="common.button.back" /></g:link>
	    	</g:if>
	    	<g:elseif test="${session[com.transceo.SessionConstant.ADMIN_PAGE.name()] == 'confirm'}">
	    		<g:link controller="administrator" action="showForConfirmReservation" id="${travel.id}"><g:message code="common.button.back" /></g:link>
	    	</g:elseif>
	    	<g:else>
	    		<g:link controller="administrator" action="showForValidateReservation" id="${travel.id}"><g:message code="common.button.back" /></g:link>
	    	</g:else>
    	</g:form>
    </body>
</html>