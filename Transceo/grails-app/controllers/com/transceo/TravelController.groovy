package com.transceo

import org.codehaus.groovy.grails.web.servlet.FlashScope;

class TravelController {
	
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/common/travel/view", model:[travel: o])
	}
	
	def initCustomerReservation = {
		render(view:"/client/reservation/main", model:[])		
	}
	
	def initCustomerQuotation = {
		render(view:"/client/reservation/customerQuotation", model:[])		
	}
	
	def initCustomerBook = {
		render(view:"/client/reservation/customerBook", model:[])		
	}
	
	def initMemberReservation = {
		render(view:"/client/reservation/memberReservation", model:[member: session[SessionConstant.USER.name()]])	
	}
	
	def initConfirmation = {
		render(view:"/client/reservation/confirmation", model:[id: params.id])	
	}
	
	def confirmReservation = {
		def code = ConfirmationCode.findByIdAndCode(params.id, params.code)
		if(null == code){
			
		}else{
			code.travel.status = TravelStatus.QUOTATION_CONFIRM
			code.travel.save()
			
			redirect(
			controller: "common", 
			action: "displayMessage", 
			params:[codeMessage:"message.reservation.customer.confirmation", codeTitle:"title.reservation.customer.confirmation"]
			)	
		}
	}
	
	def customerBook = {
		println params	
		
		def validate = true
		def locationId = ""
			
		// ===============================================
		def customer = new Customer()
		customer.properties = params
		if(!customer.validate()){
			validate = false
		}
		
		// ===============================================
		def travel = new Travel()
		travel.properties = params
		travel.creationDate = new Date()
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			travel.travelDate = DateUtils.parseDate(params.date)	
		}else{
			travel.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		travel.customer = customer
		travel.status = TravelStatus.BOOK_ASK
		if(!travel.validate()){
			validate = false
		}
		
		// ===============================================
		if(params.location != ""){
			travel.depart = Adresse.get(params.location)
			locationId = params.location
		}
		def depart = travel.depart
		if(depart == null || !depart.validate()){
			validate = false
		}	
		
		// ===============================================
		if(!validate){
			if(params.ADMIN_VIEW == "true"){
				render(view:"/administrator/reservation/customerBook", model:[customer:customer, travel:travel, depart:depart, locationId:locationId])
			}else{
				render(view:"/client/reservation/customerBook", model:[customer:customer, travel:travel, depart:depart, locationId:locationId])	
			}
		}else{
			travelService.create(travel)
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initCreateReservation")
			} else{
				redirect(uri:"/")
			}
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
		travel.status = TravelStatus.QUATATION_ASK
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
			if(params.ADMIN_VIEW == "true"){
				render(view:"/administrator/reservation/customerReservation", model:[customer:customer, travel:travel, depart:depart, destination:destination])
			}else{
				render(view:"/client/reservation/customerReservation", model:[customer:customer, travel:travel, depart:depart, destination:destination])	
			}
		}else{
			travelService.create(travel)
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initCreateReservation")
			} else{
				redirect(uri:"/")
			}
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
		travel.status = TravelStatus.QUATATION_ASK
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
		travel.status = TravelStatus.QUOTATION_CONFIRM
		travel.save()
		redirect(
		controller: "common", 
		action: "displayMessage", 
		params:[codeMessage:"message.accept.confirmation", codeTitle:"title.accept.confirmation"]
		)
	}
	
	def test = {
		if(params.id == ''){
			render(template:"/common/travel/editAdresse", model:[beanName:'depart'])
		}else{
			def adresse = Location.get(params.id)
			render(template:"/common/travel/editAdresse", model:[beanName:'depart', adresse:adresse])
		}
	}
}
