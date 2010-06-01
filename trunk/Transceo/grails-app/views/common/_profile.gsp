<fieldset>
	<legend><g:message code="view.member.section.profile" /></legend>
	<p>    		
		<g:message code="view.member.code" />:
	    ${member.code}
	</p>
	<p>    		
		<g:message code="view.member.firstName" />:
	    ${member.firstName}
	</p>
	<p>
	    <g:message code="view.member.lastName" />:
	    ${member.lastName}
	</p>
	<p>
	<g:message code="view.member.phoneNumber" />:
	    ${member.phoneNumber}
	</p>
	<p>
	    <g:message code="view.member.eMail" />:
	    ${member.eMail}
	</p>
	<p>
	    <g:message code="view.member.adresse" />:
	    ${member.adresse}
	</p>
	<p>
	    <g:message code="view.member.city" />:
	    ${member.city}
	</p>
	<p>
	    <g:message code="view.member.postal" />:
	    ${member.postal}
	</p>
	<p>
	    <g:message code="view.member.country" />:
	    ${member.country}
	</p>
	<g:link controller="member" action="initUpdate" id="${member.id}"><g:message code="common.button.edit" /></g:link>
</fieldset>