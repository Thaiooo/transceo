<fieldset>
	<legend><g:message code="view.member.section.profile" /></legend>
	<p>    		
		<g:message code="view.member.code" />:
	    ${fieldValue(bean:member,field:'code')}
	</p>
	<p>    		
		<g:message code="view.member.firstName" />:
	    ${fieldValue(bean:member,field:'firstName')}
	</p>
	<p>
	    <g:message code="view.member.lastName" />:
	    ${fieldValue(bean:member,field:'lastName')}
	</p>
	<p>
	<g:message code="view.member.phoneNumber" />:
	    ${fieldValue(bean:member,field:'phoneNumber')}
	</p>
	<p>
	    <g:message code="view.member.eMail" />:
	    ${fieldValue(bean:member,field:'eMail')}
	</p>
	<p>
	    <g:message code="view.member.adresse" />:
	    ${fieldValue(bean:member,field:'adresse')}
	</p>
	<p>
	    <g:message code="view.member.city" />:
	    ${fieldValue(bean:member,field:'city')}
	</p>
	<p>
	    <g:message code="view.member.postal" />:
	    ${fieldValue(bean:member,field:'postal')}
	</p>
	<p>
	    <g:message code="view.member.country" />:
	    ${fieldValue(bean:member,field:'country')}
	</p>
	<g:link controller="member" action="initUpdate" id="${fieldValue(bean:member,field:'id')}"><g:message code="common.button.edit" /></g:link>
</fieldset>