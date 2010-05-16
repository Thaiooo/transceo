package com.transceo

class AdministratorController {
	def memberService
	
	def login = {
		if(params.login == null){
			render(view:"/administrator/login", model:[])
		}else{
			def user = Administrator.findByLoginAndPassword(params.login, params.password)
			if(user == null){
				flash.message = "login.invalidate"
				render(view:"/administrator/login", model:[userLogin:params.login])
			}else{
				session["ADMIN"] = user
				redirect(uri:"/")
			}
		}
	}
	
	def initCustomerReservation = {
		render(view:"/travel/customerReservation", model:[])		
	}
	
	def initMemberReservation = {
		def member = Member.get(params.id)
		render(view:"/travel/memberReservation", model:[member: member])
	}
	
	def searchMember = {
		def criteria = new Member(params)		
		session["criteria"] = criteria
		commonSearchMember(criteria, params)	
	}
	
	private commonSearchMember(criteria, params) {
		def members = memberService.search(params)
		render(view:"/member/search", model:[criteria:criteria, members: members])
	}
}
