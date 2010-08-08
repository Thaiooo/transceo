<html>
    <head>
        <title><g:message code="title.book" /></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<div>
			<g:form controller="travel" action="customerBook" method="post" >
				<g:if test="${customer == null || customer.id == '' || customer.id == null}">
					<g:render template="/common/member/editCustomerSection" bean="${customer}"/>
				</g:if>
				<g:else>
					<g:set var="legend" value="${message(code:'view.travel.section.customer')}" />
    				<g:render template="/common/member/viewResumeSection" bean="${customer}" var="customer" model='["legend":"${legend}", "editAble":false]'/>
				</g:else>
				<br/>
				<g:render template="/common/location/editSection" bean="${travel}"/>
				<p class="boutons">
					<g:submitButton id="create" name="create" value="${message(code:'common.button.submit')}" />
					<a href="<g:createLink controller="travel" action="initReservation" />#ancre" ><g:message code="common.button.back"/></a>
				</p>
			</g:form>
		</div>
    </body>
</html>