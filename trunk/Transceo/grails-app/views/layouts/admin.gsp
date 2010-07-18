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
	    
	    <g:layoutHead />
	</head>

	<body class="page_sommaire">
		<div id="page">
			<div>
				<g:if test="${session.ADMIN != null}">
					${session.ADMIN.firstName} ${session.ADMIN.lastName}
				</g:if>			
			</div>
			<!--nav-->
			<ul class="nav">
				<li><g:link controller="administrator" action="searchMember" title="Search Members">Members</g:link></li>
				<li class="art3"><g:link controller="administrator" action="reservationMain" title="Manage reservation">Reservation</g:link></li>
				<li class="art5"><g:link controller="rateMile" action="list" title="Properties">Properties</g:link></li>
				<li class="art5"><g:link controller="user" action="list" title="Manage user">User</g:link></li>
				<li class="art5"><g:link controller="location" action="list" title="Manage location">Adresse</g:link></li>
				<li class="art7"><g:link controller="administrator" action="disconnect" title="Manage reservation">Disconnect</g:link></li>
			</ul>
			<!--fin nav-->

			<!--Contenu principal-->
			<div id="contenu">
				<div class="crayon article-titre-1  titre"><h2><g:layoutTitle default="Grails" /></h2></div>
    			<div class="crayon article-texte-1  texte effet_slide">
					<g:layoutBody />
				</div>
				<div class="nettoyeur"></div>
			</div>
			<!--Fin contenu principal-->

			<!--pied-->
			<div id="pied">
			&copy;&nbsp;2010 Transeo | <a href="http://www.loaloa.net/">Design Loaloa Studio</a>  | <a href="#" rel="nofollow" class='login_modal'>Sign In</a>
			</div>
			<!--fin pied-->

		</div>
		<!--fin page-->
	</body>
</html>