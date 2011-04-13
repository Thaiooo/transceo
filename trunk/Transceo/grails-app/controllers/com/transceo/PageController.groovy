package com.transceo

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

class PageController {
	
	def pageService
	
	def home = {
		redirect(controller:"page", action:"view", id:"accueil")
	}
	
	def changeLanguage = {
		session[SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME] = params.lang
		redirect(controller:"page", action:"home", params:[lang:params.lang])
	}
	
	def view = {
		def Locale local = session[SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME]
		def languageCode = "fr"
		if(null != local){
			languageCode = local.getLanguage()
		}
	
		// Charger le contenu de la page	
		def page = params.id + File.separator + "content_" + languageCode + ".txt"
		def htmlContent = pageService.getHTMLContent(page)
		
		// Charger le titre de la page
		def titleId = params.id + File.separator + "title_" + languageCode + ".txt"
		def title = pageService.getWikiContent(titleId)
		
		// Charger la description de la page
		def descriptionId = params.id + File.separator + "description_" + languageCode + ".txt"
		def description = pageService.getWikiContent(descriptionId)
		
		// Charger les mots clé de la page
		def keywordsId = params.id + File.separator + "keywords_" + languageCode + ".txt"
		def keywords = pageService.getWikiContent(keywordsId)
		
		render(view:"/client/page/view", model:[htmlContent:htmlContent, title:title, description:description, keywords:keywords])
	}
	
	def viewColumn = {
		def Locale local = session[SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME]
		def languageCode = "fr"
		if(null != local){
			languageCode = local.getLanguage()
		}
		
		// Charger le contenu de la page (colonne 1)
		def page = params.id + File.separator + "content_1_" + languageCode + ".txt"
		def htmlContent1 = pageService.getHTMLContent(page)
		
		// Charger le contenu de la page (colonne 2)
		page = params.id + File.separator + "content_2_" + languageCode + ".txt"
		def htmlContent2 = pageService.getHTMLContent(page)
		
		// Charger le titre de la page
		def titleId = params.id + File.separator + "title_" + languageCode + ".txt"
		def title = pageService.getWikiContent(titleId)
		
		// Charger la description de la page
		def descriptionId = params.id + File.separator + "description_" + languageCode + ".txt"
		def description = pageService.getWikiContent(descriptionId)
		
		// Charger les mots clé de la page
		def keywordsId = params.id + File.separator + "keywords_" + languageCode + ".txt"
		def keywords = pageService.getWikiContent(keywordsId)
		
		render(view:"/client/page/viewColumn", model:[htmlContent1:htmlContent1, htmlContent2:htmlContent2, title:title, description:description, keywords:keywords])
	}
}
