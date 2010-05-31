<jq:jquery>
	$(function() {
	    $("#travelDate").datepicker({ dateFormat: 'dd/mm/yy' });
	});
</jq:jquery>

<fieldset>
	<legend><g:message code="view.travel.section.travel" /></legend>
   	<g:hasErrors bean="${travel}">
		<div class="errors">
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

	<ul>
		<li class="editer_nom saisie_nom">
			<label for="info_telephone"><g:message code="travel.date" /> <strong>[Obligatoire]</strong></label>
			<input type="text" class="text" size="10" id="travelDate" name="date" value="<g:formatDate format="dd/MM/yyyy" date="${travelDate}"/>"/>
		</li>
		<li class="editer_nom saisie_nom">
			<label for="info_telephone"><g:message code="travel.time" /> <strong>[Obligatoire]</strong></label>			
			<g:textField name="travelHour" class="text" value="${fieldValue(bean:travel,field:'travelHour')}" size="2"/>
		</li>
		<li class="editer_nom saisie_nom">
			<label for="info_telephone"><g:message code="travel.time" /> <strong>[Obligatoire]</strong></label>			
			<g:textField name="travelMinute" class="text" value="${fieldValue(bean:travel,field:'travelMinute')}" size="2"/>
		</li>
		<li class="editer_nom saisie_nom">
			<label for="info_telephone"><g:message code="travel.personne.number" /></label>			
			<g:textField name="numberOfPersonne" class="text" value="${fieldValue(bean:travel,field:'numberOfPersonne')}" size="2"/>
		</li>
		<li class="editer_nom saisie_nom">
			<label for="info_telephone"><g:message code="travel.personne.handicap" /></label>			
			<g:checkBox name="handicap" value="${handicap}" checked="${handicap}"/>
		</li>
		<li class='editer_texte saisie_texte obligatoire'>
			<label for="info_telephone"><g:message code="travel.comment" /></label>
			<g:textArea name="comment" value="${fieldValue(bean:travel,field:'comment')}" rows="8" cols="30" class="no_barre"/>
		</li>
	</ul>

	<br/>
	
	<table width="100%">
		<tr>
			<td >
				<fieldset>
					<legend><g:message code="view.travel.section.travel.depart" /></legend>
					<g:hasErrors bean="${depart}">
						<div class="errors">
							<g:renderErrors bean="${depart}" />
						</div>
					</g:hasErrors>
					<g:render template="/travel/adresse" bean="${depart}" var="adresse"  model="['beanName':'depart']"/>
				</fieldset>
			</td>
			<td>
				<fieldset>
					<legend><g:message code="view.travel.section.travel.destination" /></legend>
					<g:hasErrors bean="${destination}">
						<div class="errors">
							<g:renderErrors bean="${destination}" />
						</div>
					</g:hasErrors>
					<g:render template="/travel/adresse" bean="${destination}" var="adresse"  model="['beanName':'destination']"/>
				</fieldset>
			</td>
		</tr>
	</table>
</fieldset>