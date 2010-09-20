<html>
    <head>
        <title><g:message code="title.presentation" /></title>
		<meta name="layout" content="admin" />
    </head>
    <body>
    	<script type="text/javascript">
	    	$('.preview').click(function() {
	    		var wikiContent = $('#wikiContent').val();
	    		${remoteFunction(controller:'administrator', action:'previewPage', update:'preview_canvas', params:'\'id=\' + wikiContent', onComplete:'displayPreviewPopup()')};
	    	});

	    	function displayPreviewPopup(){
	    		$("#preview_canvas").dialog({
	    			title: 'Prévisualisation',
	    			width: 800,
	    			resizable: false,
	    			modal: true
	    		});
	    	}
		</script>

    	<div id="preview_canvas"></div>
    	
    	<g:set var="content" value="${wikiContent}"></g:set>
    	<div id="formulaire_reservation">
	    	<g:form name="form" controller="administrator" method="post">
				<g:hiddenField name="id" value="${id}" />    	
	    		<g:textArea class="wikiContent" id="wikiContent2" name="wikiContent1" value="${wikiContent1}"/>
	    		<g:textArea class="wikiContent" id="wikiContent2" name="wikiContent2" value="${wikiContent2}"/>
	    		<p class="boutons">
	    			<g:actionSubmit value="Annuler" action="editPageMain" />
	    			<g:actionSubmit value="Sauvegarder" action="editPageColumn" />
	    		</p>
	    	</g:form>
	    </div>
	</body>
</html>