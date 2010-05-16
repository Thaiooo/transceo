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
    	<form controller="travel" action="customerReserve" method="post" >
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

    		<g:render template="travel" beans="${travel}"/>
    		<br/>
    		
    		Depart:
    		<g:render template="adresse" beans="${depart}" var="adresse"  model="['beanName':'depart']"/>
    		<br/>
    		
    		Destination:
    		<g:render template="adresse" beans="${destination}" var="adresse"  model="['beanName':'destination']"/>
    		<br/>
    		
    		<p>
    		<g:submitButton name="create" value="Create" />
    		<g:link url="/Transceo">Cancel</g:link>
    		</p>
    	</form>
    	
    </body>
</html>