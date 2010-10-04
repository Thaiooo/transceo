<form controller="administrator" action="searchMember" method="post" >

	<g:if test="${criteria != null}">
		<g:set var="code" value="${criteria.code}"/>
		<g:set var="firstName" value="${criteria.firstName}"/>
		<g:set var="lastName" value="${criteria.lastName}"/>
		<g:set var="phoneNumber" value="${criteria.phoneNumber}"/>
		<g:set var="eMail" value="${criteria.eMail}"/>
		<g:set var="adresse" value="${criteria.adresse}"/>
		<g:set var="postal" value="${criteria.postal}"/>
		<g:set var="city" value="${criteria.city}"/>
		<g:set var="country" value="${criteria.country}"/>
	</g:if>

	<fieldset>
		<legend><g:message code="label.member.legend" /></legend>
		<p>
		<g:message code="label.member.code" />
		<g:textField name="code" value="${code}" size="4"/>
		<g:message code="label.member.firstName" />
		<g:textField name="firstName" value="${firstName}"/>
		<g:message code="label.member.lastName" />
		<g:textField name="lastName" value="${lastName}"/>
		</p>
		<p>
		<g:message code="label.member.phone" />
		<g:textField name="phoneNumber" value="${phoneNumber}"/>
		<g:message code="label.member.mail" />
		<g:textField name="eMail" value="${eMail}"/>
		</p>
		<p>
		<g:message code="label.member.adresse" />
		<g:textField name="adresse" value="${adresse}"/>
		<g:message code="label.member.postal" />
		<g:textField name="postal" value="${postal}" size="5"/>
		<g:message code="label.member.city" />
		<g:textField name="city" value="${city}"/>
		<g:message code="label.member.country" />
		<g:textField name="country" value="${country}"/>
		</p>
		<p>
		<g:submitButton name="search" value="${message(code:'label.common.button.search')}" />
		</p>
	</fieldset>
</form>