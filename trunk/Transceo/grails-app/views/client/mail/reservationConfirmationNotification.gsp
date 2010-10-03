<%@ page contentType="text/html"%>

<u><strong><g:message code="title.mail.reservation.notification" /></strong></u>

<p>
  	<strong><g:message code="travel.creation.date" /> : </strong> <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.creationDate}"/>
</p>
<p>    		
	<strong><g:message code="customer" /> : </strong> ${travel.customer.firstName} ${travel.customer.lastName}
</p>
<p>
	<strong><g:message code="subscribe.phoneNumber" /> : </strong>${travel.customer.phoneNumber}
</p>

<g:if test="${travel.customer.class.name != 'com.transceo.Customer'}">
	<p>
		<strong><g:message code="subscribe.eMail" /></strong> : ${travel.customer.eMail}
	</p>
</g:if>
<p>
	<strong><g:message code="travel.price" /> : </strong>${travel.price}
</p>
<p>
	<strong><g:message code="travel.date" /> : </strong><g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.travelDate}"/>
</p>
<p>
	<strong><g:message code="travel.depart" /> : </strong>${travel.depart.adresse}, ${travel.depart.postal} ${travel.depart.city}, ${travel.depart.country} 
</p>
<g:if test="${travel.destination != null}">
	<p>
		<strong><g:message code="travel.destination" /> : </strong>${travel.destination.adresse}, ${travel.destination.postal} ${travel.destination.city}, ${travel.destination.country}
	</p>
</g:if>
<p>
	<strong><g:message code="travel.comment" /> : </strong>${travel.comment}
</p>