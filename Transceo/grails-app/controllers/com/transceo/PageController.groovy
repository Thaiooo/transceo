package com.transceo

import java.io.StringWriter;

import org.apache.commons.lang.StringUtils;
import org.codehaus.groovy.grails.commons.ConfigurationHolder;
import org.eclipse.mylyn.wikitext.core.parser.MarkupParser 
import org.eclipse.mylyn.wikitext.core.parser.builder.HtmlDocumentBuilder 
import org.eclipse.mylyn.wikitext.textile.core.TextileLanguage 

class PageController {
	
	def config = ConfigurationHolder.config
	def directory = config.transeo.wiki.directory
	
	def home = {
		def htmlContent = getContent(directory + File.separator + "page_1_fr.txt")
		println htmlContent
		//redirect(uri:"/#ancre")
		render(view:"/index", model:[htmlContent: htmlContent])
	}
	
	def prestation = {
		def htmlContent = getContent(directory + File.separator + "page_2_fr.txt")
		println htmlContent
		render(view:"/client/prestation", model:[htmlContent: htmlContent])
	}
	
	def vehicule = {
		def htmlContent1 = getContent(directory + File.separator + "page_3_1_fr.txt")
		def htmlContent2 = getContent(directory + File.separator + "page_3_2_fr.txt")
		
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
