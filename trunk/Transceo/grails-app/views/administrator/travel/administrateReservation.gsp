<html>
    <head>
        <title><g:message code="title.reservation.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:render template="/travel/viewCustomer" bean="${travel.customer}" var="customer"/>
    	<br/>
    	<g:render template="/travel/viewTravel" bean="${travel}" var="travel"/>
		<br/>
    	<g:render template="/travel/actionForReservation" bean="${travel}" var="travel" model='["price":"${price}"]'/>
    	<br/>
    	<g:if test="${session[com.transceo.SessionConstant.ADMIN_PAGE.name()] == 'price'}">
    		<g:link controller="administrator" action="reservationToPrice"><g:message code="common.button.back" /></g:link>
    	</g:if>
    	<g:else>
    		<g:link controller="administrator" action="reservationToConfirm"><g:message code="common.button.back" /></g:link>
    	</g:else>
    </body>
</html>