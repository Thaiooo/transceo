<g:if test="${flash.message != null}">
	<div class="erreur_message">
		<ul>
			<li>
				<g:message code="${flash.message}" ></g:message>
			</li>
		</ul>
	</div>
</g:if>
<div id="password_popup">
	<g:formRemote name="form" update="customer_canvas" url="[controller: 'member', action:'changePassword2']">
		<ul>
    		<li>
				<label><g:message code="label.member.password.old" /> <strong><g:message code="label.common.required" /></strong></label>
    			<g:passwordField name="oldPassword" value="${oldPassword}"/>
    		</li>

    		<li>
				<label><g:message code="label.member.password" /> <strong><g:message code="label.common.required" /></strong></label>
    			<g:passwordField name="password" value="${password}"/>
    		</li>

    		<li>
				<label><g:message code="label.member.password.confirm" /> <strong><g:message code="label.common.required" /></strong></label>
    			<g:passwordField name="confirmPassword"/>
    		</li>
    	</ul>

		<p class="boutons">
			<g:submitButton name="register" value="${message(code:'label.common.button.submit')}" class="submit" />
		</div>
	</g:formRemote>
</div>