package com.transceo

class TravelController {
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/common/travel/view", model:[travel: o])
	}
	
	def initReservation = {
		render(view:"/client/reservation/main", model:[])
	}
	
	def initCustomerQuotation = {
		render(view:"/client/reservation/quotationTravel", model:[])
	}
	
	def initMemberQuotation = {
		render(view:"/client/reservation/quotationTravel", model:[customer: session[SessionConstant.USER.name()]])
	}
	
	def initCustomerBook = {
		render(view:"/client/reservation/bookTravel", model:[])
	}
	
	def initMemberBook = {
		render(view:"/client/reservation/bookTravel", model:[customer: session[SessionConstant.USER.name()]])
	}
	
	def initConfirmation = {
		def confirmation = ConfirmationCode.findByIdAndCode(params.id, params.code)
		if(confirmation == null){
			redirect(uri:"/")
		}else{
			def travel = confirmation.travel
			render(view:"/client/reservation/confirmation", model:[code: confirmation, travel:travel])
		}
	}
	
	def confirmReservation = {
		def code = ConfirmationCode.findByIdAndCode(params.id, params.code)
		if(code.travel.status == TravelStatus.QUOTATION_ASK){
			travelService.customerConfirm(code.travel)
			redirect(
			controller: "common",
			action: "displayMessage",
			params:[codeMessage:"message.book.confirmation", codeTitle:"title.book.confirmation"]
			)
		}else{
			redirect(uri:"/")
		}
	}
	
	def customerBook = {
		def validate = true
		def locationId = ""
		
		// ===============================================
		def customer 
		if(session[SessionConstant.USER.name()] != null){
			customer = Member.get(session[SessionConstant.USER.name()].id)
		}else{
			customer = new Customer()
			customer.properties = params
			if(!customer.validate()){
				validate = false
			}
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
		
		// ===============================================
		if(params.location_depart != ""){
			travel.depart = Adresse.get(params.location_depart)
			locationId = params.location_depart
		}
		def depart = travel.depart
		if(depart == null || !depart.validate()){
			validate = false
		}
		
		// ===============================================
		if(!travel.validate()){
			validate = false
		}
		
		// ===============================================
		if(!validate){
			if(params.ADMIN_VIEW == "true"){
				render(view:"/administrator/reservation/bookTravel", model:[customer:customer, travel:travel, depart:depart, locationId:locationId])
			}else{
				render(view:"/client/reservation/bookTravel", model:[customer:customer, travel:travel, depart:depart, locationId:locationId])
			}
		}else{
			travelService.create(travel)
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initCreateReservation")
			} else{
				redirect(
				controller: "common", 
				action: "displayMessage", 
				params:[codeMessage:"message.book.confirmation", codeTitle:"title.book.confirmation"]
				)
			}
		}
	}
	
	def customerReserve = {
		def validate = true
		
		// ===============================================
		def customer 
		if(session[SessionConstant.USER.name()] != null){
			customer = Member.get(session[SessionConstant.USER.name()].id)
		}else{
			customer = new CustomerQuotation()
			customer.properties = params
			if(!customer.validate()){
				validate = false
			}
		}
		
		// ===============================================
		def travel = new TravelQuotation()
		travel.properties = params
		travel.creationDate = new Date()
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			travel.travelDate = DateUtils.parseDate(params.date)
		}else{
			travel.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		travel.customer = customer
		travel.status = TravelStatus.QUOTATION_ASK
		
		// ===============================================
		def locationDepartId = ""
		if(params.location_depart != ""){
			travel.depart = Adresse.get(params.location_depart)
			locationDepartId = params.location_depart
		}
		def depart = travel.depart
		if(depart == null || !depart.validate()){
			validate = false
		}
		
		def locationDestId = "";
		// ===============================================
		if(params.location_destination != ""){
			travel.destination = Adresse.get(params.location_destination)
			locationDestId = params.location_destination
		}
		def destination = travel.destination;
		if(destination == null || !destination.validate()){
			validate = false
		}
		
		// ===============================================
		if(!travel.validate()){
			validate = false
		}
		
		// ===============================================
		if(!validate){
			if(params.ADMIN_VIEW == "true"){
				render(view:"/administrator/reservation/quotationTravel", model:[customer:customer, travel:travel, depart:depart, destination:destination, locationDepartId:locationDepartId, locationDestId:locationDestId])
			}else{
				render(view:"/client/reservation/quotationTravel", model:[customer:customer, travel:travel, depart:depart, destination:destination, locationDepartId:locationDepartId, locationDestId:locationDestId])
			}
		}else{
			travelService.create(travel)
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initCreateReservation")
			} else{
				redirect(
				controller: "common", 
				action: "displayMessage", 
				params:[codeMessage:"message.quotation.confirmation", codeTitle:"title.quotation.confirmation"]
				)
			}
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
	
	def dispalyAdresseSection = {
		if(params.id == ''){
			render(template:"/common/travel/editAdresse", model:[beanName:'depart'])
		}else{
			def adresse = Location.get(params.id)
			render(template:"/common/travel/editAdresse", model:[beanName:'depart', adresse:adresse])
		}
	}
}
