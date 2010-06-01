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
						<div class="formulaire_spip formulaire_contact formulaire_editer_message_contact" id="formulaire_contact">
							<br class='bugajaxie' />
							<g:form controller="travel" action="customerReserve" method="post" >
								<div>
									<input name="id_article" value="6" type="hidden" />
									<input name="page" value="article" type="hidden" />
									<input type='hidden' name='formulaire_action' value='contact' />
									<input type='hidden' name='formulaire_action_args' value='' />
								</div>
								<fieldset>
									<g:hasErrors bean="${customer}">
										<div class="errors">
											<g:renderErrors bean="${customer}" />
										</div>
									</g:hasErrors>		
								
									<ul>
										<li class="editer_nom saisie_nom">
											<label for="info_nom"><g:message code="subscribe.firstName" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="firstName" value="${fieldValue(bean:customer,field:'firstName')}" size="30"/>
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_nom"><g:message code="subscribe.lastName" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="firstName" value="${fieldValue(bean:customer,field:'lastName')}" size="30"/>
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_nom"><g:message code="subscribe.firm" /></label>
											<input type="text" class="text" name="organisation" value="" size="30" />
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_telephone"><g:message code="subscribe.phoneNumber" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="phoneNumber" value="${fieldValue(bean:customer,field:'phoneNumber')}" size="30"/>
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_telephone"><g:message code="subscribe.adresse" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="adresse" value="${fieldValue(bean:customer,field:'adresse')}" size="30"/>
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_telephone"><g:message code="subscribe.city" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="city" value="${fieldValue(bean:customer,field:'city')}" size="30"/>
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_telephone"><g:message code="subscribe.postal" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="postal" value="${fieldValue(bean:customer,field:'postal')}" size="30"/>
										</li>
										<li class="editer_nom saisie_nom">
											<label for="info_telephone"><g:message code="subscribe.country" /> <strong>[Obligatoire]</strong></label>
											<g:textField class="text" name="country" value="${fieldValue(bean:customer,field:'country')}" size="30"/>
										</li>
									</ul>
									
									<g:render template="/travel/editTravel" bean="${travel}"/>
									
								</fieldset>
								<p class="boutons"><input type="submit" class="submit" name="valide" value="Envoyer un message" /></p>
							</g:form>
						</div>
					</div>
				</td>
			</tr>
		</table>
    </body>
</html>