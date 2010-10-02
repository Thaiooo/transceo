<html>
    <head>
        <title><g:message code="title.member.details"/></title>
		<meta name="layout" content="client" />
    </head>
    <body>
		<script type="text/javascript">
			$(function() {
				$("#tabs").tabs();
			});
		</script>

		<div id="tabs">
			<ul>
				<li><a href="#tabs-1"><g:message code="section.profile" /></a></li>
				<li><a href="#tabs-2"><g:message code="section.sponsor" /></a></li>
				<li><a href="#tabs-3"><g:message code="section.mile" /></a></li>
				<li><a href="#tabs-4"><g:message code="section.friend" /></a></li>
				<li><a href="#tabs-5"><g:message code="section.travel" /></a></li>
			</ul>
			<div id="tabs-1">
				<g:render template="/common/member/view" bean="${member}" var="customer" model='["editAble":true]'/>
			</div>
			<div id="tabs-2">
				<g:render template="/common/member/sponsor" bean="${member}"/>
			</div>
			<div id="tabs-3">
				<g:render template="/common/member/mile" bean="${member}"/>
			</div>
			<div id="tabs-4">
				<g:render template="/common/member/friends" bean="${member}"/>								
			</div>
			<div id="tabs-5">
				<g:render template="/client/reservation/list" bean="${member}"/>
			</div>
		</div>
		
		<!-- Pour le popup -->
		<div id="dialog-modal" title="<g:message code="title.travel.details" />" style="display: none">
			<div id="details_canvas"></div>
			<br/>
			<fieldset>
				<legend><g:message code="title.travel.map" /></legend>			
				<div id="map_canvas" style="width: 655px; height: 230px"></div>
			</fieldset>
		</div>
		<!-- Fin le popup -->
    	
    </body>
</html>