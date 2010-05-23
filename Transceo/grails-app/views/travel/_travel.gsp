<g:if test="${travel != null}">
	<g:set var="handicap" value="${travel.handicap}" />
	<g:set var="travelDate" value="${travel.travelDate}" />
</g:if>
<g:else>
	<g:set var="handicap" value="false" />
</g:else>	
			
<p>
	<g:message code="travel.date" />
	<input type="text" size="10" id="travelDate" name="date" value="<g:formatDate format="dd/MM/yyyy" date="${travelDate}"/>"/>
	<g:message code="travel.time" />
	<g:textField name="travelHour" value="${fieldValue(bean:travel,field:'travelHour')}" size="2"/>:<g:textField name="travelMinute" value="${fieldValue(bean:travel,field:'travelMinute')}" size="2"/>
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