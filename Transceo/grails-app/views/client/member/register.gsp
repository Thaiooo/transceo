<html>
    <head>
        <title><g:message code="title.member.register" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
    	<g:if test="${member != null}">
    		<g:set var="firstName" value="${member.firstName}"></g:set>
    		<g:set var="lastName" value="${member.lastName}"></g:set>
    		<g:set var="firm" value="${member.firm}"></g:set>
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
    		<g:set var="firm" value=""></g:set>
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

   		<div id="formulaire">
			<g:form controller="member" action="register" method="post" >
				<ul>
					<li>
			   		<label><g:message code="member.sponsor.code" /></label>
			   		<g:textField name="sponsorCode" value="${sponsorCode}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.firstName" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="firstName" value="${firstName}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.lastName" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="lastName" value="${lastName}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.firm" /></label>
			   		<g:textField name="firm" value="${firm}"/>
			   		</li>

					<li>
			   		<label><g:message code="member.phone" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="phoneNumber" value="${phoneNumber}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.mail" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="eMail" value="${eMail}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.adresse" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="adresse" value="${adresse}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.postal" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="postal" value="${postal}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.city" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:textField name="city" value="${city}"/>
			   		</li>

					<li>
			   		<label><g:set var="label" value="${message(code:'common.country.select')}" />
			   		<g:message code="member.country" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:select name="country"
			   			from="${com.transceo.CountryCode.values()}"
			   			value="${country}"
			   			valueMessagePrefix="country"
			   			noSelection='["":"${label}"]'
			   		/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.password" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:passwordField name="password" value="${password}"/>
			   		</li>

			   		<li>
			   		<label><g:message code="member.password.confirm" /> <strong><g:message code="common.required" /></strong></label>
			   		<g:passwordField name="confirmPassword"/>
			   		</li>
				</ul>

				<p class="boutons">
					<g:submitButton name="register" value="${message(code:'common.button.subscribe')}" class="submit" />
				</p>

	    	</g:form>
    	</div>
    </body>
</html>