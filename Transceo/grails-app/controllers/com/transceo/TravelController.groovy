package com.transceo

class TravelController {
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/common/travel/view", model:[travel: o])
	}
	
	def initReservation = {
		redirect(controller:"page", action:"viewColumn", id:"page_4")
	}
	
	def initQuoteATravel = {
		render(view:"/client/reservation/createReservation", model:[])
	}
	
	def initQuoteATravelForMember = {
		render(view:"/client/reservation/createReservation", model:[customer: session[SessionConstant.USER.name()]])
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
		if(code.travel.status == TravelStatus.QUOTATION_TO_CONFIRM){
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
	
	def quoteATravel = {
		def validate = true
		
		// ===============================================
		def customer 
		
		if(params.ADMIN_VIEW == "true"){
			if(params.customerId != null){
				customer = Member.get(params.customerId.toLong())
			}else{
				customer = new CustomerQuotation()
				customer.properties = params
				if(!customer.validate()){
					validate = false
				}
			}
		}else{
			if(session[SessionConstant.USER.name()] != null){
				customer = Member.get(session[SessionConstant.USER.name()].id)
			}else{
				customer = new CustomerQuotation()
				customer.properties = params
				if(!customer.validate()){
					validate = false
				}
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
				render(view:"/administrator/reservation/createReservation", 
				model:[
				customer:customer, 
				travel:travel, 
				depart:depart, 
				destination:destination, 
				locationDepartId:locationDepartId, 
				locationDestId:locationDestId,
				reservationType: 'quote'
				]
				)
			}else{
				render(view:"/client/reservation/createReservation", 
				model:[
				customer:customer, 
				travel:travel, 
				depart:depart, 
				destination:destination, 
				locationDepartId:locationDepartId, 
				locationDestId:locationDestId,
				reservationType: 'quote'
				]
				)
			}
		}else{
			travelService.create(travel)
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initChooseCustomerType")
			} else{
				redirect(
				controller: "common", 
				action: "displayMessage", 
				params:[codeMessage:"message.quotation.confirmation", codeTitle:"title.quotation.confirmation"]
				)
			}
		}
	}
	
	def bookATravel = {
		def validate = true
		
		// ===============================================
		def customer
		
		if(params.ADMIN_VIEW == "true"){
			if(params.customerId != null){
				customer = Member.get(params.customerId.toLong())
			}else{
				customer = new Customer()
				customer.properties = params
				if(!customer.validate()){
					validate = false
				}
			}
		}else{
			if(session[SessionConstant.USER.name()] != null){
				customer = Member.get(session[SessionConstant.USER.name()].id)
			}else{
				customer = new Customer()
				customer.properties = params
				if(!customer.validate()){
					validate = false
				}
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
		if(destination != null){
			if(!destination.validate()){
				validate = false
			}
		}
		
		// ===============================================
		if(!travel.validate()){
			validate = false
		}
		
		// ===============================================
		if(!validate){
			if(params.ADMIN_VIEW == "true"){
				render(view:"/administrator/reservation/createReservation", 
				model:[
				customer:customer, 
				travel:travel, 
				depart:depart, 
				destination:destination, 
				locationDepartId:locationDepartId, 
				locationDestId:locationDestId,
				reservationType: 'reservation'
				]
				)
			}else{
				render(view:"/client/reservation/createReservation", 
				model:[
				customer:customer, 
				travel:travel, 
				depart:depart, 
				destination:destination, 
				locationDepartId:locationDepartId, 
				locationDestId:locationDestId,
				reservationType: 'reservation'
				]
				)
			}
		}else{
			travelService.create(travel)
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initChooseCustomerType")
			} else{
				redirect(
				controller: "common",
				action: "displayMessage",
				params:[codeMessage:"message.quotation.confirmation", codeTitle:"title.quotation.confirmation"]
				)
			}
		}
	}
	
	def bookOrQuoteATravel = {
		if(params.reservationType == "reservation"){
			bookATravel()
		}else{
			quoteATravel()
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
			render(template:"/common/travel/editAdresse", model:[beanName:params.beanName])
		}else{
			def adresse = Location.get(params.id)
			render(template:"/common/travel/editAdresse", model:[beanName:params.beanName, adresse:adresse])
		}
	}
	
	def dispalyAdresseSection2 = {
		if(params.id == ''){
			render(template:"/common/travel/editAdresse", model:[beanName:params.beanName])
		}else{
			def adresse = Location.get(params.id)
			render(template:"/common/travel/editAdresse", model:[beanName:params.beanName, adresse:adresse, fill:true])
		}
	}
	
	def dispalyTravelDetailsPopup = {
		def o = Travel.get(params.id.toLong())
		render(template:"/common/travel/viewDetailsSection", model:[travel: o])
	}
	
	def showFormForQuotation = {
		render(template:"/common/member/editCustomerQuotationSection", model:[])
	}
	
	def showFormForBook = {
		render(template:"/common/member/editCustomerSection", model:[])
	}
}
