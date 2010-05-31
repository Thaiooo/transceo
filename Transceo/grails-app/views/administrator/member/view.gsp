<html>
    <head>
        <title><g:message code="title.member.details"/></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
		<div><g:render template="/member/profile" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/member/mile" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/member/sponsor" bean="${member}"/></div>
    	<br/>
   		<div><g:render template="/member/friends" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/member/travels" bean="${member}"/></div>
    	<br/>
    	<g:if test="${session[com.transceo.SessionConstant.ADMIN_VIEW.name()] == true}"> 
    		<g:link controller="administrator" action="backMember">Retour</g:link>
    	</g:if>
    </body>
</html>