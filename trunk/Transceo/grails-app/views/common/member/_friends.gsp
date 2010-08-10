<script type="text/javascript">
	$('#addFriend').click(function() {
		var travelId = $(this).attr('id');
		var title = "<g:message code="title.register.friend" />";
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

<div id="friend_canvas" title="Editer"></div>

<g:if test="${member.friends.size() == 0}">
	<g:message code="message.no.friends" />
</g:if>
<g:else>
	<table border = "1">
		<thead>
			<tr>
				<th><g:message code="view.member.friends.firstanme" /></th>
			    <th><g:message code="view.member.friends.lasttanme" /></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${member.friends}">
				<tr>
					<td>${it.firstName}</td>
					<td>${it.lastName}</td>
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