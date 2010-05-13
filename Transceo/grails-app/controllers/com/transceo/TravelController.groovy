package com.transceo

import groovy.util.Expando;

import org.apache.commons.lang.StringUtils;

class TravelController {
	
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/view", model:[travel: o])		
	}
	
	def init = {
		render(view:"/travel/create", model:[])		
	}
	
	def reserve = {
		def customer = new Customer()
		customer.properties = params
		customer.validate()
		
		def travel = new Travel()
		travel.properties = params
		travel.creationDate = new Date()
		travel.customer = customer
		travel.status = TravelStatus.RESERVE
		travel.validate()
		
		if(!customer.validate() || !travel.validate() || !travel.depart.validate() || !travel.destination.validate()){
			println "ici"
			render(view:"/travel/create", model:[customer:customer, travel:travel])
		}else{
			travelService.create(travel)
			redirect(uri:"/")
		}
	}
}
