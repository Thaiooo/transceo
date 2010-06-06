<fieldset>
	<legend><g:message code="view.travel.section.action" /></legend>
	<g:if test="${flash.message != null}">
    	<div class="erreur_message">
	    	<ul>
				<li>
					<g:message code="${flash.message}" ></g:message>
				</li>
			</ul>
		</div>
    </g:if>
    
    <g:if test="${price == 'null'}">
		<g:set var="price" value=""></g:set>
	</g:if>
	<g:form controller="administrator" method="post" >
  		<g:hiddenField name="id" value="${travel.id}" />
  		<g:message code="travel.price" />
		<g:textField name="price"/> <g:message code="travel.price.devise" />
		<br/>
		<g:actionSubmit value="${message(code:'common.button.validate')}" action="validateReservation" />
		<g:actionSubmit value="${message(code:'common.button.validate.confirm')}" action="validateAndConfirmReservation" />
   		<g:actionSubmit value="${message(code:'common.button.cancel')}" action="cancelReservation" />
   	</g:form>
</fieldset>