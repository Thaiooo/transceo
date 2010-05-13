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
		def validate = true
		def customer = new Customer()
		customer.properties = params
		if(!customer.validate()){
			validate = false
		}
		
		def travel = new Travel()
		travel.properties = params
		travel.creationDate = new Date()
		travel.customer = customer
		travel.status = TravelStatus.RESERVE
		if(!travel.validate()){
			validate = false
		}
	
		def depart = travel.depart;
		if(depart == null || depart.validate()){
			validate = false
		}
		
		def destination = travel.destination;
		if(destination == null || destination.validate()){
			validate = false
		}

		if(!validate){
			render(view:"/travel/create", model:[customer:customer, travel:travel, depart:depart, destination:destination])
		}else{
			travelService.create(travel)
			redirect(uri:"/")
		}
	}
}
