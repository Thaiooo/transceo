package com.transceo

class MemberService {
	static transactional = true
	def mailService
	
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
	
	def sendMessageToFriends(emails, message){
		emails.each{
			def email = it
			mailService.sendMail {
				to email
				from "no-reply@transceo.com"
				subject "Sponsor"
				body message
			}
		}
	}
	
	def deleteExpireActivation () {
		def gc = new GregorianCalendar()
		gc.add(Calendar.DAY_OF_YEAR, -30)
		
		def c = Member.createCriteria()
		def results = c { 
			eq("active", true) 
			le ("subscribeDate", gc.time)
		}
		
		results.each(){ it.delete() }	
	}
}
