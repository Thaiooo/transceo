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

<g:formRemote name="updateForm" update="customer_canvas" 
	url="[controller: 'member', action:'updateCustomerInformation2']"
	onComplete="closeCustomerPopup();"
>
	<div id="editProfilePopupContent">
		<g:render template="/common/member/editMemberInformation" bean="${member}" var="customer"/>
	</div>
	<div id="buttonSection">
		<g:submitButton name="save" value="${message(code:'common.button.save')}" />
	</div>
</g:formRemote>