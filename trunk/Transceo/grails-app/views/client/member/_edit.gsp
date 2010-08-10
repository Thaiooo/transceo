<script type="text/javascript">
	function closeCustomerPopup(){
		var content = $("#customer_canvas").html();
		if(content == ''){
			var url = '<g:createLink controller="member" action="showMyProfile"/>';
			$(location).attr('href',url);
		}
	}
</script>

<g:hasErrors bean="${member}">
	<div class="errors">
		<g:renderErrors bean="${member}" />
	</div>
</g:hasErrors>

<div id="formulaire_popup">
	<g:formRemote name="updateForm" update="customer_canvas" 
		url="[controller: 'member', action:'updateCustomerInformation2']"
		onComplete="closeCustomerPopup();"
	>
		<g:render template="/common/member/editMemberInformation" bean="${member}" var="customer"/>
		<p class="boutons">
			<g:submitButton class="submit" name="save" value="${message(code:'common.button.save')}" />
		</p>
	</g:formRemote>
</div>