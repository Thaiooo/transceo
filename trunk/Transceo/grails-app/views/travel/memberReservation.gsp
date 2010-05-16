<html>
    <head>
        <title>Reservation - Step 1</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
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
    	<form controller="travel" action="memberReserve" method="post" >
    		
    		<g:render template="/travel/member" beans="${member}" var="member"/>
    		<br/>

    		<g:render template="/travel/travel" beans="${travel}" var="travel"/>
    		<br/>
    		
    		Depart:
    		<g:render template="/travel/adresse" beans="${depart}" var="adresse"  model="['beanName':'depart']"/>
    		<br/>
    		
    		Destination:
    		<g:render template="/travel/adresse" beans="${destination}" var="adresse"  model="['beanName':'destination']"/>
    		<br/>
    		
    		<p>
    		<g:submitButton name="create" value="Create" />
    		<g:link url="/Transceo">Cancel</g:link>
    		</p>
    	</form>
    	
    </body>
</html>