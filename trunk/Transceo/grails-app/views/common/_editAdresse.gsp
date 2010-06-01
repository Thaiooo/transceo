<p>
	<g:message code="travel.adresse" /> <strong><g:message code="common.required" /></strong>
	<g:textField name="${beanName}.adresse" value="${fieldValue(bean:adresse,field:'adresse')}"/>
</p>
<p>
	<g:message code="travel.city" /> <strong><g:message code="common.required" /></strong>
    <g:textField id="${beanName}City" name="${beanName}.city" value="${fieldValue(bean:adresse,field:'city')}"/>
</p>
<p>
	<g:message code="travel.postal" /> <strong><g:message code="common.required" /></strong>
    <g:textField name="${beanName}.postal" value="${fieldValue(bean:adresse,field:'postal')}"/>
</p>
<p>
	<g:message code="travel.country" /> <strong><g:message code="common.required" /></strong>
    <g:textField name="${beanName}.country" value="${fieldValue(bean:adresse,field:'country')}"/>
</p>