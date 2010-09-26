<html>
    <head>
        <title><g:message code="title.admin.member.details"/></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
    	<script type="text/javascript">
			$(function() {
				$("#tabs").tabs();
			});
		</script>
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1"><g:message code="view.member.section.profile" /></a></li>
				<g:if test="${member.class.name == com.transceo.Member.class.name}">
					<li><a href="#tabs-2"><g:message code="view.member.section.sponsor" /></a></li>
					<li><a href="#tabs-3"><g:message code="view.member.section.mile" /></a></li>
					<li><a href="#tabs-4"><g:message code="view.member.section.friend" /></a></li>
					<li><a href="#tabs-5"><g:message code="view.member.section.condition" /></a></li>
				</g:if>
				<li><a href="#tabs-6"><g:message code="view.member.section.travel" /></a></li>
			</ul>
			<div id="tabs-1">
		    	<g:render template="/common/member/viewSection2" bean="${member}" var="customer" model='["editAble":true]'/>
			</div>
			<g:if test="${member.class.name == com.transceo.Member.class.name}">
				<div id="tabs-2">
					<g:render template="/common/member/sponsor" bean="${member}"/>
				</div>
				<div id="tabs-3">
					<g:render template="/common/member/mile" bean="${member}" model='["editAble":true]'/>					
				</div>
				<div id="tabs-4">
					<g:render template="/common/member/friendsSection" bean="${member}"/>								
				</div>
				<div id="tabs-5">
					<g:render template="/administrator/member/specialeCondition" bean="${member}"/>
				</div>
			</g:if>
			<div id="tabs-6">
				<g:render template="/common/travel/listSection" bean="${member}" model="['ADMIN_VIEW':true]"/>					
			</div>
		</div>
    
    	<br/>
    	<div class="boutons">
    		<g:link class="editCustomer" controller="administrator" action="backMember"><g:message code="common.button.back"/></g:link>
    	</div>    	
    </body>
</html>