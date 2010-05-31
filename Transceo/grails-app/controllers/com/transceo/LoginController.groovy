package com.transceo

class LoginController {
	def login = {
		if(params.code == null){
			render(view:"/client/login/login", model:[])
		}else{
			def user = Member.findByCodeAndPassword(params.code, params.password)
			if(user == null){
				flash.message = "login.invalidate"
				render(view:"/client/login/login", model:[code:params.code])
			}else{
				session[SessionConstant.USER.name()] = user
				redirect(uri:"/")
			}
		}
	}
}
