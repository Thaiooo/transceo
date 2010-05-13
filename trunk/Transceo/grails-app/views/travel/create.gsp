<html>
    <head>
        <title>Reservation - Step 1</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:hasErrors bean="${customer}">
    	Customer errors
			<div class="errors">
				<g:renderErrors bean="${customer}" />
			</div>
		</g:hasErrors>
		
		<g:hasErrors bean="${travel}">
			Travel errors
			<div class="errors">
				<g:renderErrors bean="${travel}" />
			</div>
		</g:hasErrors>
		
		<g:hasErrors bean="${depart}">
			Depart errors
			<div class="errors">
				<g:renderErrors bean="${depart}" />
			</div>
		</g:hasErrors>
		
		<g:hasErrors bean="${destination}">
			Destination errors
			<div class="errors">
				<g:renderErrors bean="${destination}" />
			</div>
		</g:hasErrors>
			
		Customer Information:    	
    	<form controller="travel" action="reserve" method="post" >
    		<p>
    		<g:message code="subscribe.firstName" />
    		<g:textField name="firstName" value="${fieldValue(bean:customer,field:'firstName')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.lastName" />
    		<g:textField name="lastName" value="${fieldValue(bean:customer,field:'lastName')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.phoneNumber" />
    		<g:textField name="phoneNumber" value="${fieldValue(bean:customer,field:'phoneNumber')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.adresse" />
    		<g:textField name="adresse" value="${fieldValue(bean:customer,field:'adresse')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.city" />
    		<g:textField name="city" value="${fieldValue(bean:customer,field:'city')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.postal" />
    		<g:textField name="postal" value="${fieldValue(bean:customer,field:'postal')}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.country" />
    		<g:textField name="country" value="${fieldValue(bean:customer,field:'country')}"/>
    		</p>
    		
    		<br/>

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
    		
    		<br/>
    		
    		Depart:
    		<p>
    		<g:message code="travel.adresse" />
    		<g:textField name="depart.adresse" value="${fieldValue(bean:depart,field:'adresse')}"/>
    		</p>
    		<p>
    		<g:message code="travel.city" />
    		<g:textField name="depart.city" value="${fieldValue(bean:depart,field:'city')}"/>
    		</p>
    		<p>
    		<g:message code="travel.postal" />
    		<g:textField name="depart.postal" value="${fieldValue(bean:depart,field:'postal')}"/>
    		</p>
    		
    		<br/>
    		
    		Destination:
    		<p>
    		<g:message code="travel.adresse" />
    		<g:textField name="destination.adresse" value="${fieldValue(bean:destination,field:'adresse')}"/>
    		</p>
    		<p>
    		<g:message code="travel.city" />
    		<g:textField name="destination.city" value="${fieldValue(bean:destination,field:'city')}"/>
    		</p>
    		<p>
    		<g:message code="travel.postal" />
    		<g:textField name="destination.postal" value="${fieldValue(bean:destination,field:'postal')}"/>
    		</p>
    		
    		<p>
    		<g:submitButton name="create" value="Create" />
    		<g:link url="/Transceo">Cancel</g:link>
    		</p>
    	</form>
    	
    </body>
</html>