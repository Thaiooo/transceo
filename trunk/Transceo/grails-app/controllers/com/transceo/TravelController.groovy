package com.transceo

import org.codehaus.groovy.grails.web.servlet.FlashScope;

class TravelController {
	
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/common/travel/view", model:[travel: o])		
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
		render(view:"/client/reservation/customerReservation", model:[])		
	}
	
	def initMemberReservation = {
		render(view:"/client/reservation/memberReservation", model:[member: session[SessionConstant.USER.name()]])	
	}
	
	def customerReserve = {
		println params
		
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
			render(view:"/client/reservation/customerReservation", model:[customer:customer, travel:travel, depart:depart, destination:destination])
		}else{
			travelService.create(travel)
			redirect(uri:"/")
		}
	}
	
	def memberReserve = {
		def validate = true
		def member = Member.get(session[SessionConstant.USER.name()].id)
		
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
			render(view:"/client/reservation/memberReservation", model:[member:member, travel:travel, depart:depart, destination:destination])
		}else{
			travelService.create(travel)
			redirect(uri:"/")
		}
	}	
	
	def acceptReservation = {
		def travel = travelService.findTravelByIdAndCustomerId(params.id1.toLong(), params.id2.toLong())
		travel.status = TravelStatus.RESERVE_CONFIRM
		travel.save()
		redirect(
		controller: "common", 
		action: "displayMessage", 
		params:[codeMessage:"message.accept.confirmation", codeTitle:"title.accept.confirmation"]
		)
	}
}
