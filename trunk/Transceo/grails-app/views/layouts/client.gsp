<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><g:layoutTitle default="Titre" /></title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />			
		<meta name="description" content= "Transport de personne VIP" />
		<meta name="keywords" content= "transport de personne, transport VIP, vip, transport, taxi, privé, chauffeur, transeo" />
				
		<link rel="stylesheet" href="${resource(dir:'css',file:'transeo.css')}" />
		<!--[if IE]>
		<link rel="stylesheet" href="${resource(dir:'css',file:'transeo_ie.css')}" />
		<![endif]-->
		
		<!-- Pour google map -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>

		<!-- Pour jquery -->
		<link rel="stylesheet" href="${resource(dir:'css',file:'jquery-ui-1.8.4.custom.css')}" />
		<g:javascript library="jquery" />
		<g:javascript src="jquery/jquery-ui-1.8.2.custom.min.js" />
		<g:javascript src="jquery/jquery.cycle.all.min.js" />
		<g:javascript src="jquery/jquery.pngFix.pack.js" />
		
		<script type="text/javascript"> 
			$(document).ready(function(){
				// Pour aller sur l'ancre
				//document.location="#ancre";
				
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
		
		<script type="text/javascript">
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-17878436-6']);
		  _gaq.push(['_trackPageview']);
		
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		</script>
		
		<g:layoutHead />
	</head>

	<body class="page_sommaire">
		<div id="page">

			<!--Entete de la page + titre du site-->
			<div id="entete">
				<a rel="start home" href="http://transeo-vip.com/" title="<g:message code="label.page.layout.1.1" />" class="accueil"><img class="spip_logos" alt="" src="${resource(dir:'images',file:'siteon0.png')}" width="362" height="163" /> <strong class="masque"><g:message code="label.page.layout.1.2" /></strong></a>
				<div id="descriptif">
					<h1><p><g:message code="label.page.layout.2" /></p></h1>
				</div>
			</div>

			<!--téléphone-->
			<div id="telephone"><a name="ancre" id="ancre"></a><g:message code="label.page.layout.3" /><br/>${grailsApplication.config.transeo.contact.tel}</div>

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
					<a href="<g:createLink controller="page" action="home" />#ancre" title="${message(code:'label.menu.home.alt')}" ><g:message code="label.menu.home" /></a>
				</li>
				<li class="art3">
					<a href="<g:createLink controller="page" action="view" id="page_2" />#ancre" title="${message(code:'label.menu.prestations.alt')}" ><g:message code="label.menu.prestations" /></a>
				</li>
				<li class="art4">
					<a href="<g:createLink controller="page" action="viewColumn" id="page_3"/>#ancre" title="${message(code:'label.menu.vehicule.alt')}" ><g:message code="label.menu.vehicule" /></a>
				</li>
				<li class="art5">
					<a href="<g:createLink controller="page" action="viewColumn" id="page_4"/>#ancre" title="${message(code:'label.menu.reservation.alt')}" ><g:message code="label.menu.reservation" /></a>
				</li>
				<g:if test="${session.USER == null}">
					<li class="art6">
						<a href="<g:createLink controller="member" action="initRegister" />#ancre" title="${message(code:'label.menu.register.alt')}" ><g:message code="label.menu.register" /></a>
					</li>
				</g:if>
				<li class="art7">
					<g:if test="${session.USER != null}">
						<a class="disconnect" href="<g:createLink controller="login" action="disconnect" />#ancre" title="${message(code:'label.menu.disconnect.alt')}" >
						</a>
					</g:if>
					<g:if test="${session.USER == null}">
						<a href="<g:createLink controller="login" action="login" />#ancre" title="${message(code:'label.menu.login.alt')}" ><g:message code="label.menu.login" /></a>
					</g:if>
					<g:else>
						<a href="<g:createLink controller="member" action="showMyProfile" />#ancre" title="${message(code:'label.menu.account.alt')}" ><g:message code="label.menu.account" /></a>
					</g:else>
				</li>
			</ul>
			<!--fin nav-->

			<a name="ancre" id="ancre"></a>			
			<!--Contenu principal-->
			<div id="contenu">
				<div id="article6">
					<div class="crayon article-titre-1  titre"><h2><g:layoutTitle default="Grails" /></h2></div>
	    			<div class="crayon article-texte-1  texte effet_slide">
						<g:layoutBody />
					</div>
					<div class="nettoyeur"></div>
				</div>
			</div>
			<!--Fin contenu principal-->

			<div id="langue">
				<g:form controller="page" action="changeLanguage">
					<g:hiddenField name="redirectController" value="${params.controller}" />
					<g:hiddenField name="redirectAction" value="${params.action}" />
					<input class="fr" name="lang" type="submit" value="fr" title="Version fran&ccedil;ais"/>
					<input class="en" name="lang" type="submit" value="en" title="English version"/>
				</g:form>
			</div>

			<!--pied-->
			<div id="pied">
			&copy;&nbsp;2010 Transeo | <a href="http://www.loaloa.net/">Design Loaloa Studio & T Consulting</a>
			</div>
			<!--fin pied-->

		</div>
		<!--fin page-->
	</body>
</html>