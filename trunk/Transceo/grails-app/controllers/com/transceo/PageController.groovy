package com.transceo

import org.apache.commons.lang.StringUtils;

class PageController {
	
	def pageService
	
	def home = {
		redirect(controller:"page", action:"view", id:"page_1")
	}
	
	def changeLanguage = {
		if(StringUtils.isBlank(params.redirectController) || StringUtils.isBlank(params.redirectAction)){
			redirect(controller:"page", action:"home", params:[lang:params.lang])
		}else{
			redirect(action:params.redirectAction,controller:params.redirectController, params:[lang:params.lang])
		}
	}
	
	def view = {
		def page = params.id + File.separator + "content_fr.txt"
		def htmlContent = pageService.getHTMLContent(page)
		
		def titleId = params.id + File.separator + "title_fr.txt"
		def title = pageService.getWikiContent(titleId)
		
		render(view:"/client/page/view", model:[htmlContent: htmlContent, title: title])
	}
	
	def viewColumn = {
		def page = params.id + File.separator + "content_1_fr.txt"
		def htmlContent1 = pageService.getHTMLContent(page)
		
		page = params.id + File.separator + "content_2_fr.txt"
		def htmlContent2 = pageService.getHTMLContent(page)
		
		def titleId = params.id + File.separator + "title_fr.txt"
		def title = pageService.getWikiContent(titleId)
		
		render(view:"/client/page/viewColumn", model:[htmlContent1: htmlContent1, htmlContent2: htmlContent2, title: title])
	}
}
