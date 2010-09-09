<html>
    <head>
        <title><g:message code="title.presentation" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
    	<g:set var="content" value="${wikiContent}"></g:set>
    	<div id="formulaire_reservation">
	    	<g:form name="form" controller="administrator" action="editPage"  method="post">
				<g:hiddenField name="id" value="${id}" />    	
	    		<g:textArea class="wikiContent" name="wikiContent" value="${content}"/>
	    		<p class="boutons">
	    			<g:link controller="administrator" action="editPageMain" title="">Annuler</g:link>
	    			<g:submitButton class="submit" name="update" value="Update" />
	    		</p>
	    	</g:form>
	    </div>
	</body>
</html>