<html>
    <head>
        <title><g:message code="title.admin.page.view" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
    	<table class="adminPage">
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.title" /></td>
    			<td>${title}</td>
    		</tr>
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.description" /></td>
    			<td>${description}</td>
    		</tr>
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.keyword" /></td>
    			<td>${keywords}</td>
    		</tr>
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.content" /></td>
    			<td>${htmlContent}</td>
    		</tr>
    	</table>

		<p class="boutons">
			<g:link class="submit" controller="administrator" action="initEditPage" id="${id}" params="[lang:lang]">Editer</g:link>
			<g:link class="submit" controller="administrator" action="editPageMain" title="">Retour</g:link>
		</p>
	</body>
</html>