<html>
    <head>
        <title><g:message code="title.book" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<div>
			<g:form controller="travel" action="customerBook" method="post" >
				<g:render template="/common/member/editCustomerSection" bean="${customer}"/>
				<br/>
				<g:render template="/common/location/editSection" bean="${travel}"/>
				<p class="boutons">
					<g:submitButton name="create" value="${message(code:'common.button.submit')}" />
					<a href="<g:createLink controller="travel" action="initCustomerReservation" />#ancre" ><g:message code="common.button.back"/></a>
				</p>
			</g:form>
		</div>
    </body>
</html>