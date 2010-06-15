<html>
    <head>
        <title>Sponsoring</title>
		<meta name="layout" content="client" />		
    </head>
    <body>
    	<g:hasErrors bean="${invitation}">
			<div class="errors">
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
    	<form controller="member" action="addFriend" method="post" >
    		<p>
    			<g:message code="sponsor.email" />
    			<g:textField name="eMail"  value="${fieldValue(bean:inviation,field:'eMail')}"/>
    		</p>
    		<p>
	    		<g:message code="sponsor.message" />
	    		<textarea name="message" cols=40 rows=6><g:message code="message.invitation" args='["${user.firstName}"]'/></textarea>
    		</p>
    		<p>
	    		<g:submitButton name="send" value="${message(code:'common.button.send')}" />
    			<g:link url="/Transceo"><g:message code="common.button.cancel" /></g:link>
    		</p>
    	</form>
    </body>
</html>