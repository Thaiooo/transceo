<html>
    <head>
        <title>View</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
		
		<div><g:render template="/member/profile" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/member/mile" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/member/sponsor" bean="${member}"/></div>
    	<br/>
   		<div><g:render template="/member/friends" bean="${member}"/></div>
    	<br/>
    	<div><g:render template="/member/travels" bean="${member}"/></div>
    	<br/>

    	<g:if test="${displayButton == true}"> 
    		<g:link controller="member" action="back">Retour</g:link>
    	</g:if>
    </body>
</html>