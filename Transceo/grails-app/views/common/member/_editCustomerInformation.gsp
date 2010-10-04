<g:if test="${customer != null}">
	<g:set var="id" value="${customer.id}"></g:set>
	<g:set var="firstName" value="${customer.firstName}"></g:set>
	<g:set var="lastName" value="${customer.lastName}"></g:set>
	<g:set var="firm" value="${customer.firm}"></g:set>
	<g:set var="phoneNumber" value="${customer.phoneNumber}"></g:set>
</g:if>
<g:else>
	<g:set var="id" value=""></g:set>
	<g:set var="firstName" value=""></g:set>
	<g:set var="lastName" value=""></g:set>
	<g:set var="firm" value=""></g:set>
	<g:set var="phoneNumber" value=""></g:set>
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
</ul>