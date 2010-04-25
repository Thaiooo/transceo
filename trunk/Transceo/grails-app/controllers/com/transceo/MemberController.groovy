package com.transceo

class MemberController {
	def init = {
		println "test " + params
		render(view:"/subscribe/register", model:[])		
	}
	
	def register = {
		println "test2 " + params
		def member = new Member(params)
		if(member.validate()){
			member.save()
			println "Yes"
		}
		render(view:"/subscribe/register", model:[member: member])		
	}
}
