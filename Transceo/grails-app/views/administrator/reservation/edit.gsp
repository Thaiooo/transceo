<html>
    <head>
        <title><g:message code="title.reservation.details" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:render template="/common/travel/editSection" bean="${travel}" var="travel"/>
    	
    	<br/>
    	<g:link controller="administrator" action="${backAction}"><g:message code="common.button.back" /></g:link>
    </body>
</html>