<html>
    <head>
        <title>Reservation - Step 1</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:hasErrors bean="${customer}">
			<div class="errors">
				<g:renderErrors bean="${customer}" />
			</div>
		</g:hasErrors>
		<g:hasErrors bean="${travel}">
			<div class="errors">
				<g:renderErrors bean="${travel}" />
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
    		
    		<br/>
    		
    		<p>
    		<g:message code="travel.date" />
    		<g:textField name="date" value="${fieldValue(bean:member,field:'date')}"/>
    		</p>
    		<p>
    		<g:message code="travel.time" />
    		<g:textField name="time" value="${fieldValue(bean:member,field:'time')}"/>
    		</p>
    		<p>
    		<g:message code="travel.comment" />
    		<g:textArea name="comment" value="${fieldValue(bean:member,field:'comment')}"/>
    		</p>
    		<p>
    		<g:message code="travel.personne.number" />
    		<g:textField name="numberOfPersonne" value="${fieldValue(bean:member,field:'numberOfPersonne')}"/>
    		</p>
    		<p>
    		<g:message code="travel.personne.handicap" />
    		<g:checkBox name="handicap" value="${fieldValue(bean:member,field:'handicap')}" />
    		</p>
    		
    		<br/>
    		
    		Depart:
    		<p>
    		<g:message code="travel.adresse" />
    		<g:textField name="adresseDepart" value="${fieldValue(bean:member,field:'adresseDepart')}"/>
    		</p>
    		<p>
    		<g:message code="travel.city" />
    		<g:textField name="cityDepart" value="${fieldValue(bean:member,field:'cityDepart')}"/>
    		</p>
    		<p>
    		<g:message code="travel.postal" />
    		<g:textField name="postalDepart" value="${fieldValue(bean:member,field:'postalDepart')}"/>
    		</p>
    		
    		<br/>
    		
    		Destination:
    		<p>
    		<g:message code="travel.adresse" />
    		<g:textField name="adresseDestination" value="${fieldValue(bean:member,field:'adresseDestination')}"/>
    		</p>
    		<p>
    		<g:message code="travel.city" />
    		<g:textField name="cityDestination" value="${fieldValue(bean:member,field:'cityDestination')}"/>
    		</p>
    		<p>
    		<g:message code="travel.postal" />
    		<g:textField name="postalDestination" value="${fieldValue(bean:member,field:'postalDestination')}"/>
    		</p>
    		
    		<p>
    		<g:submitButton name="create" value="Create" />
    		<g:link url="/Transceo">Cancel</g:link>
    		</p>
    	</form>
    	
    </body>
</html>