package com.transceo

class RegisterGarbageJob {
	// TODO Thai: A externaliser
	def cronExpression = "0 0/10 * * * ?"
	def memberService
	
	def execute(){
		memberService.deleteExpireActivation()
	} 
}
