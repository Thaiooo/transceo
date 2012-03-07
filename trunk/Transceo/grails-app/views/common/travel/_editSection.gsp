<jq:jquery>
	$(function() {
	    $("#travelDate").datepicker({ dateFormat: 'dd/mm/yy' });
	});
</jq:jquery>

<fieldset>
	<legend><g:message code="label.travel.section.travel" /></legend>
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

	<p>
		<g:message code="label.travel.date" /> <strong><g:message code="label.common.required" /></strong>
		<input type="text" class="text" size="10" id="travelDate" name="date" value="<g:formatDate format="dd/MM/yyyy" date="${travelDate}"/>"
			style="z-index: 10; position: relative;"
		/>
		<label for="info_telephone"><g:message code="label.travel.time" /> <strong><g:message code="label.common.required" /></strong></label>			
		<g:select name="travelHour" from="${0..23}" value="${travelHour}" noSelection="['':'HH']"/> :
		<g:select name="travelMinute" from="${0..59}" value="${travelMinute}" noSelection="['':'MM']"/>
	</p>
	<p>
		<g:message code="label.travel.number.personne" />
		<g:select name="numberOfPersonne" from="${1..100}" value="${numberOfPersonne}"/>
	</p>
	<p>
		<g:message code="label.travel.comment" />
		<g:textArea name="comment" value="${comment}" rows="4" cols="40" class="no_barre"/>
	</p>
	<br/>

	<table width="100%">
		<tr>
			<td valign="top">
				<g:set var="legendDepart" value="${message(code:'label.travel.section.travel.depart')}" />
				<g:render template="/common/travel/editAdresseSection" 
					bean="${depart}" 
					var="adresse"  
					model='["beanName":"depart", "legend":"${legendDepart}", "adrZoneID":"adrZone1", "locationId":"${locationDepartId}"]'
				/>
			</td>
			<td valign="top">
				<g:set var="legendDestination" value="${message(code:'label.travel.section.travel.destination')}" />
				<g:render template="/common/travel/editAdresseSection" 
					bean="${destination}" 
					var="adresse"  
					model='["beanName":"destination", "legend":"${legendDestination}", "adrZoneID":"adrZone2", "locationId":"${locationDestId}"]'
				/>
			</td>
		</tr>
	</table>
</fieldset>