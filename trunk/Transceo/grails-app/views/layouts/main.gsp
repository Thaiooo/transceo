<html>
	<head>
		<!-- Common -->
		<title><g:layoutTitle default="Grails" /></title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		
		<!-- Pour google map -->
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
		
		<!-- Pour jquery -->
		<link rel="stylesheet" href="${resource(dir:'css',file:'ui-lightness/jquery-ui-1.8.1.custom.css')}" />
		<g:javascript library="jquery" />
		<g:javascript src="jquery/jquery-ui-1.8.1.custom.min.js" />
	    
	    <g:layoutHead />
	</head>
	<body>
		<g:layoutBody />
	</body>
</html>