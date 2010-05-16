package com.transceo

class AdministratorController {
	def login = {
		println params
		
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
}
