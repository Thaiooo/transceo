package com.transceo

import org.codehaus.groovy.grails.commons.ConfigurationHolder;

class RegisterGarbageJob {
	def config = ConfigurationHolder.config
	def cronExpression = config.transeo.customer.purge.cron
	def memberService
	
	def execute(){
		memberService.deleteExpireActivation()
	} 
}
