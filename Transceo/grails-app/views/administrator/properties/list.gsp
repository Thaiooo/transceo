<html>
    <head>
        <title><g:message code="title.properties.list"/></title>
		<meta name="layout" content="admin" />		
    </head>
    <body>
		<p>
		Mail: ${grailsApplication.config.transeo.notification.mail.adr}
		</p>
		<p>
		Admin notification object: ${grailsApplication.config.transeo.notification.mail.admin.subject}
		</p>
		<p>
		Client notification objet: ${grailsApplication.config.transeo.notification.mail.client.subject}
		</p>
		<p>
		Taille de la paginatin: ${grailsApplication.config.transeo.pagination.size}
		</p>
		<p>
		Point acquis lors de l'enregistrement: ${grailsApplication.config.transeo.subscribe.point}
		</p>
		<p>
		Point acquis par l'enregistrement d'un ami: ${grailsApplication.config.transeo.friend.subscribe.point}
		</p>
		<p>
		Adresse de Transéo: ${grailsApplication.config.transeo.contact.adr}
		</p>
		<p>
		Téléphone de Transéo: ${grailsApplication.config.transeo.contact.tel}
		</p>
		<p>
		Mail de Transéo: ${grailsApplication.config.transeo.contact.mail}
		</p>
    </body>
</html>