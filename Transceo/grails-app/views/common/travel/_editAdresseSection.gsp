<g:if test="${adresse != null}">
	<g:set var="adresseName" value="${adresse.adresse}"></g:set>
	<g:set var="city" value="${adresse.city}"></g:set>
	<g:set var="postal" value="${adresse.postal}"></g:set>
	<g:set var="country" value="${adresse.country}"></g:set>
</g:if>
<g:else>
	<g:set var="adresse" value=""></g:set>
	<g:set var="city" value=""></g:set>
	<g:set var="postal" value=""></g:set>
	<g:set var="country" value=""></g:set>
</g:else>

<fieldset>
	<legend>${legend}</legend>
	<g:hasErrors bean="${depart}">
		<div class="erreur_message">
			<g:renderErrors bean="${adresse}" />
		</div>
	</g:hasErrors>	
	<p>
		<g:message code="travel.adresse" /> <strong><g:message code="common.required" /></strong>
		<g:textField name="${beanName}.adresse" value="${adresseName}"/>
	</p>
	<p>
		<g:message code="travel.postal" /> <strong><g:message code="common.required" /></strong>
	    <g:textField name="${beanName}.postal" value="${postal}" size="5" maxize="5"/>
	    <g:message code="travel.city" /> <strong><g:message code="common.required" /></strong>
	    <g:textField id="${beanName}City" name="${beanName}.city" value="${city}"/>
	</p>
	<p>
		<g:message code="travel.country" /> <strong><g:message code="common.required" /></strong>
	    <g:textField name="${beanName}.country" value="${country}"/>
	</p>

</fieldset>