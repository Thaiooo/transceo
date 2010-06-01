<jq:jquery>
	$(function() {
	    $("#travelDate").datepicker({ dateFormat: 'dd/mm/yy' });
	});
</jq:jquery>

<fieldset>
	<legend><g:message code="view.travel.section.travel" /></legend>
   	<g:hasErrors bean="${travel}">
		<div class="erreur_message">
			<g:renderErrors bean="${travel}" />
		</div>
	</g:hasErrors>

	<g:if test="${travel != null}">
		<g:set var="handicap" value="${travel.handicap}" />
		<g:set var="travelDate" value="${travel.travelDate}" />
	</g:if>
	<g:else>
		<g:set var="handicap" value="false" />
	</g:else>

	<p>
		<g:message code="travel.date" /> <strong><g:message code="common.required" /></strong>
		<input type="text" class="text" size="10" id="travelDate" name="date" value="<g:formatDate format="dd/MM/yyyy" date="${travelDate}"/>"/>
		<label for="info_telephone"><g:message code="travel.time" /> <strong><g:message code="common.required" /></strong></label>			
		<g:select name="travelHour" from="${0..23}" value="${fieldValue(bean:travel,field:'travelHour')}" noSelection="['':'HH']"/> :
		<g:select name="travelMinute" from="${0..59}" value="${fieldValue(bean:travel,field:'travelMinute')}" noSelection="['':'MM']"/>
	</p>
	<p>
		<g:message code="travel.personne.number" />			
		<g:textField name="numberOfPersonne" class="text" value="${fieldValue(bean:travel,field:'numberOfPersonne')}" size="2"/>
	</p>
	<p>
		<g:message code="travel.personne.handicap" />			
		<g:checkBox name="handicap" value="${handicap}" checked="${handicap}"/>
	</p>
	<p>
		<g:message code="travel.comment" />
		<g:textArea name="comment" value="${fieldValue(bean:travel,field:'comment')}" rows="8" cols="30" class="no_barre"/>
	</p>
	<br/>

	<table width="100%">
		<tr>
			<td >
				<fieldset>
					<legend><g:message code="view.travel.section.travel.depart" /></legend>
					<g:hasErrors bean="${depart}">
						<div class="erreur_message">
							<g:renderErrors bean="${depart}" />
						</div>
					</g:hasErrors>
					<g:render template="/common/editAdresse" bean="${depart}" var="adresse"  model="['beanName':'depart']"/>
				</fieldset>
			</td>
			<td>
				<fieldset>
					<legend><g:message code="view.travel.section.travel.destination" /></legend>
					<g:hasErrors bean="${destination}">
						<div class="erreur_message">
							<g:renderErrors bean="${destination}" />
						</div>
					</g:hasErrors>
					<g:render template="/common/editAdresse" bean="${destination}" var="adresse"  model="['beanName':'destination']"/>
				</fieldset>
			</td>
		</tr>
	</table>
</fieldset>