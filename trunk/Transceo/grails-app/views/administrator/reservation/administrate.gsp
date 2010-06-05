<html>
    <head>
        <title><g:message code="title.reservation.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    	<g:render template="/common/member/viewSection" bean="${travel.customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
    	<br/>
    	<g:render template="/administrator/travel/viewTravelSection" bean="${travel}" var="travel"/>
		<br/>
    	<g:render template="/administrator/reservation/actionSection" bean="${travel}" var="travel" model='["price":"${price}"]'/>
    	<br/>
    	<g:if test="${session[com.transceo.SessionConstant.ADMIN_PAGE.name()] == 'price'}">
    		<g:link controller="administrator" action="reservationToPrice"><g:message code="common.button.back" /></g:link>
    	</g:if>
    	<g:else>
    		<g:link controller="administrator" action="reservationToConfirm"><g:message code="common.button.back" /></g:link>
    	</g:else>
    </body>
</html>