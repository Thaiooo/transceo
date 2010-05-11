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
		customer.validate()
		
		def travel = new Travel()
		travel.creationDate = new Date()
		travel.customer = customer
		travel.status = TravelStatus.RESERVE
		travel.validate()
		
		render(view:"/travel/create", model:[customer:customer, travel:travel])
	}
}
