<fieldset>
	<legend><g:message code="view.travel.section.customer" /></legend>
	
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
			<g:message code="view.member.code" />:
	    	${customer.code}
	    </p>
	</g:if>
	<p>    		
		<g:message code="view.member.firstName" />:
	    ${customer.firstName}
	</p>
	<p>
	    <g:message code="view.member.lastName" />:
	    ${customer.lastName}
	</p>
	<p>
	<g:message code="view.member.phoneNumber" />:
	    ${customer.phoneNumber}
	</p>
	<p>
	    <g:message code="view.member.eMail" />:
	    ${customer.eMail}
	</p>
	<p>
	    <g:message code="view.member.adresse" />:
	    ${customer.adresse}
	</p>
	<p>
	    <g:message code="view.member.city" />:
	    ${customer.city}
	</p>
	<p>
	    <g:message code="view.member.postal" />:
	    ${customer.postal}
	</p>
	<p>
	    <g:message code="view.member.country" />:
	    ${customer.country}
	</p>
	
</fieldset>