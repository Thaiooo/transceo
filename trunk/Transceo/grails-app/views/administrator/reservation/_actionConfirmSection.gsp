<fieldset>
	<legend><g:message code="travel.section.action" /></legend>
	<g:form controller="administrator" method="post" >
  		<g:hiddenField name="id" value="${travel.id}" />
  		<g:message code="travel.price" /> ${travel.price} <g:message code="travel.price.devise" />
		<br/>
   		<g:actionSubmit value="${message(code:'common.button.confirm')}" action="confirmReservation" /> 
   		<g:actionSubmit value="${message(code:'common.button.cancel')}" action="cancelReservation" />
   	</g:form>
</fieldset>