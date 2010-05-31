package com.transceo

class RegisterGarbageJob {
	// TODO Thai: A externaliser
	def cronExpression = "0/10 0 * * * ?"
	def memberService
	
	def execute(){
		memberService.deleteExpireActivation()
	} 
}
