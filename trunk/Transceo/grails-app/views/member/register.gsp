<html>
    <head>
        <title>Subscribe</title>
		<meta name="layout" content="index" />		
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
		<g:if test="${flash.message != null}">
	    	<div class="errors">
				<g:message code="${flash.message}" ></g:message>
			</div>
    	</g:if>
    	
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
    	    	    	
    	<form controller="member" action="register" method="post" >
    		<p>
    		<g:message code="subscribe.firstName" />
    		<g:textField name="firstName" value="${firstName}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.lastName" />
    		<g:textField name="lastName" value="${lastName}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.phoneNumber" />
    		<g:textField name="phoneNumber" value="${phoneNumber}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.eMail" />
    		<g:textField name="eMail" value="${eMail}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.adresse" />
    		<g:textField name="adresse" value="${adresse}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.city" />
    		<g:textField name="city" value="${city}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.postal" />
    		<g:textField name="postal" value="${postal}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.country" />
    		<g:textField name="country" value="${country}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.password" />
    		<g:passwordField name="password" value="${password}"/>
    		</p>
    		
    		<p>
    		<g:message code="subscribe.password.confirm" />
    		<g:passwordField name="confirmPassword"/>
    		</p>

    		<p>
    		<g:submitButton name="register" value="${message(code:'common.button.subscribe')}" />
    		</p>
    	</form>
    </body>
</html>