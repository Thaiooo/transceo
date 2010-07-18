package com.transceo

import groovy.util.Expando;

class AdministratorController {
	def memberService
	def travelService
	
	def login = {
		if(params.login == null){
			render(view:"/administrator/login", model:[])
		}else{
			def user = Administrator.findByLoginAndPassword(params.login, params.password)
			if(user == null){
				flash.message = "login.invalidate"
				render(view:"/administrator/login", model:[userLogin:params.login])
			}else{
				session[SessionConstant.ADMIN.name()] = user
				redirect(action:"reservationMain", controller:"administrator")
			}
		}
	}
	
	def disconnect = {
		session[SessionConstant.ADMIN.name()] = null
		redirect(controller:"administrator", action:"login")
	}
	
	def initUpdateCustomerInformation = {
		def o = Customer.get(params.id.toLong())
		println o 
		render(view:"/administrator/member/edit", model:[member: o])		
	}
	
	def initUpdateReservationInformation = {
		def o = Travel.get(params.id.toLong()) 
		def locationDepartId = o.depart.id
		render(view:"/administrator/reservation/edit", model:[travel: o, depart: o.depart, destination:o.destination, locationDepartId:locationDepartId])		
	}
	
	
	def showProfile = {
		def o = Customer.get(params.id.toLong()) 		
		render(view:"/administrator/member/view", model:[member: o])		
	}
	
	def searchMember = {
		def criteria = new Expando()
		criteria.code=params.code
		criteria.firstName=params.firstName
		criteria.lastName=params.lastName
		criteria.phoneNumber=params.phoneNumber
		criteria.eMail=params.eMail
		criteria.adresse=params.adresse
		criteria.city=params.city
		criteria.postal=params.postal
		criteria.country=params.country
		
		session[SessionConstant.CRITERIA.name()] = criteria
		commonSearchMember(criteria)	
	}
	
	def sortMember = {
		def criteria = session[SessionConstant.CRITERIA.name()]
		criteria.sort=params.sort
		criteria.order=params.order
		commonSearchMember(criteria)	
	}
	
	def backMember = {
		def criteria = session[SessionConstant.CRITERIA.name()]
		commonSearchMember(criteria)		
	}
	
	def paginateMember = {
		def criteria = session[SessionConstant.CRITERIA.name()]
		criteria.offset=params.offset
		criteria.max=params.max
		session[SessionConstant.CRITERIA.name()] = criteria 
		commonSearchMember(criteria)		
	}
	
	private commonSearchMember(criteria) {
		def members = memberService.search(criteria)
		def total = memberService.countMax(criteria)
		params.offset=criteria.offset
		params.max=criteria.max
		render(view:"/administrator/member/search", model:[criteria:criteria, members: members, total: total])
	}
	
	def initCustomerReservation = {
		render(view:"/administrator/reservation/customerReservation", model:[])		
	}
	
	def initMemberReservation = {
		def member = Member.get(params.id)
		render(view:"/administrator/reservation/memberReservation", model:[member: member])
	}
	
	def closeTravel = {
		travelService.close(params.id)
		redirect(action:"reservationToProcess", controller:"administrator")		
	}
	
	def reservationToPrice = {
		def criteria = new Expando()
		criteria.status = TravelStatus.QUOTATION_ASK.name()
		criteria.max = -1 
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toPrice", model:[travels: travels])			
	}
	
	
	def sortReservationToPrice = {
		def criteria = new Expando()
		criteria.status = TravelStatus.QUOTATION_ASK.name()
		criteria.max = -1
		criteria.sort=params.sort
		criteria.order=params.order
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toPrice", model:[travels: travels])
	}
	
	def reservationToConfirm = {
		def criteria = new Expando()
		criteria.status = TravelStatus.QUOTATION_TO_CONFIRM.name()
		criteria.max = -1 
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toConfirm", model:[travels: travels])			
	}
	
	def sortReservationToConfirm = {
		def criteria = new Expando()
		criteria.status = TravelStatus.QUOTATION_TO_CONFIRM.name()
		criteria.max = -1
		criteria.sort=params.sort
		criteria.order=params.order
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toConfirm", model:[travels: travels])
	}
	
	def reservationToProcess = {
		def criteria = new Expando()
		criteria.status = TravelStatus.QUOTATION_CONFIRM.name()
		criteria.max = -1 
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toProcess", model:[travels: travels])			
	}
	
	def sortReservationToProcess = {
		def criteria = new Expando()
		criteria.status = TravelStatus.QUOTATION_CONFIRM.name()
		criteria.max = -1
		criteria.sort=params.sort
		criteria.order=params.order
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toProcess", model:[travels: travels])
	}
	
	
	def validateReservation = {
		if(params.price == null || !params.price.isInteger()){
			flash.message = "administrate.price.required" 
			def o = Travel.get(params.id.toLong()) 
			render(view:"/administrator/reservation/administrate", model:[travel: o])
		}else{
			travelService.validate(params.id, params.price.toInteger())
			redirect(action:"reservationToPrice", controller:"administrator")
		}
	}
	
	def confirmReservation = {
		travelService.confirm(params.id)
		redirect(action:"reservationToConfirm", controller:"administrator")
	}
	
	def validateAndConfirmReservation = {
		if(params.price == null || !params.price.isInteger()){
			flash.message = "administrate.price.required"
			def o = Travel.get(params.id.toLong()) 
			render(view:"/administrator/reservation/administrate", model:[travel: o])
		}else{
			travelService.confirm(params.id, params.price.toInteger())
			redirect(action:"reservationToProcess", controller:"administrator")
		}	
	}
	
	def cancelReservation = {
		travelService.cancel(params.id)
		if(session[SessionConstant.ADMIN_PAGE.name()] == 'price'){
			redirect(action:"reservationToPrice", controller:"administrator")
		}else{
			redirect(action:"reservationToConfirm", controller:"administrator")
		}
	}
	
	def cancelTravel = {
		travelService.cancel(params.id)
		redirect(action:"reservationToProcess", controller:"administrator")		
	}
	
	def reservationMain = {
		render(view:"/administrator/reservation/main", model:[])
	}
	
	def initCreateReservation = {
		render(view:"/administrator/reservation/chooseCustomerType", model:[])
	}
	
	def searchReservation = {
		def criteria = new Expando()
		criteria.code = params.code
		criteria.firstName = params.firstName
		criteria.lastName = params.lastName
		criteria.phoneNumber = params.phoneNumber
		criteria.eMail = params.eMail
		criteria.creationDateCriteria = params.creationDateCriteria
		criteria.creationDate = DateUtils.parseDate(params.creationDate)
		criteria.reservationDateCriteria = params.reservationDateCriteria
		criteria.reservationDate = DateUtils.parseDate(params.reservationDate)
		criteria.status = params.status
		session[SessionConstant.CRITERIA.name()] = criteria
		commonSearchReservation(criteria)
	}
	
	def sortReservation = {
		def criteria = session[SessionConstant.CRITERIA.name()]
		criteria.sort=params.sort
		criteria.order=params.order
		session[SessionConstant.CRITERIA.name()] =  criteria 
		commonSearchReservation(criteria)
	}
	
	def paginateReservation = {
		def criteria = session[SessionConstant.CRITERIA.name()]
		criteria.offset=params.offset
		criteria.max=params.max
		session[SessionConstant.CRITERIA.name()] = criteria 
		commonSearchReservation(criteria)		
	}
	
	def backReservation = {
		def criteria = session[SessionConstant.CRITERIA.name()]
		commonSearchReservation(criteria)		
	}
	
	private commonSearchReservation (criteria) {
		def reservations = travelService.findReservation(criteria)
		def total = travelService.countMax(criteria)
		params.offset=criteria.offset
		params.max=criteria.max
		render(view:"/administrator/reservation/search", model:[criteria:criteria, reservations:reservations, total:total])
	}
	
	
	def showForConfirmReservation = {
		session[SessionConstant.ADMIN_PAGE.name()] = 'confirm'
		def o = Travel.get(params.id.toLong()) 
		render(view:"/administrator/reservation/administrate", model:[travel: o])		
	}
	
	def showForPriceReservation = {
		session[SessionConstant.ADMIN_PAGE.name()] = 'price'
		def o = Travel.get(params.id.toLong()) 
		render(view:"/administrator/reservation/administrate", model:[travel: o, backAction:params.backAction])		
	}
	
	def showForValidateReservation = {
		session[SessionConstant.ADMIN_PAGE.name()] = 'validate'
		def o = Travel.get(params.id.toLong()) 
		render(view:"/administrator/reservation/administrate", model:[travel: o, backAction:params.backAction])		
	}
	
	def updateCustomerInformation = {
		def o = Customer.get(params.id.toLong())
		o.properties = params
		if(o.validate()){
			o.save()
			redirect(controller:"administrator",action:"showProfile", id:o.id)
		} else {
			render(view:"/administrator/member/edit", model:[member: o])
		}
	}
	
	def updateReservationInformation = {
		def o = Travel.get(params.id.toLong())
		o.properties = params
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			o.travelDate = DateUtils.parseDate(params.date)	
		}else{
			o.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		if(o.validate()){
			o.save()
			redirect(controller:"administrator",action:"showReservationDetails", id:o.id)
		} else {
			render(view:"/administrator/reservation/edit", model:[member: o])
		}
	}
	
	def showTravel = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/common/travel/view", model:[travel: o, ADMIN_VIEW: true])
	}
	
	def showReservationDetails = {
		session[SessionConstant.ADMIN_PAGE.name()] = 'details'
		def o = Travel.get(params.id.toLong()) 
		render(view:"/administrator/reservation/details", model:[travel: o, ADMIN_VIEW: true, backAction:params.backAction])
	}
}
