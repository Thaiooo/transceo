<html>
    <head>
        <title><g:message code="title.admin.page.edit" /></title>
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
				<g:hiddenField name="lang" value="${lang}" />
				
				<ul>
					<li>
			   			<label><g:message code="label.page.admin.page.title" /></label>
			   			<g:textField id="title" name="title" value="${title}"/>
			   		</li>
			   		<li>
			   			<label><g:message code="label.page.admin.page.description" /></label>
			   			<g:textField id="description" name="description" value="${description}"/>
			   		</li>
			   		<li>
			   			<label><g:message code="label.page.admin.page.keyword" /></label>
			   			<g:textField id="keywords" name="keywords" value="${keywords}"/>
			   		</li>
			   		<li>
			   			<label><g:message code="label.page.admin.page.content" /></label>
			   			<g:textArea class="wikiContent" id="wikiContent" name="wikiContent" value="${content}"/>
			   		</li>
			   	</ul>
	    		
	    		<p class="boutons">
	    			<g:actionSubmit class="submit" value="Annuler" action="editPageMain" />
	    			<g:actionSubmit class="submit" value="Sauvegarder" action="editPage" />
	    		</p>
	    	</g:form>
	    </div>
	</body>
</html>