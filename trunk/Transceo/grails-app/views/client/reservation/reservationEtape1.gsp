<html>
    <head>
        <title><g:message code="title.reservation.create" /></title>
		<meta name="layout" content="client2" />
    </head>
    <body>
		<div id="formulaire_reservation">
			<g:form controller="travel" method="post" >
				<div class="etape">
					<div class="select">Etape 1: Information trajet</div> 
					<div>Etape 2: Information client</div>
				</div>
				<br/>
				<g:render template="/common/travel/editSectionWithSelectionType2" bean="${travel}"/>
				<p class="boutons">
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.cancel')}" action="initReservation" /> 
					<g:actionSubmit class="submit" value="${message(code:'label.common.button.next')}" action="bookEtape1" /> 
				</p>
			</g:form>
		</div>
    </body>
</html>