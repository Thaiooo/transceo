<fieldset>
	<legend><g:message code="label.travel.section.action" /></legend>
	<g:form controller="administrator" method="post" >
  		<g:hiddenField name="id" value="${travel.id}" />
  		<g:message code="label.travel.price" /> ${travel.price} <g:message code="label.travel.price.devise" />
		<br/>
   		<g:actionSubmit value="${message(code:'label.common.button.confirm')}" action="confirmReservation" /> 
   		<g:actionSubmit value="${message(code:'label.common.button.cancel')}" action="cancelReservation" />
   	</g:form>
</fieldset>