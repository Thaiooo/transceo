<script type="text/javascript">
	$('#addFriend').click(function() {
		var travelId = $(this).attr('id');
		var title = "<g:message code="title.popup.register.friend" />";
		${remoteFunction(controller:'member', action:'initAddFriend', update:'friend_canvas', params:'\'id=\' + travelId', onComplete:'displayFriendPopup(title)')};
	});

	function displayFriendPopup(title){
		$("#friend_canvas").dialog({
			title: title,
			width: 400,
			resizable: false,
			modal: true
		});
	}
</script>

<div id="friend_canvas"></div>

<g:if test="${member.friends.size() == 0}">
	<g:message code="message.no.friends" />
</g:if>
<g:else>
	<table class="spip" width="300px">
    		<thead>
	    		<tr class="row_first">
				<th><g:message code="friends.firstanme" /></th>
			    <th><g:message code="friends.lasttanme" /></th>
			</tr>
		</thead>
		<tbody>
			<g:each status="i" in="${member.friends}" var="item">
				<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
					<td>${item.firstName}</td>
					<td>${item.lastName}</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:else>

<div class="boutons">
	<p>
		<a id="addFriend" ><g:message code="common.button.add" /></a>
	</p>
</div>