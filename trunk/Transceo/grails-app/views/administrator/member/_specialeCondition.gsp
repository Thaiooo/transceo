Ici


<g:each status="i" in="${member.specialeConditions}" var="item">
	${item}
</g:each>

<p class="boutons">
	<g:link action="initAddSpecialCondition" id="${member.id}"><g:message code="common.button.add"/></g:link>
</p>