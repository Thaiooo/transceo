<html>
    <head>
        <title><g:message code="title.member.edit" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
    	<g:hasErrors bean="${member}">
			<div class="errors">
				<g:renderErrors bean="${member}" />
			</div>
		</g:hasErrors>
		
		<div id="formulaire">
	    	<g:form name="updateForm" controller="administrator" >
	    		
				<g:if test="${member != null}">
					<g:set var="id" value="${member.id}"></g:set>
					<g:set var="miles" value="${member.miles}"></g:set>
					<g:set var="friendMiles" value="${member.friendMiles}"></g:set>
				</g:if>
				<g:else>
					<g:set var="id" value=""></g:set>
					<g:set var="miles" value=""></g:set>
					<g:set var="friendMiles" value=""></g:set>
				</g:else>
	
				<g:hiddenField name="id" value="${id}" />
				
				<ul>
					<li>
						<label><g:message code="miles" /></label> 
						<g:textField class="text" name="miles" value="${miles}" />
					</li>
					<li>
						<label><g:message code="miles.friend" /></label> 
						<g:textField class="text" name="friendMiles" value="${friendMiles}" />
					</li>
				</ul>
	    		
	    		<p class="boutons">
	    			<g:actionSubmit class="submit" action="showProfile" value="${message(code:'label.common.button.cancel')}" />
	    			<g:actionSubmit class="submit" action="updateMile" value="${message(code:'label.common.button.save')}" />
	    		</p>
	    	</g:form>
    	</div>
    </body>
</html>