<html>
    <head>
        <title><g:message code="title.travel.details" /></title>
        <g:if test="${ADMIN_VIEW == true}">
			<meta name="layout" content="admin" />
		</g:if>
		<g:else>
			<meta name="layout" content="client" />
		</g:else>
    </head>
    <body>
    	<g:render template="/common/travel/viewDetailsAndMapSection" bean="${travel}" var="travel"/>
    	<br/>
    	<g:if test="${ADMIN_VIEW == true}">
			<g:link controller="administrator" action="showProfile" id="${travel.customer.id}"><g:message code="common.button.back" /></g:link>
		</g:if>
		<g:else>
			<g:link controller="member" action="showMyProfile"><g:message code="common.button.back" /></g:link>
		</g:else>
    </body>
</html>