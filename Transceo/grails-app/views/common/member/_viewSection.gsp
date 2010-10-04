<fieldset>
	<legend>${legend}</legend>
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
			<g:message code="code" /> :
	    	${customer.code}
	    </p>
	</g:if>
	<p>    		
		<g:message code="firstName" /> :
	    ${customer.firstName}
	</p>
	<p>
	    <g:message code="lastName" /> :
	    ${customer.lastName}
	</p>
	<p>
	    <g:message code="firm" /> :
	    ${customer.firm}
	</p>
	<p>
	<g:message code="phoneNumber" /> :
	    ${customer.phoneNumber}
	</p>
	<g:if test="${customer.class.name != com.transceo.Customer.class.name}">
		<p>
		    <g:message code="eMail" /> :
		    ${customer.eMail}
		</p>
	</g:if>
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
		    <g:message code="adresse" /> :
		    ${customer.adresse}
		</p>
		<p>
		    <g:message code="city" /> :
		    ${customer.city}
		</p>
		<p>
		    <g:message code="postal" /> :
		    ${customer.postal}
		</p>
		<p>
		    <g:message code="country" /> :
		    ${customer.country}
		</p>
	</g:if>
	<g:if test="${editAble == true}">	
		<g:link action="initUpdateCustomerInformation" id="${member.id}"><g:message code="label.common.button.edit" /></g:link>
	</g:if>
	<g:if test="${session[com.transceo.SessionConstant.USER.name()] != null}">
		<g:link controller="member" action="initChangePassword"><g:message code="label.common.button.change.password" /></g:link>
	</g:if>
</fieldset>