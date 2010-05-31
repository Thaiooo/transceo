<html>
    <head>
        <title><g:message code="title.member.register" /></title>
		<meta name="layout" content="index" />		
    </head>
    <body>
    	<g:if test="${member != null}">
    		<g:set var="firstName" value="${member.firstName}"></g:set>
    		<g:set var="lastName" value="${member.lastName}"></g:set>
    		<g:set var="phoneNumber" value="${member.phoneNumber}"></g:set>
    		<g:set var="eMail" value="${member.eMail}"></g:set>
    		<g:set var="adresse" value="${member.adresse}"></g:set>
    		<g:set var="city" value="${member.city}"></g:set>
    		<g:set var="postal" value="${member.postal}"></g:set>
    		<g:set var="country" value="${member.country}"></g:set>
    		<g:set var="password" value="${member.password}"></g:set>
    	</g:if>
    	<g:else>
    	<g:set var="firstName" value=""></g:set>
    		<g:set var="lastName" value=""></g:set>
    		<g:set var="phoneNumber" value=""></g:set>
    		<g:set var="eMail" value=""></g:set>
    		<g:set var="adresse" value=""></g:set>
    		<g:set var="city" value=""></g:set>
    		<g:set var="postal" value=""></g:set>
    		<g:set var="country" value=""></g:set>
    		<g:set var="password" value=""></g:set>
    	</g:else>

		<g:hasErrors bean="${member}">
			<div class="erreur_message">
				<g:renderErrors bean="${member}" />
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
    		    	    	    	
		<div class="formulaire_spip formulaire_editer_message_contact" id=formulaire_register>
			<form controller="member" action="register" method="post" >
	    		<p>
	    		<g:message code="subscribe.firstName" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="firstName" value="${firstName}"/>    		
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.lastName" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="lastName" value="${lastName}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.phoneNumber" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="phoneNumber" value="${phoneNumber}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.eMail" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="eMail" value="${eMail}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.adresse" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="adresse" value="${adresse}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.city" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="city" value="${city}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.postal" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="postal" value="${postal}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.country" /> <strong><g:message code="common.required" /></strong>
	    		<g:textField name="country" value="${country}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.password" /> <strong><g:message code="common.required" /></strong>
	    		<g:passwordField name="password" value="${password}"/>
	    		</p>
	    		
	    		<p>
	    		<g:message code="subscribe.password.confirm" /> <strong><g:message code="common.required" /></strong>
	    		<g:passwordField name="confirmPassword"/>
	    		</p>
	
	    		<p class="boutons"><g:submitButton name="register" value="${message(code:'common.button.subscribe')}" class="submit" /></p>
    		</form>
		</div>
    	
    	
    </body>
</html>