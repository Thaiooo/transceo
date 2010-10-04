<g:render template="/common/member/editCustomerInformation" bean="${customer}" var="customer"/>

<g:if test="${customer != null}">
	<g:set var="eMail" value="${customer.eMail}"></g:set>
</g:if>
<g:else>
	<g:set var="eMail" value=""></g:set>
</g:else>

<ul>
	<li>
	<label><g:message code="label.member.mail" /> <strong><g:message code="label.common.required" /></strong></label>
	<g:textField class="text" name="eMail" value="${eMail}" />
	</li>
</ul>