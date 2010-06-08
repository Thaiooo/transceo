<html>
    <head>
        <title><g:message code="title.reservation.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    	<g:render template="/common/member/viewSection" bean="${travel.customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
    	<br/>
    	<g:render template="/common/travel/viewTravelSection" bean="${travel}" var="travel"/>
		<br/>
    	<g:link controller="administrator" action="backReservation"><g:message code="common.button.back" /></g:link>
    </body>
</html>