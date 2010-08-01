<html>
    <head>
        <title><g:message code="title.location.update"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
		<g:form controller="location" method="post" >
	    	<g:if test="${adresse != null}">
	    		<g:set var="label" value="${adresse.label}"></g:set>
				<g:set var="adresseName" value="${adresse.adresse}"></g:set>
				<g:set var="city" value="${adresse.city}"></g:set>
				<g:set var="postal" value="${adresse.postal}"></g:set>
				<g:set var="country" value="${adresse.country}"></g:set>
			</g:if>
			<g:else>
				<g:set var="label" value=""></g:set>
				<g:set var="adresseName" value=""></g:set>
				<g:set var="city" value=""></g:set>
				<g:set var="postal" value=""></g:set>
				<g:set var="country" value=""></g:set>
			</g:else>
				
			<g:hasErrors bean="${adresse}">
				<div class="erreur_message">
					<g:renderErrors bean="${adresse}" />
				</div>
			</g:hasErrors>
			<g:if test="${flash.message != null}">
		    	<div class="erreur_message">
			    	<ul>
						<li>
							<g:message code="${flash.message}" ></g:message>
						</li>
					</ul>
				</div>
		    </g:if>
			
			<g:hiddenField name="id" value="${adresse.id}" />
			
			<p>
				<g:message code="travel.label" /> <strong><g:message code="common.required" /></strong>
				<g:textField name="label" value="${label}"/>
			</p>	
			<p>
				<g:message code="travel.adresse" /> <strong><g:message code="common.required" /></strong>
				<g:textField name="adresse" value="${adresseName}"/>
			</p>
			<p>
				<g:message code="travel.postal" /> <strong><g:message code="common.required" /></strong>
			    <g:textField name="postal" value="${postal}" size="5" maxize="5"/>
			</p>
			<p>
			    <g:message code="travel.city" /> <strong><g:message code="common.required" /></strong>
			    <g:textField id="City" name="city" value="${city}"/>
			</p>
			<p>
				<g:message code="travel.country" /> <strong><g:message code="common.required" /></strong>
			    <g:set var="label" value="${message(code:'common.country.select')}" />
				<g:select name="country" 
					from="${com.transceo.CountryCode.values()}" 
					value="${country}" 
					valueMessagePrefix="country" 
					noSelection='["":"${label}"]'
			    />
			</p>
	   		<p class="boutons">
				<g:actionSubmit action="update" value="${message(code:'common.button.update')}" />
				<g:actionSubmit action="delete" value="${message(code:'common.button.delete')}" />
				<g:actionSubmit action="list" value="${message(code:'common.button.back')}" />
			</p>
	    </g:form>
    </body>
</html>