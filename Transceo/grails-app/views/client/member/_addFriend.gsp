<script type="text/javascript">
	var barValue = 0;
	function displayProgressBar() {
		barValue = barValue + 1;
		if(barValue < 105){
			$("#progressbar").progressbar({
				value: barValue
			});
			setTimeout("displayProgressBar()", 100);		
		}
	};
</script>

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

<div id="progressbar"></div>
	
<div id="formulaire_popup">
	<g:formRemote name="updateForm" update="friend_canvas" 
		url="[controller: 'member', action:'addFriend']"
		before="displayProgressBar();"
		onComplete="closeCustomerPopup();"
	>
		<ul>
    		<li>
				<label><g:message code="sponsor.email" /> <strong><g:message code="common.required" /></strong></label>
    			<g:textField name="eMail"  value="${fieldValue(bean:inviation,field:'eMail')}"/>
    		</li>
    		<li>
				<label><g:message code="sponsor.message" /></label>
	    		<textarea name="message" cols=40 rows=6><g:message code="message.invitation" args='["${user.lastName}"]'/></textarea>
    		</li>
		</ul>
		<p class="boutons">
    		<g:submitButton class="submit" name="send" value="${message(code:'common.button.send')}" />
		</div>
	</g:formRemote>
</div>