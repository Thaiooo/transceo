package com.transceo

class LoginController {
	def memberService
	
	def login = {
		if(params.code == null){
			render(view:"/client/login/login", model:[])
		}else{
			def user = memberService.findUser(params.code, params.password)
			if(user == null){
				flash.message = "login.invalidate"
				render(view:"/client/login/login", model:[code:params.code])
			}else{
				session[SessionConstant.USER.name()] = user
				redirect(uri:"/")
			}
		}
	}
	
	def disconnect = {
		session[SessionConstant.USER.name()] = null
		redirect(uri:"/")
	}
}
