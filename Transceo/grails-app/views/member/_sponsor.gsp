<fieldset>
	<legend><g:message code="view.member.section.sponsor" /></legend>
	<p>
		<g:if test="${member.sponsor != null}">${member.sponsor.firstName} ${member.sponsor.lastName}</g:if>
		<g:else><g:message code="message.no.sponsor" /></g:else>
	</p>
</fieldset>