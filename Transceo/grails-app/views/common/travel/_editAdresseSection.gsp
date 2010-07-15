<script type="text/javascript"> 
	function changeLocation(idLocation){
		${remoteFunction(action:'test',update:'adresseZone',params:'\'id=\' + idLocation')}
	}
</script>

<fieldset>
	<legend>${legend} 
		<g:set var="label" value="${message(code:'travel.location.adresse.other')}" />
		<g:select name="location" 
			from="${com.transceo.Location.list()}"
			optionKey="id" 
			optionValue="label" 
			noSelection='["":"${label}"]'
			value="${locationId}"
			onchange="changeLocation(this.value)"
		/>
	</legend>
	
	<div id="adresseZone">
		<g:render template="/common/travel/editAdresse" 
			bean="${adresse}" 
			var="adresse"  
			model='["beanName":"${beanName}"]'
		/>
	</div>
</fieldset>