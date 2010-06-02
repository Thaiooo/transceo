<html>
    <head>
        <title><g:message code="title.travel.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:render template="/common/member/view" bean="${travel.customer}" var="customer"/>
    	<br/>
    	<g:render template="/administrator/travel/viewTravel" bean="${travel}" var="travel"/>
		<br/>
		<g:render template="/administrator/travel/actionForTravel" bean="${travel}" var="travel"/>		    	
    	<br/>
    	<g:link controller="administrator" action="travelToProcess">Retour</g:link>
    </body>
</html>