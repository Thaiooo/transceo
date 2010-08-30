package com.transceo

import java.io.StringWriter;

import org.apache.commons.lang.StringUtils;
import org.eclipse.mylyn.wikitext.core.parser.MarkupParser 
import org.eclipse.mylyn.wikitext.core.parser.builder.HtmlDocumentBuilder 
import org.eclipse.mylyn.wikitext.textile.core.TextileLanguage 

class PageController {
	def home = {
		def htmlContent = getContent("D:/Dev/workspace/Transceo/wiki/page_1_fr.txt")
		//redirect(uri:"/#ancre")
		render(view:"/index", model:[htmlContent: htmlContent])
	}
	
	def prestation = {
		def htmlContent = getContent("D:/Dev/workspace/Transceo/wiki/page_2_fr.txt")
		render(view:"/client/prestation", model:[htmlContent: htmlContent])
	}
	
	def vehicule = {
		def htmlContent1 = getContent("D:/Dev/workspace/Transceo/wiki/page_3_1_fr.txt")
		def htmlContent2 = getContent("D:/Dev/workspace/Transceo/wiki/page_3_2_fr.txt")
		
		render(view:"/client/vehicule", model:[htmlContent1: htmlContent1, htmlContent2: htmlContent2])
	}
	
	def changeLanguage = {
		if(StringUtils.isBlank(params.redirectController) || StringUtils.isBlank(params.redirectAction)){
			redirect(controller:"page", action:"home", params:[lang:params.lang])
		}else{
			redirect(action:params.redirectAction,controller:params.redirectController, params:[lang:params.lang])
		}
	}
	
	private getContent(String fileName){
		File f = new File(fileName)
		
		StringWriter writer = new StringWriter()
		HtmlDocumentBuilder builder = new HtmlDocumentBuilder(writer)
		builder.setEmitAsDocument(false)
		MarkupParser parser = new MarkupParser(new TextileLanguage())
		parser.setBuilder(builder)
		parser.parse(f.getText())
		def htmlContent = writer.toString()
		
		return htmlContent
	}
}
