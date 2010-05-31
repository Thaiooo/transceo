<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">	
	<head>
		<title><g:layoutTitle default="Grails" /></title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<meta name="description" content="D�placements priv�s avec chauffeur Paris - Ile de France - Province" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'spip_formulaires.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'transeo.css')}" />
		<!--[if IE]>
		<link rel="stylesheet" href="${resource(dir:'css',file:'transeo_ie.css')}" />
		<![endif]-->
		
		<!-- Pour google map -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
		
		<!-- Pour jquery -->
		<link rel="stylesheet" href="${resource(dir:'css',file:'ui-lightness/jquery-ui-1.8.1.custom.css')}" />
		<g:javascript library="jquery" />
		<g:javascript src="jquery/jquery-ui-1.8.1.custom.min.js" />
	    
	    <g:layoutHead />
	</head>

	<body class="page_article">
		<div id="page">

			<!--Entete de la page + titre du site-->
			<div id="entete">
				<a rel="start home" href="http://transeo-vip.com/" title="Home page" class="accueil"><img class="spip_logos" alt="" src="${resource(dir:'images',file:'siteon0.png')}" width="362" height="163" /> <strong class="masque">Transeo</strong></a>
				<div id="descriptif">
					<h1><p><strong>D�placements priv�s avec chauffeur</strong><br/>Paris - Ile de France - Province</p></h1>
				</div>
			</div>

			<!--t�l�phone-->
			<div id="telephone"><a name="ancre" id="ancre"></a>R�servez un Transeo !<br/> +33 1 83 5659 83</div>

			<!--cadre-->
			<div id="diapo-cadre"><img src="${resource(dir:'images',file:'diapo-cadre.png')}" alt="diaporama" /></div>

			<!--diapo-->
			<div id="cycle" class="cycle">
				<img src="${resource(dir:'images',file:'diapo1.jpg')}" width='894' height='309' style='height:309px;width:894px;' alt='Transeo' />
				<img src="${resource(dir:'images',file:'diapo2.jpg')}" width='894' height='309' style='height:309px;width:894px;' alt='transeo' />
				<img src="${resource(dir:'images',file:'diapo3.jpg')}" width='894' height='309' style='height:309px;width:894px;' alt='' />
			</div>
			<!--fin diapo-->
			
			<div class="effaceur"></div>    
					
			<!--nav-->
			<ul class="nav">
				<li><a rel="start home" href="http://transeo-vip.com/#ancre" title="Home page" class="accueil">Accueil</a></li>
				<li class="art3"><a href="#"  title="Prestations">Prestations</a></li>
				<li class="art4"><a href="#"  title="Chauffeurs-v�hicules">Chauffeurs-v�hicules</a></li>
				<a href="#"  title="Contact - R�servation"></a></li>
				<li class="art5">
					<g:link controller="travel" action="initCustomerReservation">Contact - R�servation</g:link>
				</li>
				<li class="art7">
					<g:if test="${session.USER == null}">
						<g:link controller="login" action="login" title="Manage user">Login</g:link>
					</g:if>
					<g:else>
						<g:link controller="member" action="showMyProfile" title="Manage user">Compte Client</g:link>
					</g:else>
				</li>
			</ul>
			<!--fin nav-->

			<!--Contenu principal-->
			<div id="contenu">
				<div id="article6">
					<div class="crayon article-titre-6  titre"><h2><g:layoutTitle default="Grails" /></h2></div>
	    			<div class="crayon article-texte-6  texte effet_slide">
						<g:layoutBody />
					</div>
					<div class="nettoyeur"></div>
				</div>
			</div>
			<!--Fin contenu principal-->

			<div id="langue">
				<form method="post" action="http://transeo-vip.com/spip.php?action=converser&amp;redirect=index.php%3Foption%3Dcom_user%26task%3Dregister">
					<input class="fr" name="var_lang" type="submit" onchange="this.parentNode.submit()" value="fr" title="Version fran&ccedil;ais"/>
					<input class="en" name="var_lang" type="submit" onchange="this.parentNode.submit()" value="en" title="English version"/>
				</form>
			</div>

			<!--pied-->
			<div id="pied">
			&copy;&nbsp;2010 Transeo | <a href="http://www.loaloa.net/">Design Loaloa Studio</a>  | <a href="#" rel="nofollow" class='login_modal'>Sign In</a>
			</div>
			<!--fin pied-->

		</div>
		<!--fin page-->
	</body>
</html>