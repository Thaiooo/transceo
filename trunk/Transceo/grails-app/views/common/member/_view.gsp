<script type="text/javascript">
	$('.editCustomer').click(function() {
		var travelId = $(this).attr('id');
		var title = "Editer";
		${remoteFunction(controller:'member', action:'initUpdateCustomerInformation', update:'customer_canvas', params:'\'id=\' + travelId', onComplete:'displayCustomerPopup(title)')};
	});

	$('.changePassword').click(function() {
		var travelId = $(this).attr('id');
		var title = "Mot de passe";
		${remoteFunction(controller:'member', action:'initChangePassword', update:'customer_canvas', params:'\'id=\' + travelId', onComplete:'displayCustomerPopup(title)')};
	});

	function displayCustomerPopup(title){
		$("#customer_canvas").dialog({
			title: title,
			width: 400,
			resizable: false,
			modal: true
		});
	}

</script>

<div id="customer_canvas" title="Editer"></div>

<g:if test="${customer.class.name == com.transceo.Member.class.name}">
	<p>
		<g:message code="view.member.code" /> :
    	${customer.code}
    </p>
</g:if>
<p>    		
	<g:message code="view.member.firstName" /> :
    ${customer.firstName}
</p>
<p>
    <g:message code="view.member.lastName" /> :
    ${customer.lastName}
</p>
<p>
    <g:message code="view.member.firm" /> :
    ${customer.firm}
</p>
<p>
<g:message code="view.member.phoneNumber" /> :
    ${customer.phoneNumber}
</p>
<g:if test="${customer.class.name != com.transceo.Customer.class.name}">
	<p>
	    <g:message code="view.member.eMail" /> :
	    ${customer.eMail}
	</p>
</g:if>
<g:if test="${customer.class.name == com.transceo.Member.class.name}">
	<p>
	    <g:message code="view.member.adresse" /> :
	    ${customer.adresse}
	</p>
	<p>
	    <g:message code="view.member.city" /> :
	    ${customer.city}
	</p>
	<p>
	    <g:message code="view.member.postal" /> :
	    ${customer.postal}
	</p>
	<p>
	    <g:message code="view.member.country" /> :
	    <g:message code="country.${customer.country}" />
	</p>
</g:if>

<div class="boutons">
	<g:if test="${editAble == true}">
		<a class="editCustomer" id="${member.id}"><g:message code="common.button.edit" /></a>	
	</g:if>
	<g:if test="${session[com.transceo.SessionConstant.USER.name()] != null}">
		<a class="changePassword" id="${member.id}"><g:message code="common.button.change.password" /></a>
	</g:if>
</div>