<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><g:layoutTitle default="Grails" /></title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
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
		<g:javascript src="jquery/jquery.cycle.all.min.js" />
		<g:javascript src="jquery/jquery.pngFix.pack.js" />
		
		<script type="text/javascript"> 
			$(document).ready(function(){
		    	// Scripts de correction transparence PNG pour IE6 
		        $(document).pngFix();

		        // Scripts effet diapo
		        $('#cycle').cycle({
		        	fx: 'fade', // type de transition, ex: fade, scrollUp, shuffle, etc...
		        	timeout: 6000, 
		            delay:  -2000,
		        	next:   '#cycle', 
		            pause:   1 
		        	}); 
		    }); 

			$(function() {		
				//lancer effet sélectionné
				function runEffect(){
					//option
					var options = {};
					//lancer effet
					$(".effet_bounce").effect('bounce',options,400);
					$(".effet_slide").show('slide',options,1000);
					$(".effet_pulsate").show('pulsate',options,500);
					$(".effet_scale").show('scale',options,1200);
				};
		
				//effet bondi automatique
				$(function() {
					runEffect();
					return false;
				});
			});
		</script>
		<g:layoutHead />
	</head>

	<body class="page_article">
		<div id="page">

			<!--Entete de la page + titre du site-->
			<div id="entete">
				<a rel="start home" href="http://transeo-vip.com/" title="Home page" class="accueil"><img class="spip_logos" alt="" src="${resource(dir:'images',file:'siteon0.png')}" width="362" height="163" /> <strong class="masque">Transeo</strong></a>
				<div id="descriptif">
					<h1><p><strong>Déplacements privés avec chauffeur</strong><br/>Paris - Ile de France - Province</p></h1>
				</div>
			</div>

			<!--téléphone-->
			<div id="telephone"><a name="ancre" id="ancre"></a>Réservez un Transeo !<br/> +33 1 83 5659 83</div>

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
				<li>
					<g:link class="accueil" controller="page" action="home" title="Home page" >Accueil</g:link>
				</li>
				<li class="art3">
					<a href="<g:createLink controller="page" action="prestation" />#ancre" title="Prestations" >Prestations</a>
				</li>
				<li class="art4">
					<a href="<g:createLink controller="page" action="vehicule" />#ancre" title="Chauffeurs-véhicules" >Chauffeurs-véhicules</a>
				</li>
				<li class="art5">
					<a href="<g:createLink controller="travel" action="initCustomerReservation" />#ancre" title="Contact - Réservation" >Contact - Réservation</a>
				</li>
				<li class="art7">
					<g:if test="${session.USER == null}">
						<a href="<g:createLink controller="login" action="login" />#ancre" title="Manage user" >Login</a>
					</g:if>
					<g:else>
						<a href="<g:createLink controller="member" action="showMyProfile" />#ancre" title="Manage user" >Compte Client</a>
					</g:else>
				</li>
			</ul>
			<!--fin nav-->

			<a name="ancre" id="ancre"></a>			
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