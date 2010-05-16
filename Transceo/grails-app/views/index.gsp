<html>
    <head>
        <title>Test</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	USER: ${session.USER}
    	<br/>
    	ADMIN: ${session.ADMIN}
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
		<a href="${ resource(dir:'travel', file:'chooseCustomerType.gsp') }">Blah</a>
		<br/>
		<g:link controller="login">Member Login</g:link>
		<br/>
		<g:link controller="administrator">Admin Login</g:link>
		<br/>
	</body>
</html>