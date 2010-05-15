<html>
    <head>
        <title>Test</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	Test: ${session.USER}
    	<br/>
		<g:link controller="member" action="init">Register</g:link>
		<br/>
		<g:link controller="member" action="initSponsor">Sponsoring</g:link>
		<br/>
		<g:link controller="member" action="search">Search Members</g:link>
		<br/>
		<g:link controller="travel" action="initCustomerReservation">Create Customer Reservation</g:link>
		<br/>
		<g:link controller="travel" action="initMemberReservation">Create Member Reservation</g:link>
		<br/>
		<g:link controller="login">Member Login</g:link>
		<br/>
	</body>
</html>