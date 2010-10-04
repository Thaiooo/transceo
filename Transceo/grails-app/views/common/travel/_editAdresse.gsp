<g:if test="${adresse != null}">
	<g:set var="adresseName" value="${adresse.adresse}"></g:set>
	<g:set var="city" value="${adresse.city}"></g:set>
	<g:set var="postal" value="${adresse.postal}"></g:set>
	<g:set var="country" value="${adresse.country}"></g:set>
</g:if>
<g:else>
	<g:set var="adresseName" value=""></g:set>
	<g:set var="city" value=""></g:set>
	<g:set var="postal" value=""></g:set>
	<g:set var="country" value=""></g:set>
</g:else>

<g:if test="${adresse != null && adresse.class.name == 'com.transceo.Location' && (fill == false || fill == null)}" >
	<g:message code="message.additional.info" />
</g:if>
<g:else>
	
	<g:hasErrors bean="${adresse}">
		<div class="erreur_message">
			<g:renderErrors bean="${adresse}" />
		</div>
	</g:hasErrors>	
	<ul>
		<li>
			<label class="adresse"><g:message code="label.travel.adresse" /> <strong><g:message code="label.common.required" /></strong></label>
			<g:textField class="adresse" id="${beanName}_adresse" name="${beanName}.adresse" value="${adresseName}"/>
		</li>
		<li>
			<label class="adresse"><g:message code="label.travel.postal" /> <strong><g:message code="label.common.required" /></strong></label>
		    <g:textField class="postal" id="${beanName}_postal" name="${beanName}.postal" value="${postal}" size="5" maxize="5"/>
		</li>
		<li>				
		    <label class="adresse"><g:message code="label.travel.city" /> <strong><g:message code="label.common.required" /></strong></label>
		    <g:textField class="city" id="${beanName}_city" name="${beanName}.city" value="${city}"/>
		</li>
		<li>
			<label class="adresse"><g:message code="label.travel.country" /> <strong><g:message code="label.common.required" /></strong></label>
		    <g:set var="label" value="${message(code:'label.common.country.select')}" />
	   		<g:select class="country" id="${beanName}_country" 
	   			name="${beanName}.country" 
	   			from="${com.transceo.CountryCode.values()}" 
	   			value="${country}" 
	   			valueMessagePrefix="label.country" 
	   			noSelection='["":"${label}"]'
		    />
		</li>
	</ul>
</g:else>