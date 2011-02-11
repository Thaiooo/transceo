<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="client2" />
    </head>
    <body>
		<ul id="etape">
			<li id="current"><g:message code="message.reservation.step.1" /></li>
			<li>></li>
			<li><g:message code="message.reservation.step.2" /></li>
		</ul>

		<div id="formulaire_reservation">
			<g:form controller="travel" method="post" >
				<g:render template="/common/travel/editSectionWithSelectionType2" bean="${travel}"/>
				<p class="boutons">
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.cancel')}" action="initReservation" /> 
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.next')}" action="bookEtape1" /> 
				</p>
			</g:form>
		</div>
    </body>
</html>