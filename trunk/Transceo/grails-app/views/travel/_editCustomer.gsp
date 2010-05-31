<fieldset>
	<legend><g:message code="view.travel.section.customer" /></legend>
	<g:hasErrors bean="${customer}">
		<div class="errors">
			<g:renderErrors bean="${customer}" />
		</div>
	</g:hasErrors>		
	<p>
		<g:message code="subscribe.firstName" />
		<g:textField name="firstName" value="${fieldValue(bean:customer,field:'firstName')}"/>
	</p>
	<p>
		<g:message code="subscribe.lastName" />
		<g:textField name="lastName" value="${fieldValue(bean:customer,field:'lastName')}"/>
	</p>
	<p>
		<g:message code="subscribe.phoneNumber" />
		<g:textField name="phoneNumber" value="${fieldValue(bean:customer,field:'phoneNumber')}"/>
	</p>
	<p>
		<g:message code="subscribe.adresse" />
		<g:textField name="adresse" value="${fieldValue(bean:customer,field:'adresse')}"/>
	</p>
	<p>
		<g:message code="subscribe.city" />
		<g:textField name="city" value="${fieldValue(bean:customer,field:'city')}"/>
	</p>
	<p>
		<g:message code="subscribe.postal" />
		<g:textField name="postal" value="${fieldValue(bean:customer,field:'postal')}"/>
	</p>
	<p>
		<g:message code="subscribe.country" />
		<g:textField name="country" value="${fieldValue(bean:customer,field:'country')}"/>
	</p>
</fieldset>