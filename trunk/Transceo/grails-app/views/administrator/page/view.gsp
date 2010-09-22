<html>
    <head>
        <title>Page: ${title}</title>
		<meta name="layout" content="admin" />
    </head>
    <body>
		${htmlContent}
		<g:link controller="administrator" action="initEditPage" id="${id}">Editer</g:link>
		<g:link controller="administrator" action="editPageMain" title="">Retour</g:link>
	</body>
</html>