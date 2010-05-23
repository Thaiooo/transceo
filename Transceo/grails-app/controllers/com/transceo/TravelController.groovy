package com.transceo

import org.codehaus.groovy.grails.web.servlet.FlashScope;

class TravelController {
	
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/view", model:[travel: o])		
	}
	
	def showForAdministrateReservation = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/administrateReservation", model:[travel: o])		
	}
	
	def showForAdministrateTravel = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/administrateTravel", model:[travel: o])		
	}
	
	
	def initCustomerReservation = {
		render(view:"/travel/customerReservation", model:[])		
	}
	
	def initMemberReservation = {
		if(session["USER"] == null){
			redirect(controller:"login")
		}else{
			render(view:"/travel/memberReservation", model:[member: session["USER"]])	
		}
	}
	
	def customerReserve = {
		def validate = true
		def customer = new Customer()
		customer.properties = params
		if(!customer.validate()){
			validate = false
		}
		
		def travel = new Travel()
		travel.properties = params
		travel.creationDate = new Date()
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			travel.travelDate = DateUtils.parseDate(params.date)	
		}else{
			travel.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		travel.customer = customer
		travel.status = TravelStatus.RESERVE_ASK
		if(!travel.validate()){
			validate = false
		}
		
		def depart = travel.depart;
		if(depart == null || !depart.validate()){
			validate = false
		}
		
		def destination = travel.destination;
		if(destination == null || !destination.validate()){
			validate = false
		}
		
		if(!validate){
			render(view:"/travel/customerReservation", model:[customer:customer, travel:travel, depart:depart, destination:destination])
		}else{
			travelService.create(travel)
			redirect(uri:"/")
		}
	}
	
	def memberReserve = {
		def validate = true
		def member = Member.get(session["USER"].id)
		
		def travel = new Travel()
		travel.properties = params
		travel.creationDate = new Date()
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			travel.travelDate = DateUtils.parseDate(params.date)	
		}else{
			travel.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		travel.customer = member
		travel.status = TravelStatus.RESERVE_ASK
		if(!travel.validate()){
			validate = false
		}
		def depart = travel.depart;
		if(depart == null || !depart.validate()){
			validate = false
		}
		
		def destination = travel.destination;
		if(destination == null || !destination.validate()){
			validate = false
		}
		
		if(!validate){
			render(view:"/travel/memberReservation", model:[member:member, travel:travel, depart:depart, destination:destination])
		}else{
			travelService.create(travel)
			redirect(uri:"/")
		}
	}
	
	def reservationToProcess = {
		def travels = travelService.findReservationToProcess()
		render(view:"/travel/reservationPending", model:[travels: travels])			
	}
	
	def validateReservation = {
		if(params.price == null || !params.price.isInteger()){
			flash.message = "administrate.price.required" 
			def o = Travel.get(params.id.toLong()) 
			render(view:"/travel/administrate", model:[travel: o])
		}else{
			travelService.validate(params.id, params.price.toInteger())
			redirect(action:"reservationToProcess", controller:"travel")
		}
	}
	
	def confirmReservation = {
		if(params.price == null || !params.price.isInteger()){
			flash.message = "administrate.price.required"
			def o = Travel.get(params.id.toLong()) 
			render(view:"/travel/administrate", model:[travel: o])
		}else{
			travelService.confirm(params.id, params.price.toInteger())
			redirect(action:"reservationToProcess", controller:"travel")
		}
	}
	
	def cancelReservation = {
		travelService.cancel(params.id)
		redirect(action:"reservationToProcess", controller:"travel")		
	}
	
	def travelToProcess = {
		def travels = travelService.findTravelToProcess()
		render(view:"/travel/travelPending", model:[travels: travels])			
	}
	
	def closeTravel = {
		travelService.close(params.id)
		redirect(action:"travelToProcess", controller:"travel")		
	}
}
