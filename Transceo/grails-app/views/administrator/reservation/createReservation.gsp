<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    	<div id="formulaire_reservation">
	    	<g:form controller="travel" action="bookOrQuoteATravel" method="post" >
	    		<g:hiddenField name="ADMIN_VIEW" value="true" />
	
	    		<g:if test="${customer == null || customer.id == '' || customer.id == null}">
	    			<div id="customerInformation">
						<g:if test="${reservationType == null || reservationType == 'null' || reservationType == 'reservation'}">
							<g:render template="/common/member/editCustomerSection" bean="${customer}"/>
						</g:if>
						<g:else>
							<g:render template="/common/member/editCustomerQuotationSection" bean="${customer}"/>
						</g:else>
					</div>
	    		</g:if>
	    		<g:else>
	    			<g:hiddenField name="customerId" value="${customer.id}" />
	    		    <g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
	    			<g:render template="/common/member/viewSection" bean="${customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
	    		</g:else>
	    		
	    		<br/>
	    		<g:render template="/common/travel/editSectionWithSelectionType" bean="${travel}" var="travel" model='["reservationType":"${reservationType}"]'/>
	    		
	    		<p class="boutons">
		    		<g:submitButton class="submit" name="create" value="${message(code:'common.button.submit')}" />
		    		
		    		<g:if test="${customer == null || customer.id == '' || customer.id == null}">
						<g:link controller="administrator" action="initChooseCustomerType" title="Reservation to price"><g:message code="common.button.back" /></g:link>
					</g:if>
					<g:else>
						<g:link controller="administrator" action="backMember"><g:message code="common.button.back" /></g:link>
					</g:else>
	    		</p>
	    	</g:form>
    	</div>
    </body>
</html>