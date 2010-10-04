<script type="text/javascript">
	$('.editCustomer').click(function() {
		var travelId = $(this).attr('id');
		var title = "<g:message code="title.member.my.profile.edit" />";
		${remoteFunction(controller:'member', action:'initUpdateCustomerInformation', update:'customer_canvas', params:'\'id=\' + travelId', onComplete:'displayCustomerPopup(title)')};
	});

	$('.changePassword').click(function() {
		var travelId = $(this).attr('id');
		var title = "<g:message code="title.member.password" />";
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

<div id="customer_canvas"></div>

<div id="view_info">
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
			<strong><g:message code="label.member.code" /></strong>
		    <label>${customer.code}</label>
	    </p>
	</g:if>
	
	<p>    		
		<strong><g:message code="label.member.firstName" /></strong>
	    <label>${customer.firstName}</label>
	</p>
	<p>
	    <strong><g:message code="label.member.lastName" /></strong>
	    <label>${customer.lastName}</label>
	</p>
	<p>
	    <strong><g:message code="label.member.firm" /></strong>
	    <label>
	    	<g:if test="${customer.firm == null}">&nbsp;</g:if>
	    	<g:else>${customer.firm}</g:else>
	    </label>
	</p>
	<p>
		<strong><g:message code="label.member.phone" /></strong>
	    <label>${customer.phoneNumber}</label>
	</p>
	<g:if test="${customer.class.name != com.transceo.Customer.class.name}">
		<p>
		    <strong><g:message code="label.member.mail" /></strong>
		    <label>${customer.eMail}</label>
		</p>
	</g:if>
	<g:if test="${customer.class.name == com.transceo.Member.class.name}">
		<p>
		    <strong><g:message code="label.member.adresse" /></strong>
		    <label>${customer.adresse}</label>
		</p>
		<p>
		    <strong><g:message code="label.member.city" /></strong>
		    <label>${customer.city}</label>
		</p>
		<p>
		    <strong><g:message code="label.member.postal" /></strong>
		    <label>${customer.postal}</label>
		</p>
		<p>
		    <strong><g:message code="label.member.country" /></strong>
		    <label><g:message code="label.country.${customer.country}" /></label>
		</p>
	</g:if>
</div>

<div class="boutons">
	<g:if test="${editAble == true}">
		<a class="editCustomer" id="${member.id}"><g:message code="label.common.button.edit" /></a>	
	</g:if>
	<g:if test="${session[com.transceo.SessionConstant.USER.name()] != null}">
		<a class="changePassword" id="${member.id}"><g:message code="label.common.button.change.password" /></a>
	</g:if>
</div>