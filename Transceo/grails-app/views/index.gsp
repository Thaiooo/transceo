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
		<g:link controller="member" action="showMyProfile">My Profile</g:link>
		<br/>		
		<g:link controller="member" action="initRegister">Register</g:link>
		<br/>
		<a href="${ resource(dir:'member', file:'sendPassword.gsp') }">Forgot Password</a>
		<br/>
		<g:link controller="member" action="initAddFriend">Sponsoring</g:link>
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
		<g:link controller="administrator" action="searchMember">Search Members</g:link>
		<br/>
		<a href="${ resource(dir:'travel', file:'chooseCustomerType.gsp') }">Create Reservation</a>
		<br/>
		<g:link controller="administrator" action="reservationToProcess">Reservation To Price</g:link>
		<br/>
		TODO: Reservation to confirm
		<br/>
		<g:link controller="administrator" action="travelToProcess">Travel To Process</g:link>
		<br/>
		TODO: Search travel
		<br/>
		TODO: Search customer?
		<br/>
		<g:link controller="rateMile" action="list">Manage Rate Mile</g:link>
		<br/>
	</body>
</html>