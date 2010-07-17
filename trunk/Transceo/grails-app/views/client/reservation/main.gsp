<html>
    <head>
        <title><g:message code="title.reservation.main" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<table id="form">
			<tr>
				<td width="60%">
					<h3 class="spip"><g:message code="label.page.client.reservation.1" /></h3>
					<p><g:message code="label.page.client.reservation.2" /></p>
					<p><strong><g:message code="label.page.client.reservation.3" /></strong></p>
					<p>${grailsApplication.config.transeo.contact.adr}</p>
					<p><g:message code="label.page.client.reservation.5" args='["${grailsApplication.config.transeo.contact.tel}"]'/></p>
					<p><g:message code="label.page.client.reservation.6" /><a href='mailto:${grailsApplication.config.transeo.contact.mail}' class='spip_mail'>${grailsApplication.config.transeo.contact.mail}</a></p>
				</td>
				<td>
					<h3 class="spip"><g:message code="label.page.client.reservation.7" /></h3>
					<p>
					<g:message code="label.page.client.reservation.8" />
					<g:if test="${session.USER == null}">
						<a href="<g:createLink controller="travel" action="initCustomerBook" />#ancre" ><g:message code="label.page.client.reservation.9" /></a>
					</g:if>
					<g:else>
						<a href="<g:createLink controller="travel" action="initMemberBook" />#ancre" ><g:message code="label.page.client.reservation.9" /></a>
					</g:else>
					</p>
					<h3 class="spip"><g:message code="label.page.client.reservation.10" /></h3>
					<p>
					<g:message code="label.page.client.reservation.11" />
					<g:if test="${session.USER == null}">
						<a href="<g:createLink controller="travel" action="initCustomerQuotation" />#ancre" ><g:message code="label.page.client.reservation.12" /></a>
					</g:if>
					<g:else>
						<a href="<g:createLink controller="travel" action="initMemberQuotation" />#ancre" ><g:message code="label.page.client.reservation.12" /></a>
					</g:else>
					</p>					
				</td>
			</tr>
		</table>
    </body>
</html>