<html>
    <head>
        <title><g:message code="title.travel.confirmation" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
    <fieldset>
		<legend><g:message code="view.travel.section.prix.confirmation" /></legend>
		<g:form name="form" controller="travel" action="confirmReservation" >
    		<g:hiddenField name="id" value="${code.id}" />
    		<g:hiddenField name="code" value="${code.code}" />
    		<p>
    			<g:message code="label.page.client.reservation.confirmation.1" args='["${travel.price}"]'/>
    		</p>
    		<p>
	    		<g:message code="label.page.client.reservation.confirmation.2" />
    		</p>
    		<p>
    			<g:submitButton name="save" value="${message(code:'common.button.confirm')}" />
    		</p>
    	</g:form>
    </fieldset>
	<br/>    
    <g:render template="/common/travel/viewTravelSection" bean="${travel}" var="travel" model="['resume':true]"/>
    	
    </body>
</html>