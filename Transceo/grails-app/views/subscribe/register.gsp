<html>
    <head>
        <title>Subscribe</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	Subscribe
    	<form controller="member" action="register" method="post" >
    		<g:textField name="firstName" />
    		<g:textField name="lastName" />
    		<g:submitButton name="register" value="Register" />
    	</form>
    </body>
</html>