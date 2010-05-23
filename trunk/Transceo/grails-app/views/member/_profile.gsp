<p>    		
	<g:message code="subscribe.firstName" />:
    ${fieldValue(bean:member,field:'firstName')}
</p>
<p>
    <g:message code="subscribe.lastName" />:
    ${fieldValue(bean:member,field:'lastName')}
</p>
<p>
<g:message code="subscribe.phoneNumber" />:
    ${fieldValue(bean:member,field:'phoneNumber')}
</p>
<p>
    <g:message code="subscribe.eMail" />:
    ${fieldValue(bean:member,field:'eMail')}
</p>
<p>
    <g:message code="subscribe.adresse" />:
    ${fieldValue(bean:member,field:'adresse')}
</p>
<p>
    <g:message code="subscribe.city" />:
    ${fieldValue(bean:member,field:'city')}
</p>
<p>
    <g:message code="subscribe.postal" />:
    ${fieldValue(bean:member,field:'postal')}
</p>
<p>
    <g:message code="subscribe.country" />:
    ${fieldValue(bean:member,field:'country')}
</p>
<g:link controller="member" action="initUpdate" id="${fieldValue(bean:member,field:'id')}">Update</g:link>