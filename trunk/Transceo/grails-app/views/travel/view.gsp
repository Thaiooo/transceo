<html>
    <head>
        <title>View</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	<p>
    	Creation Date: <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.creationDate}"/>
    	</p>
    	<p>
    	Travel Date: <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.travelDate}"/>
    	</p>
    	<p>
    	Price: ${travel.price}
    	</p>
    	<p>
    	Status: ${travel.status}
    	</p>
    	<p>
    	Depart: ${travel.depart.number} ${travel.depart.street} ${travel.depart.city}, ${travel.depart.country} 
    	</p>
    	<p>
    	Destination: ${travel.destination.number} ${travel.destination.street} ${travel.destination.city}, ${travel.destination.country}
    	</p>
    	
    	<br/>
    	
    	<g:link controller="member" action="show" id="${travel.customer.id}">Retour</g:link>
    	
    </body>
</html>