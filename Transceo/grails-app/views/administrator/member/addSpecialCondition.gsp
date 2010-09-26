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
			<g:set var="startDate" value="${specialCondition.startDate}"></g:set>
			<g:set var="endDate" value="${specialCondition.endDate}"></g:set>
			<g:set var="rate" value="${specialCondition.rate}"></g:set>
			<g:set var="description" value="${specialCondition.description}"></g:set>
		</g:if>
		<g:else>
			<g:set var="id" value=""></g:set>
			<g:set var="rate" value=""></g:set>
			<g:set var="description" value=""></g:set>
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
						<label><g:message code="specialCondition.startDate" /> <strong><g:message code="common.required" /></strong></label>
						<input type="text" class="date" size="10" id="startDate" name="startDate" value="<g:formatDate format="dd/MM/yyyy" date="${startDate}"/>"/>
					</li>
					<li>
						<label><g:message code="specialCondition.endDate" /></label>
						<input type="text" class="date" size="10" id="endDate" name="endDate" value="<g:formatDate format="dd/MM/yyyy" date="${endDate}"/>"/>
					</li>
					<li>
						<label><g:message code="specialCondition.rate" /><strong><g:message code="common.required" /></strong></label>
						<input type="text" class="text" name="rate" value="${rate}"  />
					</li>
					<li>
						<label><g:message code="specialCondition.description" /></label>
						<g:textField class="text" name="description" value="${description}" />
					</li>
				</ul>
				
				<p class="boutons">
					<g:actionSubmit class="submit" action="backToCustomerProfile" value="${message(code:'common.button.back')}" />
					<g:actionSubmit class="submit" action="createSpecialCondition" value="${message(code:'common.button.submit')}" />
				</p>
			</g:form>
		</div>
	</body>
</html>