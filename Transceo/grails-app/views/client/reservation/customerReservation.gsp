<html>
    <head>
        <title>Contact - Réservation</title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<table id="form">
			<tr>
				<td>
					<h3 class="spip">Nous contacter</h3>
					<p>Pour tout renseignement ou demande spécifique, n&#8217;hésitez pas à nous solliciter. Une réponse vous sera donnée dans les meilleurs délais.</p>
					<p><strong>Transeo&nbsp;:</strong></p>
					<p>4, rue Philidor - 75020 Paris</p>
					<p>Tél&nbsp;: +33 1 83 5659 83</p>
					<p>E-mail&nbsp;: <a href='mailto:contact@transeo-vip.com' class='spip_mail'>contact@transeo-vip.com</a></p>
				</td>
				<td>
					<h3 class="spip">Réservation en ligne</h3>
					<div>
						<g:form controller="travel" action="customerReserve" method="post" >
							<g:render template="/common/member/editCustomerSection" bean="${customer}"/>
							<br/>
							<g:render template="/common/travel/editSection" bean="${travel}"/>
							<p class="boutons"><input type="submit" class="submit" name="valide" value="Envoyer un message" /></p>
						</g:form>
					</div>
				</td>
			</tr>
		</table>
    </body>
</html>