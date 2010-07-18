<fieldset>
	<legend>${legend}</legend>
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
			<g:message code="view.member.code" /> :
	    	${customer.code}
	    </p>
	</g:if>
	<p>    		
		<g:message code="view.member.firstName" /> :
	    ${customer.firstName}
	</p>
	<p>
	    <g:message code="view.member.lastName" /> :
	    ${customer.lastName}
	</p>
	<p>
	    <g:message code="view.member.firm" /> :
	    ${customer.firm}
	</p>
	<p>
	<g:message code="view.member.phoneNumber" /> :
	    ${customer.phoneNumber}
	</p>
	<g:if test="${customer.class.name != com.transceo.Customer.class.name}">
		<p>
		    <g:message code="view.member.eMail" /> :
		    ${customer.eMail}
		</p>
	</g:if>
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
		    <g:message code="view.member.adresse" /> :
		    ${customer.adresse}
		</p>
		<p>
		    <g:message code="view.member.city" /> :
		    ${customer.city}
		</p>
		<p>
		    <g:message code="view.member.postal" /> :
		    ${customer.postal}
		</p>
		<p>
		    <g:message code="view.member.country" /> :
		    ${customer.country}
		</p>
	</g:if>
	<g:if test="${editAble == true}">	
		<g:link action="initUpdateCustomerInformation" id="${member.id}"><g:message code="common.button.edit" /></g:link>
	</g:if>
	<g:if test="${session[com.transceo.SessionConstant.USER.name()] != null}">
		<g:link controller="member" action="initChangePassword"><g:message code="common.button.change.password" /></g:link>
	</g:if>
</fieldset>