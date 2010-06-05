<html>
    <head>
        <title><g:message code="title.search.member"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:render template="/administrator/member/criteriaSection" bean="${members}"/>
    	<br/>
    	<g:render template="/administrator/member/result" bean="${members}"/>
    </body>
</html>