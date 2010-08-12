<%@page import="com.transceo.TravelStatus"%>

<fieldset>
	<legend><g:message code="view.travel.section.action" /></legend>
    <g:if test="${travel.status == TravelStatus.BOOK_ASK}">
		<g:if test="${flash.message != null}">
	    	<div class="erreur_message">
	    		<ul>
					<li>
						<g:message code="${flash.message}" ></g:message>
					</li>
				</ul>
			</div>
	   	</g:if>
    
    	<g:form controller="administrator" method="post" >
	    	<g:hiddenField name="id" value="${travel.id}" />
	    	<p>
	    	<g:message code="travel.price" /> <g:textField name="price" value="${price}"/>
			</p>
			
			<g:set var="legendDestination" value="${message(code:'view.travel.section.travel.destination')}" />
	    	<g:render template="/common/travel/editAdresseSection"
				bean="${destination}"
				var="adresse"
				model='["beanName":"destination", "legend":"${legendDestination}", "adrZoneID":"adrZone1", "locationId":"${locationDestId}"]'
			/>
			<g:actionSubmit value="Validate" action="closeReservation" />
			<g:actionSubmit value="Cancel" action="cancelTravel" />
	    </g:form>
    </g:if>
    <g:else>
		<g:form controller="administrator" method="post" >
	    	<g:hiddenField name="id" value="${travel.id}" />
	    	<g:message code="travel.price" /> : ${travel.price}
			<g:actionSubmit value="Validate" action="closeTravel" />
			<g:actionSubmit value="Cancel" action="cancelTravel" />
	    </g:form>
    </g:else>
</fieldset>