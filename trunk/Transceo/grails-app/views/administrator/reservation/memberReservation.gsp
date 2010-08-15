<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<g:form controller="travel" action="bookOrQuoteATravel" method="post" >
    		<g:hiddenField name="ADMIN_VIEW" value="true" />
    		<g:hiddenField name="customerId" value="${customer.id}" />
    		
    		<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    		<g:render template="/common/member/viewSection" bean="${customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
    		<br/>
    		<g:render template="/common/travel/editSectionWithSelectionType" bean="${travel}" var="travel" model='["reservationType":"${reservationType}"]'/>
    		<br/>
    		<p>
	    		<g:submitButton name="create" value="${message(code:'common.button.submit')}" />
				<g:link controller="administrator" action="backMember"><g:message code="common.button.back" /></g:link>
    		</p>
    	</g:form>
    </body>
</html>