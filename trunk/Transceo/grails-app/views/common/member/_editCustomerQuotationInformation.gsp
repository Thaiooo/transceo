<g:render template="/common/member/editCustomerInformation" bean="${customer}" var="customer"/>

<g:if test="${customer != null}">
	<g:set var="eMail" value="${customer.eMail}"></g:set>
</g:if>
<g:else>
	<g:set var="eMail" value=""></g:set>
</g:else>
<p>
	<g:message code="subscribe.eMail" /> <strong><g:message code="common.required" /></strong>
	<g:textField class="text" name="eMail" value="${eMail}" />
</p>