<html>
    <head>
        <title><g:message code="title.member.details"/></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    	<g:render template="/common/member/viewSection" bean="${member}" var="customer" model='["legend":"${legend}", "editAble":true]'/>
    	<br/>
    	<g:render template="/common/member/mileSection" bean="${member}"/>
    	<br/>
    	<g:render template="/common/member/sponsorSection" bean="${member}"/>
    	<br/>
   		<g:render template="/common/member/friendsSection" bean="${member}"/>
    	<br/>
    	<g:render template="/common/travel/listSection" bean="${member}"/>
    </body>
</html>