<div id="view_info">
	<p>
		<strong><g:message code="miles" /></strong> 
		<label>${member.miles}</label>
	</p>
	<p>
		<strong><g:message code="miles.friend" /></strong> 
		<label>${member.friendMiles}</label>
	</p>
	<p>
		<strong><g:message code="miles.total" /></strong> 
		<label>${member.miles + member.friendMiles}</label>
	</p>
	<g:if test="${editAble == true}">	
		<g:link action="initUpdateMile" id="${member.id}"><g:message code="common.button.edit" /></g:link>
	</g:if>
</div>