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
    		<p>
    		<g:message code="subscribe.firstName" /> 
    		${member.firstName}
    		</p>
    		
    		<p>
    		<g:message code="subscribe.lastName" />
    		${member.lastName}
    		</p>
    		
    		<p>
    		<g:message code="subscribe.phoneNumber" />
    		${member.phoneNumber}
    		</p>
    		
    		<p>
    		<g:message code="subscribe.adresse" />
    		${member.adresse}
    		</p>
    		
    		<p>
    		<g:message code="subscribe.city" />
    		${member.city}
    		</p>
    		
    		<p>
    		<g:message code="subscribe.postal" />
    		${member.postal}
    		</p>
    		
    		<p>
    		<g:message code="subscribe.country" />
    		${member.country}
    		</p>
    		
    		<br/>

			<g:if test="${travel != null}">
				<g:set var="handicap" value="${travel.handicap}" />
			</g:if>
			<g:else>
				<g:set var="handicap" value="false" />
			</g:else>	
			
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