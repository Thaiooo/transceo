<html>
    <head>
        <title><g:message code="title.member.details"/></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<div><g:render template="/common/member/editable" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/common/mile" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/common/member/sponsor" bean="${member}"/></div>
    	<br/>
   		<div><g:render template="/common/friends" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/common/travels" bean="${member}"/></div>
    	<br/>
    	<g:if test="${session[com.transceo.SessionConstant.ADMIN_VIEW.name()] == true}"> 
    		<g:link controller="administrator" action="backMember">Retour</g:link>
    	</g:if>
    </body>
</html>