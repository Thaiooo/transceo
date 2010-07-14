<script type="text/javascript"> 
	function changeLocation(idLocation){
		${remoteFunction(action:'test',update:'adresseZone',params:'\'id=\' + idLocation')}
	}
</script>

<fieldset>
	<legend>${legend} 
		<g:select name="location" 
			from="${com.transceo.Location.list()}"
			optionKey="id" 
			optionValue="label" 
			noSelection="['':'']"
			onchange="changeLocation(this.value)"
		/>
	</legend>
	
	<div id="adresseZone">
		<g:render template="/common/travel/editAdresse" 
			bean="${depart}" 
			var="adresse"  
			model='["beanName":"depart"]'
		/>
	</div>
</fieldset>