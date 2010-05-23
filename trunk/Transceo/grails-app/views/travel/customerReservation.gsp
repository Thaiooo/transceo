<html>
    <head>
        <title>Reservation - Step 1</title>
		<meta name="layout" content="main" />
    </head>
    <body>
    	<jq:jquery>
	    	$(function() {
	    		//$("#travelDate").datepicker({ showAnim: '' });
	    		$("#travelDate").datepicker({ dateFormat: 'dd/mm/yy' });
			});
    	</jq:jquery>
    	
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
    		
    		<g:render template="/travel/customer" bean="${customer}" var="customer"/>
    		<br/>

    		<g:render template="/travel/travel" bean="${travel}"/>
    		<br/>
    		
    		Depart:
    		<g:render template="/travel/adresse" bean="${depart}" var="adresse"  model="['beanName':'depart']"/>
    		<br/>
    		
    		Destination:
    		<g:render template="/travel/adresse" bean="${destination}" var="adresse"  model="['beanName':'destination']"/>
    		<br/>
    		
    		<p>
    		<g:submitButton name="create" value="Create" />
    		<g:link url="/Transceo">Cancel</g:link>
    		</p>
    	</form>
    	
    </body>
</html>