    	<g:hasErrors bean="${invitation}">
			<div class="erreur_message">
				<g:renderErrors bean="${invitation}" />
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
    	<g:formRemote name="updateForm" update="friend_canvas" 
			url="[controller: 'member', action:'addFriend']"
			onComplete="closeCustomerPopup();"
		>
			<div id="addFriendPopupContent">
	    		<p>
	    			<g:message code="sponsor.email" />
	    			<g:textField name="eMail"  value="${fieldValue(bean:inviation,field:'eMail')}"/>
	    		</p>
	    		<p>
		    		<g:message code="sponsor.message" />
		    		<textarea name="message" cols=40 rows=6><g:message code="message.invitation" args='["${user.lastName}"]'/></textarea>
	    		</p>
    		</div>
    		<div id="buttonSection">
	    		<g:submitButton name="send" value="${message(code:'common.button.send')}" />
    		</div>
    	</g:formRemote>