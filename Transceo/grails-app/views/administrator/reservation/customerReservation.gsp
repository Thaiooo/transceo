<html>
    <head>
        <title><g:message code="title.admin.customer.reservation" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
		<g:form controller="travel" action="customerReserve" method="post" >
			<g:render template="/common/member/editCustomerSection" bean="${customer}"/>
			<br/>
			<g:render template="/common/travel/editSection" bean="${travel}"/>
			<p class="boutons">
				<input type="submit" class="submit" name="valide" value="<g:message code="common.button.submit" />" />
				<g:link controller="administrator" action="initCreateReservation" title="Reservation to price"><g:message code="common.button.back" /></g:link>
			</p>
		</g:form>
    </body>
</html>