<html>
    <head>
        <title><g:message code="title.travel.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    	<g:render template="/common/member/viewSection" bean="${travel.customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
    	<br/>
    	<g:render template="/administrator/travel/viewTravelSection" bean="${travel}" var="travel"/>
		<br/>
		<g:render template="/administrator/travel/actionSection" bean="${travel}" var="travel"/>		    	
    	<br/>
    	<g:link controller="administrator" action="travelToProcess">Retour</g:link>
    </body>
</html>