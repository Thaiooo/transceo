<html>
    <head>
        <title>Devis en ligne</title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<div>
			<g:form controller="travel" action="customerReserve" method="post" >
				<g:render template="/common/member/editCustomerSection" bean="${customer}"/>
				<br/>
				<g:render template="/common/travel/editSection" bean="${travel}"/>
				<p class="boutons">
					<g:submitButton name="create" value="${message(code:'common.button.submit')}" />
				</p>
			</g:form>
		</div>
    </body>
</html>