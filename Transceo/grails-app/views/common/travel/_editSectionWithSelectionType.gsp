<jq:jquery>
	$(function() {
	    $("#travelDate").datepicker({ dateFormat: 'dd/mm/yy' });
	});
</jq:jquery>

<fieldset>
	<legend>
		<g:message code="view.travel.section.travel.choose" />
		
		<g:if test="${reservationType == null || reservationType == 'null' || reservationType == 'reservation'}">
			<g:set var="selectReservationType" value="${Boolean.TRUE}" />
			<g:set var="selectQuoteType" value="${Boolean.FALSE}" />
		</g:if>
		<g:else>
			<g:set var="selectReservationType" value="${Boolean.FALSE}" />
			<g:set var="selectQuoteType" value="${Boolean.TRUE}" />
		</g:else>

		<g:if test="${customer == null || customer.id == '' || customer.id == null}">		
			<g:radio class="radio" name="reservationType" value="reservation" checked="${selectReservationType}"
				onchange="${remoteFunction(controller:'travel', action:'showFormForBook', update:'customerInformation')}"
			/>Réservation
			<g:radio class="radio" name="reservationType" value="quote" checked="${selectQuoteType}"
				onchange="${remoteFunction(controller:'travel', action:'showFormForQuotation', update:'customerInformation')}" 
			/>Demande de devis
		</g:if>
		<g:else>
			<g:radio class="radio" name="reservationType" value="reservation" checked="${selectReservationType}"
			/>Réservation
			<g:radio class="radio" name="reservationType" value="quote" checked="${selectQuoteType}"
			/>Demande de devis
		</g:else>
	</legend>
   	<g:hasErrors bean="${travel}">
		<div class="erreur_message">
			<g:renderErrors bean="${travel}" />
		</div>
	</g:hasErrors>

	<g:if test="${travel != null}">
		<g:set var="travelDate" value="${travel.travelDate}" />
		<g:set var="travelHour" value="${travel.travelHour}" />
		<g:set var="travelMinute" value="${travel.travelMinute}" />		
		<g:set var="numberOfPersonne" value="${travel.numberOfPersonne}" />
		<g:set var="comment" value="${travel.comment}" />
	</g:if>
	<g:else>
		<g:set var="travelHour" value="" />
		<g:set var="travelMinute" value="" />
		<g:set var="numberOfPersonne" value="" />
		<g:set var="comment" value="" />
	</g:else>

	<ul>
		<li>
			<label><g:message code="travel.date" /> <strong><g:message code="common.required" /></strong></label>
			<input type="text" class="date" size="10" id="travelDate" name="date" value="<g:formatDate format="dd/MM/yyyy" date="${travelDate}"/>"/>
		</li>
		<li>
			<label for="info_telephone"><g:message code="travel.time" /> <strong><g:message code="common.required" /></strong></label>			
			<g:select name="travelHour" from="${0..23}" value="${travelHour}" noSelection="['':'HH']"/> :
			<g:select name="travelMinute" from="${0..59}" value="${travelMinute}" noSelection="['':'MM']"/>
		</li>
		<li>
			<label><g:message code="travel.personne.number" /></label>
			<g:select name="numberOfPersonne" from="${1..100}" value="${numberOfPersonne}"/>
		</li>
		<li>
			<label><g:message code="travel.comment" /></label>
			<g:textArea name="comment" value="${comment}" rows="4" cols="40" class="no_barre"/>
		</li>
	</ul>
	
	<br/>

	<table width="100%">
		<tr>
			<td valign="top">
				<g:set var="legendDepart" value="${message(code:'view.travel.section.travel.depart')}" />
				<g:render template="/common/travel/editAdresseSection" 
					bean="${depart}" 
					var="adresse"  
					model='["beanName":"depart", "legend":"${legendDepart}", "adrZoneID":"adrZone1", "locationId":"${locationDepartId}"]'
				/>
			</td>
			<td valign="top">
				<g:set var="legendDestination" value="${message(code:'view.travel.section.travel.destination')}" />
				<g:render template="/common/travel/editAdresseSection" 
					bean="${destination}" 
					var="adresse"  
					model='["beanName":"destination", "legend":"${legendDestination}", "adrZoneID":"adrZone2", "locationId":"${locationDestId}"]'
				/>
			</td>
		</tr>
	</table>
</fieldset>