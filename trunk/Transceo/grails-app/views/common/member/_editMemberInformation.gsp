<g:if test="${customer != null}">
	<g:set var="id" value="${customer.id}"></g:set>
	<g:set var="firstName" value="${customer.firstName}"></g:set>
	<g:set var="lastName" value="${customer.lastName}"></g:set>
	<g:set var="firm" value="${customer.firm}"></g:set>
	<g:set var="phoneNumber" value="${customer.phoneNumber}"></g:set>
	<g:set var="eMail" value="${customer.eMail}"></g:set>
	<g:set var="adresse" value="${customer.adresse}"></g:set>
	<g:set var="city" value="${customer.city}"></g:set>
	<g:set var="postal" value="${customer.postal}"></g:set>
	<g:set var="country" value="${customer.country}"></g:set>
	<g:set var="firm" value="${customer.firm}"></g:set>
</g:if>
<g:else>
	<g:set var="id" value=""></g:set>
	<g:set var="firstName" value=""></g:set>
	<g:set var="lastName" value=""></g:set>
	<g:set var="firm" value=""></g:set>
	<g:set var="phoneNumber" value=""></g:set>
	<g:set var="eMail" value=""></g:set>
	<g:set var="adresse" value=""></g:set>
	<g:set var="city" value=""></g:set>
	<g:set var="postal" value=""></g:set>
	<g:set var="country" value=""></g:set>
	<g:set var="firm" value=""></g:set>
</g:else>

<g:hiddenField name="id" value="${id}" />
<ul>
	<li>
		<label><g:message code="label.member.firstName" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="firstName" value="${firstName}" />
	</li>

	<li>
		<label><g:message code="label.member.lastName" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="lastName" value="${lastName}" />
	</li>
	
	<li>
		<label><g:message code="label.member.firm" /></label>
		<input type="text" class="text" name="firm" value="${firm}"  />
	</li>
	<li>
		<label><g:message code="label.member.phone" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="phoneNumber" value="${phoneNumber}" />
	</li>
	<li>
		<label><g:message code="label.member.mail" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="eMail" value="${eMail}" />
	</li>
	
	<li>
		<label><g:message code="label.member.adresse" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="adresse" value="${adresse}" />
	</li>
	<li>
		<label><g:message code="label.member.postal" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="postal" value="${postal}" size="5"/>
	</li>
	<li>
		<label><g:message code="label.member.city" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:textField class="text" name="city" value="${city}"/>
	</li>
	<li>
		<g:set var="label" value="${message(code:'label.common.country.select')}" />
		<label><g:message code="label.member.country" /> <strong><g:message code="label.common.required" /></strong></label> 
		<g:select name="country" 
			from="${com.transceo.CountryCode.values()}" 
			value="${country}" 
			valueMessagePrefix="label.country" 
		   	noSelection='["":"${label}"]'
		/>
	</li>
</ul>
