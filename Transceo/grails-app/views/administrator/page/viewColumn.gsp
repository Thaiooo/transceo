<html>
    <head>
        <title><g:message code="title.vehicule" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
		<table>
			<tr>
				<td valign="top">
					${htmlContent1}
				</td>
				<td valign="top">
					${htmlContent2}
				</td>
			</tr>
		</table>
		<g:link controller="administrator" action="initEditPageColum" id="${id}">Editer</g:link>
		<g:link controller="administrator" action="editPageMain" title="">Retour</g:link>
	</body>
</html>