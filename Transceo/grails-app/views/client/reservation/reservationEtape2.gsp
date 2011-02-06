<html>
    <head>
        <title>
        	<g:if test="${reservationType != com.transceo.ReservationType.BOOKING.name()}">
				<g:message code="title.devis.create" />
			</g:if>
			<g:else>
				<g:message code="title.reservation.create" />
			</g:else>
        </title>
		<meta name="layout" content="client2" />
    </head>
    <body>
    	<ul id="etape">
			<li>Etape 1: Information trajet</li>
			<li>></li>
			<li id="current">Etape 2: Information client</li>
		</ul>
		
		<div id="formulaire_reservation">
			<g:form controller="travel" method="post" >
				<g:if test="${customer == null || customer.id == '' || customer.id == null}">
					<div id="customerInformation">
						<g:if test="${reservationType != com.transceo.ReservationType.BOOKING.name()}">
							<g:render template="/common/member/editCustomerQuotationSection2" bean="${customer}"/>
						</g:if>
						<g:else>
							<g:render template="/common/member/editCustomerSection2" bean="${customer}"/>
						</g:else>
					</div>
				</g:if>
				<g:else>
					<g:set var="legend" value="${message(code:'label.travel.section.customer')}" />
    				<g:render template="/common/member/viewResumeSection2" bean="${customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
				</g:else>
				<p class="boutons">
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.back')}" action="initBookEtape1" /> 
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.submit')}" action="bookEtape2" /> 
				</p>
			</g:form>
		</div>
    </body>
</html>