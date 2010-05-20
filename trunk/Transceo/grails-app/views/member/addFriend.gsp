<html>
    <head>
        <title>Sponsoring</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
		<g:if test="${flash.message != null}">
	    	<div class="errors">
				<g:message code="${flash.message}" ></g:message>
			</div>
    	</g:if>
    	<form controller="member" action="addFriend" method="post" >
    		<p>
    			<g:message code="sponsor.email" />
    			<g:textField name="email" value=""/>
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