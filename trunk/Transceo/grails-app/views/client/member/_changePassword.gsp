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
			<g:formRemote name="form" update="customer_canvas" url="[controller: 'member', action:'changePassword2']">
				<div id="changePasswordPopupContent">
		    		<p>
		    		<g:message code="subscribe.password.old" /> <strong><g:message code="common.required" /></strong>
		    		<g:passwordField name="oldPassword" value="${oldPassword}"/>
		    		</p>
		    		
		    		<p>
		    		<g:message code="subscribe.password" /> <strong><g:message code="common.required" /></strong>
		    		<g:passwordField name="password" value="${password}"/>
		    		</p>
		    		
		    		<p>
		    		<g:message code="subscribe.password.confirm" /> <strong><g:message code="common.required" /></strong>
		    		<g:passwordField name="confirmPassword"/>
		    		</p>
	    		</div>
	
	    		<div id="buttonSection">
	    			<g:submitButton name="register" value="${message(code:'common.button.submit')}" class="submit" />
	    		</div>
    		</g:formRemote>
		</div>