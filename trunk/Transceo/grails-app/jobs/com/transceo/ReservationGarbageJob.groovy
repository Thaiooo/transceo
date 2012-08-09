package com.transceo

import org.codehaus.groovy.grails.commons.ConfigurationHolder;

class ReservationGarbageJob {
	def config = ConfigurationHolder.config
	def cronExpression = config.transeo.reservation.purge.cron
	def travelService

	def execute(){
		try{
			println "Purge reservation..."
			travelService.deleteExpireReservation()
		}catch(Throwable e){
			println "Erreur lors de la purge des reservations expires:\n" + e.printStackTrace()
		}
	}
}
