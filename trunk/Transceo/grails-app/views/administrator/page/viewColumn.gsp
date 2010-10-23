<html>
    <head>
        <title>View page</title>
		<meta name="layout" content="admin" />
    </head>
    <body>
    
    	<table class="adminPage">
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.title" /></td>
    			<td colspan="2">${title}</td>
    		</tr>
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.description" /></td>
    			<td colspan="2">${description}</td>
    		</tr>
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.keyword" /></td>
    			<td colspan="2">${keywords}</td>
    		</tr>
    		<tr>
    			<td class="label" valign="top" ><g:message code="label.page.admin.page.content" /></td>
    			<td valign="top">${htmlContent1}</td>
    			<td valign="top">${htmlContent2}</td>
    		</tr>
    	</table>
    	
    	<p class="boutons">
	    	<g:link class="submit" controller="administrator" action="initEditPageColum" id="${id}" params="[lang:lang]">Editer</g:link>
			<g:link class="submit" controller="administrator" action="editPageMain" title="">Retour</g:link>
		</p>
	</body>
</html>