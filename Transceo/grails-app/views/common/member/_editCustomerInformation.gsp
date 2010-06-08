<g:if test="${customer != null}">
	<g:set var="id" value="${customer.id}"></g:set>
	<g:set var="firstName" value="${customer.firstName}"></g:set>
	<g:set var="lastName" value="${customer.lastName}"></g:set>
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
	<g:set var="phoneNumber" value=""></g:set>
	<g:set var="eMail" value=""></g:set>
	<g:set var="adresse" value=""></g:set>
	<g:set var="city" value=""></g:set>
	<g:set var="postal" value=""></g:set>
	<g:set var="country" value=""></g:set>
	<g:set var="firm" value=""></g:set>
</g:else>

<g:hiddenField name="id" value="${id}" />
<p>
	<g:message code="subscribe.firstName" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="firstName" value="${firstName}" />
</p>
<p>
	<g:message code="subscribe.lastName" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="lastName" value="${lastName}" />
</p>
<p>
	<g:message code="subscribe.firm" />
	<input type="text" class="text" name="firm" value="${firm}"  />
</p>
<p>
	<g:message code="subscribe.phoneNumber" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="phoneNumber" value="${phoneNumber}" />
</p>
<p>
	<g:message code="subscribe.eMail" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="eMail" value="${eMail}" />
</p>
<p>
	<g:message code="subscribe.adresse" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="adresse" value="${adresse}" />
</p>
<p>
	<g:message code="subscribe.postal" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="postal" value="${postal}" size="5"/>
	<g:message code="subscribe.city" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="city" value="${city}"/>
</p>
<p>
	<g:message code="subscribe.country" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="country" value="${country}" />
</p>