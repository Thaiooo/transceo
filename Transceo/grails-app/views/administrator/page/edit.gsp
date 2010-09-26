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
    	<div id="formulaire_page">
	    	<g:form name="form" controller="administrator" method="post">
				<g:hiddenField name="id" value="${id}" />    	
	    		<g:textArea class="wikiContent" id="wikiContent" name="wikiContent" value="${content}"/>
	    		<p class="boutons">
	    			<g:actionSubmit class="submit" value="Annuler" action="editPageMain" />
	    			<g:actionSubmit class="submit" value="Sauvegarder" action="editPage" />
	    		</p>
	    	</g:form>
	    </div>
	</body>
</html>