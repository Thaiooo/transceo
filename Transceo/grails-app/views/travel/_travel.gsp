<g:if test="${travel != null}">
	<g:set var="handicap" value="${travel.handicap}" />
</g:if>
<g:else>
	<g:set var="handicap" value="false" />
</g:else>	
			
<p>
	<g:message code="travel.date" />
   	<g:datePicker name="travelDate"  noSelection="['':'-Choose-']"/>
</p>
<p>
	<g:message code="travel.comment" />
	<g:textArea name="comment" value="${fieldValue(bean:travel,field:'comment')}"/>
</p>
<p>
	<g:message code="travel.personne.number" />
	<g:textField name="numberOfPersonne" value="${fieldValue(bean:travel,field:'numberOfPersonne')}"/>
</p>
<p>
	<g:message code="travel.personne.handicap" />
	<g:checkBox name="handicap" value="${handicap}" checked="${handicap}"/>
</p>