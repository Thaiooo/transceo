package com.transceo

class LoginController {
	def login = {
		if(params.code == null){
			render(view:"/login/login", model:[])
		}else{
			def user = Member.findByCodeAndPassword(params.code, params.password)
			if(user == null){
				flash.message = "login.invalidate"
				render(view:"/login/login", model:[code:params.code])
			}else{
				session["USER"] = user
				redirect(uri:"/")
			}
		}
	}
}
