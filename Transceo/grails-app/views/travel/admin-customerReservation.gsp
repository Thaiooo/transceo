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
									<legend>Envoyer un message</legend>
									<ul>
										<li class="editer_nom saisie_nom">
											<label for="info_nom">Nom</label>
											<input type="text" class="text" name="nom" id="info_nom" value="" size="30" />
										</li>
										<li class="editer_prenom saisie_prenom">
											<label for="info_prenom">Pr&eacute;nom</label>
											<input type="text" class="text" name="prenom" id="info_prenom" value="" size="30" />
										</li>
										<li class="editer_organisation saisie_organisation">
											<label for="info_organisation">Soci&eacute;t&eacute;</label>
											<input type="text" class="text" name="organisation" id="info_organisation" value="" size="30" />
										</li>
										<li class="editer_adresse saisie_adresse">
											<label for="info_adresse">Adresse</label>
											<input type="text" class="text" name="adresse" id="info_adresse" value="" size="30" />
										</li>
										<li class="editer_telephone saisie_telephone  obligatoire">
											<label for="info_telephone">T&eacute;l&eacute;phone  <strong>[Obligatoire]</strong></label>
											<input type="text" class="text" name="telephone" id="info_telephone" value="" size="30" />
										</li>
										<li class='editer_mail saisie_mail obligatoire'>
											<label for="mail">Votre adresse email <strong>[Obligatoire]</strong></label>
											<input type="text" class="text" name="mail" id="mail" value="" size="30" />
										</li>
										<li class="editer_sujet saisie_sujet  obligatoire">
											<label for="info_sujet">Sujet  <strong>[Obligatoire]</strong></label>
											<input type="text" class="text" name="sujet" id="info_sujet" value="" size="30" />
										</li>
										<li class='editer_texte saisie_texte obligatoire'>
											<label for="contact_texte">Texte de votre message : <strong>[Obligatoire]</strong></label>
											<textarea name="texte" id="contact_texte" rows="8" cols="60" class="no_barre"></textarea>
										</li>
									</ul>
								</fieldset>
								<p class="boutons"><input type="submit" class="submit" name="valide" value="Envoyer un message" /></p>
							</g:form>
						</div>
					</div>
				</td>
			</tr>
		</table>
    
    
    
    
    
    
    
    
    	<g:form controller="travel" action="customerReserve" method="post" >
    		<g:render template="/travel/editCustomer" bean="${customer}" var="customer"/>
    		<br/>
    		<g:render template="/travel/editTravel" bean="${travel}"/>
			<br/>
    		<p>
    			<g:submitButton name="create" value="${message(code:'common.button.submit')}" />
    		</p>    		
    	</g:form>
    </body>
</html>