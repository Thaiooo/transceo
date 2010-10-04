<html>
    <head>
        <title><g:message code="title.add.speical.condition" /></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
    
	    <jq:jquery>
			$(function() {
			    $("#startDate").datepicker({ dateFormat: 'dd/mm/yy' });
			    $("#endDate").datepicker({ dateFormat: 'dd/mm/yy' });
			});
		</jq:jquery>

		<g:if test="${specialCondition != null}">
			<g:set var="id" value="${specialCondition.id}"></g:set>
			<g:set var="label" value="${specialCondition.label}"></g:set>
			<g:set var="startDate" value="${specialCondition.startDate}"></g:set>
			<g:set var="endDate" value="${specialCondition.endDate}"></g:set>
			<g:set var="value" value="${specialCondition.value}"></g:set>
			<g:set var="type" value="${specialCondition.type}"></g:set>
		</g:if>
		<g:else>
			<g:set var="id" value=""></g:set>
			<g:set var="value" value=""></g:set>
			<g:set var="label" value=""></g:set>
		</g:else>
		
		<g:hasErrors bean="${specialCondition}">
			<div class="errors">
				<g:renderErrors bean="${specialCondition}" />
			</div>
		</g:hasErrors>
		
		<div id="formulaire">
		
			<g:form controller="administrator" method="post" >
		
				<g:hiddenField name="memberId" value="${memberId}" />
				<g:hiddenField name="id" value="${id}" />
				
				<ul>
					<li>
						<label><g:message code="special.condition.label" /><strong><g:message code="common.required" /></strong></label>
						<g:textField class="text" name="label" value="${label}" />
					</li>
					<li>
						<label><g:message code="special.condition.startDate" /> <strong><g:message code="common.required" /></strong></label>
						<input type="text" class="date" size="10" id="startDate" name="startDate" value="<g:formatDate format="dd/MM/yyyy" date="${startDate}"/>"/>
					</li>
					<li>
						<label><g:message code="special.condition.endDate" /></label>
						<input type="text" class="date" size="10" id="endDate" name="endDate" value="<g:formatDate format="dd/MM/yyyy" date="${endDate}"/>"/>
					</li>
					<li>
						<label><g:message code="special.condition.rate" /><strong><g:message code="common.required" /></strong></label>
						<input type="text" class="text" name="value" value="${value}"  />
					</li>
					<li>
						<label><g:message code="special.condition.type" /><strong><g:message code="common.required" /></strong></label>
						<g:select name="type" from="${com.transceo.SpecialConditionType.values()}" value="${type}" valueMessagePrefix="special.condition.type"/>
					</li>
				</ul>
				
				<p class="boutons">
					<g:actionSubmit class="submit" action="backToCustomerProfile" value="${message(code:'label.common.button.back')}" />
					<g:actionSubmit class="submit" action="createSpecialCondition" value="${message(code:'label.common.button.submit')}" />
				</p>
			</g:form>
		</div>
	</body>
</html>