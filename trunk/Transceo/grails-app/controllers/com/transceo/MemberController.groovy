package com.transceo

class MemberController {
	def init = {
		println "test " + params
		render(view:"/subscribe/register", model:[])		
	}
	
	def register = {
		println "test2 " + params
		render(view:"/subscribe/register", model:[])		
	}
}
