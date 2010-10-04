<%@ page contentType="text/html"%>

<u><strong><g:message code="title.mail.reservation.notification" /></strong></u>

<p>
  	<strong><g:message code="label.travel.creation.date" /> : </strong> <g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.creationDate}"/>
</p>
<p>    		
	<strong><g:message code="label.mail.customer" /> : </strong> ${travel.customer.firstName} ${travel.customer.lastName}
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
	<strong><g:message code="label.travel.date" /> : </strong><g:formatDate format="yyyy-MM-dd HH:mm" date="${travel.travelDate}"/>
</p>
<p>
	<strong><g:message code="label.travel.price" /> : </strong>${travel.price}
</p>
<p>
	<strong><g:message code="label.travel.depart" /> : </strong>${travel.depart.adresse}, ${travel.depart.postal} ${travel.depart.city}, ${travel.depart.country} 
</p>
<g:if test="${travel.customer.class.name != 'com.transceo.Customer'}">
	<p>
		<strong><g:message code="label.travel.destination" /> : </strong>${travel.destination.adresse}, ${travel.destination.postal} ${travel.destination.city}, ${travel.destination.country}
	</p>
</g:if>
<p>
	<strong><g:message code="label.travel.comment" /> : </strong>${travel.comment}
</p>
<p>
	<g:link controller="travel" action="initConfirmation" id="${code.id}" absolute ="true" params="[code:code.code]">Confirm</g:link>
</p>