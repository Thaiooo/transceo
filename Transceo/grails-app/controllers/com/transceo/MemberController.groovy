package com.transceo

class MemberController {
	def mailService
	
	def init = {
		render(view:"/subscribe/register", model:[])		
	}
	
	def register = {
		def Member member = new Member(params)
		member.subscribeDate = new Date()
		
		if(member.validate()){
			member.save()
			
			// Send mail
			mailService.sendMail {
				to "quoc.thai.phan@gmail.com"
				from "quoc.thai.phan@gmail.com"
				subject "Hello Thai"
				body "This is a test"
			}
			
			redirect(uri:"/")
		}else{
			render(view:"/subscribe/register", model:[member: member])
		}
	}
}
