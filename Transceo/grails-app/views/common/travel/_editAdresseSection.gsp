<fieldset class="adresse">
	<legend>${legend}
		<g:set var="selectId" value="${locationId.toString()}" />		
		<g:set var="label" value="${message(code:'label.travel.location.adresse.other')}" />
		<g:select name="location_${beanName}"
			class="adresse" 
			from="${com.transceo.Location.list(sort: 'label', order: 'asc')}"
			optionKey="id" 
			optionValue="label" 
			noSelection='["":"${label}"]'
			value="${selectId}"
			onchange="${remoteFunction(controller:'travel', action:'dispalyAdresseSection', update:adrZoneID, params:'\'beanName=' + beanName + '&id=\' + this.value')}"
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