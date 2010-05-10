package com.transceo

import groovy.util.Expando;

import org.apache.commons.lang.StringUtils;

class TravelController {
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/view", model:[travel: o])		
	}
}
