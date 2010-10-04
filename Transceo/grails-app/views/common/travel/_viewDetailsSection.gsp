<fieldset>
	<legend><g:message code="label.travel.section.travel" /></legend>
	<p>
    	<g:message code="label.travel.creation.date" />: <g:formatDate format="${message(code:'label.common.date.time.format')}" date="${travel.creationDate}"/>
	</p>
	<p>
		<g:message code="label.travel.traveldate" />: <g:formatDate format="${message(code:'label.common.date.time.format')}" date="${travel.travelDate}"/>
	</p>
	<p>
		<g:message code="label.travel.status" />: <g:message code="label.reservation.status.${travel.status}" /> 
	</p>
	<p>
		<g:message code="label.travel.depart" />: 
		<span id="depart">${travel.depart.adresse}, ${travel.depart.postal} ${travel.depart.city}, <g:message code="label.country.${travel.depart.country}" /></span>
	</p>
	<g:if test="${travel.destination != null}">
		<p>
			<g:message code="label.travel.destination" />: 
			<span id="destination">${travel.destination.adresse}, ${travel.destination.postal} ${travel.destination.city}, <g:message code="label.country.${travel.destination.country}" /></span>
		</p>
	</g:if>
	<p>
		<g:message code="label.travel.number.personne" />: ${travel.numberOfPersonne}
	</p>
	<p>
		<g:message code="label.travel.comment" />: ${travel.comment}
	</p>
</fieldset>