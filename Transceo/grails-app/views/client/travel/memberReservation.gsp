<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="client" />		
    </head>
    <body>
    	<g:form controller="travel" action="memberReserve" method="post" >
    		<g:render template="/travel/viewCustomer" bean="${member}" var="customer"/>
    		<br/>
    		<g:render template="/common/editTravel" bean="${travel}" var="travel"/>
    		<br/>
    		<p>
	    		<g:submitButton name="create" value="${message(code:'common.button.submit')}" />
	    		<g:if test="${session[com.transceo.SessionConstant.ADMIN_VIEW.name()] == true}"> 
					<g:link controller="administrator" action="backMember"><g:message code="common.button.back" /></g:link>
	    		</g:if>
    		</p>
    	</g:form>
    </body>
</html>