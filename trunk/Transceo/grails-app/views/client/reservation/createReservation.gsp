<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<div id="formulaire_reservation">
			<g:form controller="travel" method="post" >
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
					<g:set var="legend" value="${message(code:'travel.section.customer')}" />
    				<g:render template="/common/member/viewResumeSection" bean="${customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
				</g:else>
				
				<br/>
				<g:render template="/common/travel/editSectionWithSelectionType" bean="${travel}"/>
				<p class="boutons">
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.back')}" action="initReservation" /> 
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.submit')}" action="bookOrQuoteATravel" /> 
				</p>
			</g:form>
		</div>
    </body>
</html>