package com.transceo

import org.codehaus.groovy.grails.commons.ConfigurationHolder 
import org.eclipse.mylyn.wikitext.core.parser.MarkupParser 
import org.eclipse.mylyn.wikitext.core.parser.builder.HtmlDocumentBuilder 
import org.eclipse.mylyn.wikitext.textile.core.TextileLanguage 

class PageService {
	
	def config = ConfigurationHolder.config
	def directory = config.transeo.wiki.directory
	
	public String getHTMLContent(String fileName){
		File f = new File(directory + File.separator + fileName)
		if(!f.exists()){
			return ""
		}
		
		StringWriter writer = new StringWriter()
		HtmlDocumentBuilder builder = new HtmlDocumentBuilder(writer)
		builder.setEmitAsDocument(false)
		MarkupParser parser = new MarkupParser(new TextileLanguage())
		parser.setBuilder(builder)
		parser.parse(f.getText("ISO-8859-1"))
		def htmlContent = writer.toString()
		
		return htmlContent
	}
	
	public String getWikiContent(String fileName){
		File f = new File(directory + File.separator + fileName)
		if(!f.exists()){
			return ""
		}
		return f.getText("ISO-8859-1")
	}
	
	public void setWikiContent(String fileName, String wikiContent){
		def path = directory + File.separator + fileName
		File f = new File(path)
		f.write(wikiContent, "ISO-8859-1")
	}
}
