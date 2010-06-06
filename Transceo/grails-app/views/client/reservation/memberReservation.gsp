<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="client" />		
    </head>
    <body>
    	<g:form controller="travel" action="memberReserve" method="post" >
    		<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    		<g:render template="/common/member/viewSection" bean="${member}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
    		<br/>
    		<g:render template="/common/travel/editSection" bean="${travel}" var="travel"/>
    		<br/>
    		<p>
	    		<g:submitButton name="create" value="${message(code:'common.button.submit')}" />
    		</p>
    	</g:form>
    </body>
</html>