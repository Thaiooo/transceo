<%@ page contentType="text/html"%>

<p>
	<strong><g:message code="label.reservation.notification" /></strong>
</p>
<p>    		
	<strong><g:message code="customer" /> : </strong></a>${travel.customer.firstName} ${travel.customer.lastName}
</p>
<p>
	<g:message code="subscribe.phoneNumber" /> : ${travel.customer.phoneNumber}
</p>
<p>
	<g:message code="subscribe.eMail" /> : ${travel.customer.eMail}
</p>
<p>
  	<g:message code="travel.creation.date" /> : <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.creationDate}"/>
</p>
<p>
	<g:message code="travel.date" /> : <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.travelDate}"/>
</p>
<p>
	<g:message code="travel.depart" /> : ${travel.depart.adresse} ${travel.depart.city}, ${travel.depart.country} 
</p>
<p>
	<g:message code="travel.destination" /> : ${travel.destination.adresse} ${travel.destination.city}, ${travel.destination.country}
</p>
<p>
	<g:message code="travel.comment" /> : ${travel.comment}
</p>