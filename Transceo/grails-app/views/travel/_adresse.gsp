<p>
	<g:message code="travel.adresse" />
	<g:textField name="${beanName}.adresse" value="${fieldValue(bean:adresse,field:'adresse')}"/>
</p>
<p>
	<g:message code="travel.city" />
    <g:textField id="${beanName}City" name="${beanName}.city" value="${fieldValue(bean:adresse,field:'city')}"/>
</p>
<p>
	<g:message code="travel.postal" />
    <g:textField name="${beanName}.postal" value="${fieldValue(bean:adresse,field:'postal')}"/>
</p>
<p>
	<g:message code="travel.country" />
    <g:textField name="${beanName}.country" value="${fieldValue(bean:adresse,field:'country')}"/>
</p>