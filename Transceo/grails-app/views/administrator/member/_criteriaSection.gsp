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
		<legend><g:message code="search.member.legend" /></legend>
		<p>
		<g:message code="search.member.code" />
		<g:textField name="code" value="${code}" size="4"/>
		<g:message code="search.member.firstName" />
		<g:textField name="firstName" value="${firstName}"/>
		<g:message code="search.member.lastName" />
		<g:textField name="lastName" value="${lastName}"/>
		</p>
		<p>
		<g:message code="search.member.phone" />
		<g:textField name="phoneNumber" value="${phoneNumber}"/>
		<g:message code="search.member.mail" />
		<g:textField name="eMail" value="${eMail}"/>
		</p>
		<p>
		<g:message code="search.member.adresse" />
		<g:textField name="adresse" value="${adresse}"/>
		<g:message code="search.member.postal" />
		<g:textField name="postal" value="${postal}" size="5"/>
		<g:message code="search.member.city" />
		<g:textField name="city" value="${city}"/>
		<g:message code="search.member.country" />
		<g:textField name="country" value="${country}"/>
		</p>
		<p>
		<g:submitButton name="search" value="${message(code:'common.button.search')}" />
		</p>
	</fieldset>
</form>