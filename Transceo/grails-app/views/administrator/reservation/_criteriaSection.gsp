<jq:jquery>
	$(function() {
	    $("#creationDate").datepicker({ dateFormat: 'dd/mm/yy' });
	    $("#reservationDate").datepicker({ dateFormat: 'dd/mm/yy' });
	});
</jq:jquery>

<form controller="administrator" action="searchReservation" method="post" >

	<g:if test="${criteria != null}">
		<g:set var="code" value="${criteria.code}"/>
		<g:set var="firstName" value="${criteria.firstName}"/>
		<g:set var="lastName" value="${criteria.lastName}"/>
		<g:set var="phoneNumber" value="${criteria.phoneNumber}"/>
		<g:set var="eMail" value="${criteria.eMail}"/>
		<g:set var="creationDateCriteria" value="${criteria.creationDateCriteria}" />
		<g:set var="creationDate" value="${criteria.creationDate}" />
		<g:set var="reservationDateCriteria" value="${criteria.reservationDateCriteria}" />
		<g:set var="reservationDate" value="${criteria.reservationDate}" />
		<g:set var="status" value="${criteria.statusCode}" />
	</g:if>
	
	<fieldset>
		<legend><g:message code="search.reservation.section.criteria.legend" /></legend>
		<fieldset>
			<legend><g:message code="search.reservation.section.customer.legend" /></legend>
			<p>
			<g:message code="search.member.code" />
			<g:textField name="code" value="${code}" size="4"/>
			<g:message code="search.member.firstName" />
			<g:textField name="firstName" value="${firstName}"/>
			<g:message code="search.member.lastName" />
			<g:textField name="lastName" value="${lastName}"/>
			</p>
			<p>
			<g:message code="search.member.phone" />
			<g:textField name="phoneNumber" value="${phoneNumber}"/>
			<g:message code="search.member.mail" />
			<g:textField name="eMail" value="${eMail}"/>
			</p>
		</fieldset>
		<br/>
		<fieldset>
			<legend><g:message code="search.reservation.section.travel.legend" /></legend>
			<p>
			<g:message code="search.travel.creation.date" />
			<g:select from="${com.transceo.DateCriteria.values()}" name="creationDateCriteria" value="${creationDateCriteria}" valueMessagePrefix="date.criteria"/>
			<input type="text" class="text" size="10" id="creationDate" name="creationDate" value="<g:formatDate format="dd/MM/yyyy" date="${creationDate}"/>"/>
			<g:message code="search.travel.date" /> 			 
			<g:select from="${com.transceo.DateCriteria.values()}" name="reservationDateCriteria" value="${reservationDateCriteria}" valueMessagePrefix="date.criteria"/>
			<input type="text" class="text" size="10" id="reservationDate" name="reservationDate" value="<g:formatDate format="dd/MM/yyyy" date="${reservationDate}"/>"/>
			<g:message code="search.travel.status" />						
			<g:select name="status" from="${com.transceo.TravelStatus.values()}" value="${status}" valueMessagePrefix="reservation.status"/>
			</p>
		</fieldset>
		<p>
		<g:submitButton name="search" value="${message(code:'common.button.search')}" />
		</p>
	</fieldset>
</form>