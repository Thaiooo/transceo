<fieldset>
	<legend><g:message code="view.member.section.mile" /></legend>
	<p><g:message code="view.member.miles" />: ${member.miles}</p>
	<p><g:message code="view.member.miles.friend" />: ${member.friendMiles}</p>
	<p><g:message code="view.member.miles.total" />: ${member.miles + member.friendMiles}</p>
	
	<g:link action="initUpdateMile" id="${member.id}"><g:message code="common.button.edit" /></g:link>
	
</fieldset>