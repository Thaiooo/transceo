package com.transceo

import org.apache.commons.lang.StringUtils;

class PageController {
	def home = {
		//redirect(uri:"/#ancre")
		render(view:"/index")
	}
	
	def prestation = {
		render(view:"/client/prestation")
	}
	
	def vehicule = {
		render(view:"/client/vehicule")
	}
	
	def changeLanguage = {
		println params
		if(StringUtils.isBlank(params.redirectController) || StringUtils.isBlank(params.redirectAction)){
			redirect(controller:"page", action:"home", params:[lang:params.lang])
		}else{
			redirect(action:params.redirectAction,controller:params.redirectController, params:[lang:params.lang])
		}
	}
}
