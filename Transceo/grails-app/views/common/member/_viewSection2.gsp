	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
			<g:message code="label.member.code" /> :
	    	${customer.code}
	    </p>
	</g:if>
	<p>    		
		<g:message code="label.member.firstName" /> :
	    ${customer.firstName}
	</p>
	<p>
	    <g:message code="label.member.lastName" /> :
	    ${customer.lastName}
	</p>
	<p>
	    <g:message code="label.member.firm" /> :
	    ${customer.firm}
	</p>
	<p>
	<g:message code="label.member.phone" /> :
	    ${customer.phoneNumber}
	</p>
	<g:if test="${customer.class.name != com.transceo.Customer.class.name}">
		<p>
		    <g:message code="label.member.mail" /> :
		    ${customer.eMail}
		</p>
	</g:if>
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
		    <g:message code="label.member.adresse" /> :
		    ${customer.adresse}
		</p>
		<p>
		    <g:message code="label.member.city" /> :
		    ${customer.city}
		</p>
		<p>
		    <g:message code="label.member.postal" /> :
		    ${customer.postal}
		</p>
		<p>
		    <g:message code="label.member.country" /> :
		    <g:message code="label.country.${customer.country}" />
		</p>
	</g:if>
	
	<div class="boutons">
		<g:if test="${editAble == true}">	
			<g:link class="editCustomer" action="initUpdateCustomerInformation" id="${member.id}"><g:message code="label.common.button.edit" /></g:link>
		</g:if>
		<g:if test="${session[com.transceo.SessionConstant.USER.name()] != null}">
			<g:link class="changePassword" controller="member" action="initChangePassword"><g:message code="label.common.button.change.password" /></g:link>
		</g:if>
	</div>