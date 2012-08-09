package com.transceo

import org.codehaus.groovy.grails.commons.ConfigurationHolder;

class RegisterGarbageJob {
	def config = ConfigurationHolder.config
	def cronExpression = config.transeo.customer.purge.cron
	def memberService

	def execute(){
		try{
			println "Purge utilisateur..."
			memberService.deleteExpireActivation()
		}catch(Throwable e){
			println "Erreur lors de la purge des utilisateurs non actives:\n" + e.printStackTrace()
		}
	}
}
