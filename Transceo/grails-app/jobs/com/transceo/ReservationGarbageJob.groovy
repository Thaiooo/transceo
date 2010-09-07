package com.transceo

import org.codehaus.groovy.grails.commons.ConfigurationHolder;

class ReservationGarbageJob {
	def config = ConfigurationHolder.config
	def cronExpression = config.transeo.reservation.purge.cron
	def travelService
	
	def execute(){
		println "Purge réservation..."
		travelService.deleteExpireReservation()
	} 
}
