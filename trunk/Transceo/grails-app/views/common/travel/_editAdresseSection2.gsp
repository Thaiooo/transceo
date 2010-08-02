<fieldset>
	<legend>${legend}
		<g:set var="selectId" value="${locationId.toString()}" />		
		<g:set var="label" value="${message(code:'travel.location.adresse.other')}" />
		<g:select name="location_${beanName}" 
			from="${com.transceo.Location.list()}"
			optionKey="id" 
			optionValue="label" 
			noSelection='["":"${label}"]'
			value="${selectId}"
			onchange="${remoteFunction(controller:'travel', action:'dispalyAdresseSection2', update:adrZoneID, params:'\'beanName=' + beanName + '&id=\' + this.value')}"
		/>
	</legend>
	
	<div id="${adrZoneID}">
		<g:render template="/common/travel/editAdresse" 
			bean="${adresse}" 
			var="adresse"  
			model='["beanName":"${beanName}"]'
		/>
	</div>
</fieldset>