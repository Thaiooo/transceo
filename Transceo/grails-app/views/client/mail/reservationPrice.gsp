<%@ page contentType="text/html"%>

Your reservation request:

<p>    		
	Customer :${travel.customer.firstName} ${travel.customer.lastName}
</p>
<p>
	<g:message code="subscribe.phoneNumber" />:${travel.customer.phoneNumber}
</p>
<p>
	<g:message code="subscribe.eMail" />:${travel.customer.eMail}
</p>
<p>
	Adresse:${travel.customer.adresse} ${travel.customer.postal} ${travel.customer.city}, ${travel.customer.country}
</p>

<p>
  	Creation Date: <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.creationDate}"/>
</p>
<p>
	Travel Date: <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.travelDate}"/>
</p>
<p>
	Status: ${travel.price}
</p>
<p>
	Depart:${travel.depart.adresse} ${travel.depart.city}, ${travel.depart.country} 
</p>
<p>
	Destination: ${travel.destination.adresse} ${travel.destination.city}, ${travel.destination.country}
</p>
<p>
	Handicap: ${travel.handicap}
</p>
<p>
	Comment: ${travel.comment}
</p>
<p>
	Confirmation Code: ${code.code}
</p>
<p>
	<g:link controller="travel" action="initConfirmation" id="${code.id}" absolute ="true">Confirm</g:link>
</p>