package com.transceo

class MemberService {
	
	static transactional = true
	
	def int activate(Long activationId) {
		def member = Member.findByActivationId(activationId)
		if(null == member){
			return -1
		}
		if(!member.active){
			member.active = true
			member.save()
			return 1
		}
		return 0
	}
	
	def Member register(params){
		def Member member = new Member(params)
		member.subscribeDate = new Date()
		member.activationId = member.subscribeDate.getTime()
		
		if(member.validate()){
			member.save()
			// Send mail
			mailService.sendMail {
				to member.eMail
				from "no-reply@transceo.com"
				subject "Activate your account"
				body( view:"/mail/subscribe", 
						plugin:"email-confirmation", 
						model:[member:member])
			}
		}
		return member
	}
}
