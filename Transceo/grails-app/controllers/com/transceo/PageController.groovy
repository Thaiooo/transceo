package com.transceo

import org.apache.commons.lang.StringUtils;

class PageController {
	
	def pageService
	
	def home = {
		redirect(controller:"page", action:"view", id:"acceuil")
	}
	
	def changeLanguage = {
		if(StringUtils.isBlank(params.redirectController) || StringUtils.isBlank(params.redirectAction)){
			redirect(controller:"page", action:"home", params:[lang:params.lang])
		}else{
			redirect(action:params.redirectAction,controller:params.redirectController, params:[lang:params.lang])
		}
	}
	
	def view = {
		def htmlContent = pageService.getHTMLContent(params.id + "_fr.txt")
		render(view:"/client/page/view", model:[htmlContent: htmlContent, id: params.id])
	}
	
	def viewColumn = {
		def htmlContent1 = pageService.getHTMLContent(params.id + "_1_fr.txt")
		def htmlContent2 = pageService.getHTMLContent(params.id + "_2_fr.txt")
		
		render(view:"/client/page/viewColumn", model:[htmlContent1: htmlContent1, htmlContent2: htmlContent2])
	}
}
