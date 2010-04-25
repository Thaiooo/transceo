package com.transceo

class MemberController {
	def mailService
	
	def init = {
		render(view:"/subscribe/register", model:[])		
	}
	
	def activate = {
		println params
		def member = Member.findByActivationId(params.id)
		member.active = true
		member.save()		
		redirect(uri:"/")
	}
	
	def register = {
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
			
			redirect(uri:"/")
		}else{
			render(view:"/subscribe/register", model:[member: member])
		}
	}
}
