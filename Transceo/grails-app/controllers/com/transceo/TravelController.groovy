package com.transceo

import groovy.util.Expando;

import org.apache.commons.lang.StringUtils;

class TravelController {
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/view", model:[travel: o])		
	}
	
	def init = {
		render(view:"/travel/create", model:[])		
	}
	
	def reserve = {
		println params
		def customer = new Customer()
		customer.properties = params
		println customer.validate()
		
		render(view:"/travel/create", model:[customer:customer])
	}
}
