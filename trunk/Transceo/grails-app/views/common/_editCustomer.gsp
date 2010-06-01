<fieldset>
	<legend><g:message code="view.travel.section.customer" /></legend>
	<g:hasErrors bean="${customer}">
		<div class="erreur_message">
			<g:renderErrors bean="${customer}" />
		</div>
	</g:hasErrors>		
	<p>
		<g:message code="subscribe.firstName" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="firstName" value="${fieldValue(bean:customer,field:'firstName')}" />
	</p>
	<p>
		<g:message code="subscribe.lastName" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="firstName" value="${fieldValue(bean:customer,field:'lastName')}" />
	</p>
	<p>
		<g:message code="subscribe.firm" />
		<input type="text" class="text" name="organisation" value=""  />
	</p>
	<p>
		<g:message code="subscribe.phoneNumber" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="phoneNumber" value="${fieldValue(bean:customer,field:'phoneNumber')}" />
	</p>
	<p>
		<g:message code="subscribe.adresse" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="adresse" value="${fieldValue(bean:customer,field:'adresse')}" />
	</p>
	<p>
		<g:message code="subscribe.postal" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="postal" value="${fieldValue(bean:customer,field:'postal')}" size="5"/>
		<g:message code="subscribe.city" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="city" value="${fieldValue(bean:customer,field:'city')}"/>
	</p>
	<p>
		<g:message code="subscribe.country" /> <strong><g:message code="common.required" /></strong>
		<g:textField class="text" name="country" value="${fieldValue(bean:customer,field:'country')}" />
	</p>
</fieldset>