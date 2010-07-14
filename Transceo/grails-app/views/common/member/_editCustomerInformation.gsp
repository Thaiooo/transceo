<g:if test="${customer != null}">
	<g:set var="id" value="${customer.id}"></g:set>
	<g:set var="firstName" value="${customer.firstName}"></g:set>
	<g:set var="lastName" value="${customer.lastName}"></g:set>
	<g:set var="phoneNumber" value="${customer.phoneNumber}"></g:set>
	<g:set var="firm" value="${customer.firm}"></g:set>
</g:if>
<g:else>
	<g:set var="id" value=""></g:set>
	<g:set var="firstName" value=""></g:set>
	<g:set var="lastName" value=""></g:set>
	<g:set var="phoneNumber" value=""></g:set>
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
	<g:message code="subscribe.phoneNumber" /> <strong><g:message code="common.required" />
	<g:textField class="text" name="phoneNumber" value="${phoneNumber}" />
</p>