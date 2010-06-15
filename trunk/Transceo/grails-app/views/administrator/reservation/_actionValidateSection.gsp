<fieldset>
	<legend><g:message code="view.travel.section.action" /></legend>
	
	<g:form controller="administrator" method="post" >
    	<g:hiddenField name="id" value="${travel.id}" />
    	Price: ${travel.price}
		<g:actionSubmit value="Validate" action="closeTravel" />
		<g:actionSubmit value="Cancel" action="cancelTravel" />
    </g:form>
    
</fieldset>