<html>
    <head>
        <title>Sponsoring</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>
    	<form controller="member" action="addFriends" method="post" >
    		<p>
    			<g:message code="sponsor.email1" />
    			<g:textField name="email1" value=""/>
    		</p>
    		<p>
	    		<g:message code="sponsor.email2" />
    			<g:textField name="email2" value=""/>
    		</p>
    		<p>
    			<g:message code="sponsor.email3" />
    			<g:textField name="email3" value=""/>
    		</p>
    		<p>
    			<g:message code="sponsor.email4" />
    			<g:textField name="email4" value=""/>
    		</p>
    		<p>
	    		<g:message code="sponsor.message" />
    			<g:textArea name="message" value="${fieldValue(bean:sponsor,field:'message')}"/>
    		</p>
    		<p>
	    		<g:submitButton name="send" value="${message(code:'sponsor.button.send')}" />
    			<g:link url="/Transceo"><g:message code="sponsor.button.cancel" /></g:link>
    		</p>
    	</form>
    </body>
</html>