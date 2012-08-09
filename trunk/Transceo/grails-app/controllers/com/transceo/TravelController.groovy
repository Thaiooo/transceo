package com.transceo

import org.apache.commons.lang.StringUtils;

import com.sun.org.apache.xml.internal.security.c14n.helper.C14nHelper;

class TravelController {
	def travelService

	def show = {
		def o = Travel.get(params.id.toLong())
		render(view:"/common/travel/view", model:[travel: o])
	}

	def initReservation = {
		redirect(controller:"page", action:"view", id:"contact-reservation")
	}

	def initBookEtape1 = {
		def travel = session[SessionConstant.TRAVEL.name()]
		def locationDepartId = null
		def depart = null
		def locationDestId = null
		def destination = null
		def reservationType = params.reservationType
		if(null == travel){
			travel = new Travel()
		}else{
			if(travel.class.name == TravelQuotation.class.name){
				reservationType = ReservationType.PRICING.name()
			}
			depart = travel.depart
			locationDepartId = depart.id
			destination = travel.destination
			if(destination != null){
				locationDestId = destination.id
			}
		}

		if(StringUtils.isNotBlank(params.travelHour)){
			travel.travelHour = Integer.parseInt(params.travelHour)
		}
		if(StringUtils.isNotBlank(params.travelMinute)){
			travel.travelMinute = Integer.parseInt(params.travelMinute)
		}
		if(StringUtils.isNotBlank(params.numberOfPersonne)){
			travel.numberOfPersonne = Integer.parseInt(params.numberOfPersonne)
		}
		if(StringUtils.isNotBlank(params.travelDate)){
			travel.travelDate = DateUtils.parseDate(params.travelDate)
		}

		render(
				view:"/client/reservation/reservationEtape1",
				model:[
					travel:travel,
					depart:depart,
					destination:destination,
					locationDepartId:locationDepartId,
					locationDestId:locationDestId,
					reservationType: reservationType]
				)
	}

	def initBookEtape2 = {
		def travel = session[SessionConstant.TRAVEL.name()]
		if(null == travel){
			redirect(controller: "travel", action: "initBookEtape1")
		}

		def reservationType
		if(travel.class.name == Travel.class.name){
			reservationType = ReservationType.BOOKING.name()
		}else{
			reservationType = ReservationType.PRICING.name()
		}
		render(view:"/client/reservation/reservationEtape2", model:[reservationType: reservationType, customer: session[SessionConstant.USER.name()]])
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
							reservationType: ReservationType.PRICING.name()
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
							reservationType: ReservationType.PRICING.name()
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

	def bookEtape1 = {
		def validate = true

		// ===============================================
		def travel
		if(StringUtils.equals(params.reservationType, ReservationType.BOOKING.name())){
			travel = new Travel()
			travel.properties = params
			travel.status = TravelStatus.BOOK_ASK
		}else{
			travel = new TravelQuotation()
			travel.properties = params
			travel.status = TravelStatus.QUOTATION_ASK
		}
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			travel.travelDate = DateUtils.parseDate(params.date)
		}else{
			travel.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		travel.creationDate = new Date()

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

		if(travel.hasErrors()) {
			if(travel.errors.getErrorCount() == 1) {
				validate = true
			}
		}

		// ===============================================
		if(!validate){
			if(params.ADMIN_VIEW == "true"){
				render(view:"/administrator/reservation/reservationEtape1",
						model:[
							travel:travel,
							depart:depart,
							destination:destination,
							locationDepartId:locationDepartId,
							locationDestId:locationDestId,
							reservationType: params.reservationType
						]
						)
			}else{
				render(view:"/client/reservation/reservationEtape1",
						model:[
							travel:travel,
							depart:depart,
							destination:destination,
							locationDepartId:locationDepartId,
							locationDestId:locationDestId,
							reservationType: params.reservationType
						]
						)
			}
		}else{
			session[SessionConstant.TRAVEL.name()] = travel
			if(params.ADMIN_VIEW == "true"){
				redirect(controller: "administrator", action: "initChooseCustomerType")
			} else{
				redirect(controller: "travel", action: "initBookEtape2")
			}
		}
	}

	def bookEtape2 = {
		def validate = true

		// ===============================================
		def travel = session[SessionConstant.TRAVEL.name()]

		if(travel == null){
			redirect(controller: "travel", action: "initBookEtape1")
		}else{

			try{
				travel.creationDate = new Date()

				// ===============================================
				def customer
				def reservationType

				if(travel.class.name == Travel.class.name){
					reservationType = ReservationType.BOOKING.name()
				}else{
					reservationType = ReservationType.PRICING.name()
				}

				if(params.ADMIN_VIEW == "true"){
					if(params.customerId != null){
						customer = Member.get(params.customerId.toLong())
					}else{
						if(travel.class.name == Travel.class.name){
							customer = new Customer()
						}else{
							customer = new CustomerQuotation()
						}
						customer.properties = params
						if(!customer.validate()){
							validate = false
						}
					}
				}else{
					if(session[SessionConstant.USER.name()] != null){
						customer = Member.get(session[SessionConstant.USER.name()].id)
					}else{
						if(travel.class.name == Travel.class.name){
							customer = new Customer()
						}else{
							customer = new CustomerQuotation()
						}
						customer.properties = params
						if(!customer.validate()){
							validate = false
						}
					}
				}
				travel.customer = customer

				// ===============================================
				if(!validate){
					if(params.ADMIN_VIEW == "true"){
						render(view:"/administrator/reservation/reservationEtape2", model:[customer:customer])
					}else{
						render(view:"/client/reservation/reservationEtape2", model:[customer:customer, reservationType:reservationType])
					}
				}else{
					travelService.create(travel)
					session[SessionConstant.TRAVEL.name()] = null
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
			}catch (Throwable e) {
				println "Erreur lors de la creation d'une reservation ou d'un devis:\n" + e.printStackTrace()
				redirect(
						controller: "common",
						action: "displayMessage",
						params:[codeMessage:"message.error", codeTitle:"title.message.error"]
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
							reservationType: ReservationType.BOOKING.name()
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
							reservationType: ReservationType.BOOKING.name()
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
		if(StringUtils.equals(params.reservationType, ReservationType.BOOKING.name())){
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
