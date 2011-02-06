<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="client2" />
    </head>
    <body>
		<ul id="etape">
			<li id="current">Etape 1: Information trajet</li>
			<li>></li>
			<li>Etape 2: Information client</li>
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