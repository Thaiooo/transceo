<html>
    <head>
        <title><g:message code="title.member.details"/></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
		<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    	<g:render template="/common/member/viewSection" bean="${member}" var="customer" model='["legend":"${legend}", "editAble":true]'/>
    	<br/>
    	<div><g:render template="/common/member/mileSection" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/common/member/sponsorSection" bean="${member}"/></div>
    	<br/>
   		<div><g:render template="/common/member/friendsSection" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/common/travel/listSection" bean="${member}"/></div>
    	<br/>
    	<g:if test="${session[com.transceo.SessionConstant.ADMIN_VIEW.name()] == true}"> 
    		<g:link controller="administrator" action="backMember"><g:message code="common.button.back"/></g:link>
    	</g:if>
    </body>
</html>