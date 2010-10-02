<fieldset>
	<legend><g:message code="travel.section.travel" /></legend>
	<p>
    	<g:message code="travel.creation.date" />: <g:formatDate format="${message(code:'common.date.time.format')}" date="${travel.creationDate}"/>
	</p>
	<p>
		<g:message code="travel.traveldate" />: <g:formatDate format="${message(code:'common.date.time.format')}" date="${travel.travelDate}"/>
	</p>
	<p>
		<g:message code="travel.status" />: <g:message code="reservation.status.${travel.status}" /> 
	</p>
	<p>
		<g:message code="travel.depart" />: 
		<span id="depart">${travel.depart.adresse}, ${travel.depart.postal} ${travel.depart.city}, <g:message code="country.${travel.depart.country}" /></span>
	</p>
	<g:if test="${travel.destination != null}">
		<p>
			<g:message code="travel.destination" />: 
			<span id="destination">${travel.destination.adresse}, ${travel.destination.postal} ${travel.destination.city}, <g:message code="country.${travel.destination.country}" /></span>
		</p>
	</g:if>
	<p>
		<g:message code="travel.number.personne" />: ${travel.numberOfPersonne}
	</p>
	<p>
		<g:message code="travel.comment" />: ${travel.comment}
	</p>
</fieldset>