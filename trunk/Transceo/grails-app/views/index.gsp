<html>
    <head>
        <title>Test</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	==== Partie utilisateur ====
    	<br/>
    	USER: ${session.USER}
		<br/>
		<g:link controller="login">Member Login</g:link>
		<br/>
		<g:link controller="member" action="init">Register</g:link>
		<br/>
		<g:link controller="member" action="initSponsor">Sponsoring</g:link>
		<br/>
		<g:link controller="travel" action="initCustomerReservation">Create Customer Reservation</g:link>
		<br/>
		<g:link controller="travel" action="initMemberReservation">Create Member Reservation</g:link>
		<br/>
		<br/>
		
    	==== Partie administrateur ====
		<br/>
    	ADMIN: ${session.ADMIN}
		<br/>
		<g:link controller="administrator" action="login">Admin Login</g:link>
		<br/>
		<g:link controller="member" action="search">Search Members</g:link>
		<br/>
		<a href="${ resource(dir:'travel', file:'chooseCustomerType.gsp') }">Create Reservation</a>
		<br/>
	</body>
</html>