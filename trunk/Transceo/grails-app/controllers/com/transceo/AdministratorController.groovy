package com.transceo

import org.apache.commons.lang.StringUtils;
import org.codehaus.groovy.grails.commons.ConfigurationHolder;

import groovy.util.Expando;

class AdministratorController {
	def memberService
	def travelService
	def pageService
	
	def config = ConfigurationHolder.config
	def max = config.transeo.pagination.size.toInteger()
	
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
		render(view:"/administrator/member/edit", model:[member: o])
	}
	
	def initUpdateMile = {
		def o = Customer.get(params.id.toLong())
		render(view:"/administrator/member/editMile", model:[member: o])
	}
	
	def initUpdateReservationInformation = {
		def o = Travel.get(params.id.toLong())
		def locationDepartId = null
		if(o.depart.class.name == Location.class.name){
			locationDepartId = o.depart.id
		}
		def locationDestId
		if(o.destination != null && o.destination.class.name == Location.class.name){
			locationDestId = o.destination.id
		}
		
		render(view:"/administrator/reservation/edit", model:[travel: o, depart: o.depart, destination:o.destination, locationDepartId:locationDepartId, locationDestId:locationDestId])
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
		criteria.max=max
		session[SessionConstant.CRITERIA.name()] = criteria 
		commonSearchMember(criteria)
	}
	
	private commonSearchMember(criteria) {
		def members = memberService.search(criteria)
		def total = memberService.countMax(criteria)
		params.offset=criteria.offset
		params.max=max
		render(view:"/administrator/member/search", model:[criteria:criteria, members: members, total: total])
	}
	
	def initCreateReservation = {
		def member
		if(StringUtils.isNotBlank(params.id)){
			member = Member.get(params.id)
		}
		render(view:"/administrator/reservation/createReservation", model:[customer: member])
	}
	
	def closeTravel = {
		travelService.close(params.id)
		redirect(action:"reservationToProcess", controller:"administrator")
	}
	
	def closeReservation = {
		def o = Travel.get(params.id.toLong())
		def location = Location.get(params.location_destination)
		def validate = true
		if(params.price == null || !params.price.isDouble()){
			flash.message = "administrate.price.required"
			validate = false
		}else{
			o.price = params.price.toDouble()
		}
		if(location == null){
			def destination = new Adresse(params.destination)
			if(!destination.validate() || !validate){
				session[SessionConstant.ADMIN_PAGE.name()] = 'validate'
				render(
				view:"/administrator/reservation/administrate",
				model:[travel: o, destination:destination, locationDestId:params.location_destination, price:params.price, backAction:params.backAction]
				)
			}else{
				destination.save()
				o.destination = destination
				o.status = TravelStatus.SUCCESS
				o.save()
				redirect(action:"reservationToProcess", controller:"administrator")
			}
		}else{
			if(!validate){
				session[SessionConstant.ADMIN_PAGE.name()] = 'validate'
				render(
				view:"/administrator/reservation/administrate",
				model:[travel: o, locationDestId:params.location_destination, price:params.price, backAction:params.backAction]
				)
			}else{
				o.destination = location
				o.status = TravelStatus.SUCCESS
				o.save()
				redirect(action:"reservationToProcess", controller:"administrator")
			}
		}
	}
	
	def reservationToPrice = {
		def criteria = new Expando()
		criteria.status = [TravelStatus.QUOTATION_ASK]
		criteria.max = -1 
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toPrice", model:[travels: travels])
	}
	
	
	def sortReservationToPrice = {
		def criteria = new Expando()
		criteria.status = [TravelStatus.QUOTATION_ASK]
		criteria.max = -1
		criteria.sort=params.sort
		criteria.order=params.order
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toPrice", model:[travels: travels])
	}
	
	def reservationToConfirm = {
		def criteria = new Expando()
		criteria.status = [TravelStatus.QUOTATION_TO_CONFIRM]
		criteria.max = -1 
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toConfirm", model:[travels: travels])
	}
	
	def sortReservationToConfirm = {
		def criteria = new Expando()
		criteria.status = [TravelStatus.QUOTATION_TO_CONFIRM]
		criteria.max = -1
		criteria.sort=params.sort
		criteria.order=params.order
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toConfirm", model:[travels: travels])
	}
	
	def reservationToProcess = {
		def criteria = new Expando()
		criteria.status = [TravelStatus.QUOTATION_CONFIRM, TravelStatus.BOOK_ASK]
		criteria.max = -1 
		def travels = travelService.findReservation(criteria)
		render(view:"/administrator/reservation/toProcess", model:[travels: travels])
	}
	
	def sortReservationToProcess = {
		def criteria = new Expando()
		criteria.status = [TravelStatus.QUOTATION_CONFIRM, TravelStatus.BOOK_ASK]
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
	
	def initChooseCustomerType = {
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
		if(StringUtils.isNotBlank(params.status) && params.status != TravelStatus.ALL.name()){
			criteria.statusCode = params.status
			criteria.status = [TravelStatus.valueOf(params.status)]
		}else{
			criteria.statusCode = TravelStatus.ALL.name()
			criteria.status = []
		}
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
		criteria.max=max
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
		params.max=max
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
		render(view:"/administrator/reservation/administrate", model:[travel: o, backAction:params.backAction, ADMIN_VIEW: true])
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

	def updateMile = {
		def o = Customer.get(params.id.toLong())
		if(StringUtils.isNotBlank(params.miles) && params.miles.isInteger()){
			o.miles = params.miles.toInteger()
		}else{
			o.miles = 0
		}
		
		if(StringUtils.isNotBlank(params.friendMiles) && params.friendMiles.isInteger()){
			o.friendMiles = params.friendMiles.toInteger()
		}else{
			o.friendMiles = 0
		}
		
		if(o.validate()){
			o.save()
			redirect(controller:"administrator",action:"showProfile", id:o.id)
		} else {
			render(view:"/administrator/member/editeMile", model:[member: o])
		}
	}
	
	def updateReservationInformation = {
		def o = Travel.get(params.id.toLong())
		o.properties = params
		
		if(o.depart.class.name == Location.class.name){
			if(StringUtils.isBlank(params.location_depart)){
				// Location vers Adresse
				o.depart.discard()
				def depart = new Adresse()
				depart.properties = params.depart
				o.depart = depart
			}else{
				// Changement de location
				def depart = Location.get(params.location_depart)
				o.depart = depart
			}
		}else{
			if(StringUtils.isNotBlank(params.location_depart)){
				// Adresse vers Location
				o.depart.delete()
				def depart = Location.get(params.location_depart)
				o.depart = depart
			}
		}
		
		if(o.destination != null){
			if(o.destination.class.name == Location.class.name){
				if(StringUtils.isBlank(params.location_destination)){
					// Location vers Adresse
					o.destination.discard()
					def destination = new Adresse()
					destination.properties = params.destination
					o.destination = destination
				}else{
					// Changement de location
					def destination = Location.get(params.location_destination)
					o.destination = destination
				}
			}else{
				if(StringUtils.isNotBlank(params.location_destination)){
					// Adresse vers Location
					o.destination.delete()
					def destination = Location.get(params.location_destination)
					o.destination = destination
				}
			}
		}
		
		if(params.travelHour == null || params.travelMinute == null || !params.travelHour.isInteger() || !params.travelMinute.isInteger()){
			o.travelDate = DateUtils.parseDate(params.date)
		}else{
			o.travelDate = DateUtils.parseDateTime(params.date, Integer.valueOf(params.travelHour), Integer.valueOf(params.travelMinute))
		}
		
		def validate = true
		if(!o.validate() && validate){
			validate = false
		}
		if(!o.depart.validate() && validate){
			validate = false
		}
		if(null != o.destination && !o.destination.validate() && validate){
			validate = false
		}
		
		if(validate){
			o.depart.save()
			if(null != o.destination){
				o.destination.save()
			}
			o.save()
			redirect(controller:"administrator",action:"showReservationDetails", id:o.id)
		} else {
			o.depart.discard()
			if(null != o.destination){
				o.destination.discard()
			}
			o.discard()
			
			render(view:"/administrator/reservation/edit", 
			model:[travel: o, depart: o.depart, destination:o.destination
			, locationDepartId:params.location_depart, locationDestId:params.location_destination]
			)
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
	
	def listProperties = {
		render(view:"/administrator/properties/list", model:[])
	}
	
	def initSimulation = {
		render(view:"/administrator/reservation/simulation", model:[])
	}
	
	def editPageMain =  {
		render(view:"/administrator/page/main", model:[])
	}
	
	def initEditPage = {
		def page = params.id + File.separator + "content_fr.txt"
		def wikiContent = pageService.getWikiContent(page)
		render(view:"/administrator/page/edit", model:[wikiContent: wikiContent, id: params.id])
	}
	
	def initEditPageColum = {
		def page = params.id + File.separator + "content_1_fr.txt"
		def wikiContent1 = pageService.getWikiContent(page)
		page = params.id + File.separator + "content_2_fr.txt"
		def wikiContent2 = pageService.getWikiContent(page)
		render(view:"/administrator/page/editPageColumn", model:[wikiContent1: wikiContent1, wikiContent2: wikiContent2, id: params.id])
	}
	
	def editPage = {
		def page = params.id + File.separator + "content_fr.txt"
		pageService.setWikiContent(page, params.wikiContent)
		redirect(action:"viewPage", id:params.id)
	}
	
	def editPageColumn = {
		def page = params.id + File.separator + "content_1_fr.txt"
		pageService.setWikiContent(page, params.wikiContent1)
		page = params.id + File.separator + "content_2_fr.txt"
		pageService.setWikiContent(page, params.wikiContent2)
		redirect(action:"viewPageColumn", id:params.id)
	}
	
	def viewPage = {
		def page = params.id + File.separator + "content_fr.txt"
		def htmlContent = pageService.getHTMLContent(page)
		
		def titleId = params.id + File.separator + "title_fr.txt"
		def title = pageService.getWikiContent(titleId)
		
		render(view:"/administrator/page/view", model:[htmlContent: htmlContent, title: title, id: params.id])
	}
	
	def viewPageColumn = {
		def page = params.id + File.separator + "content_1_fr.txt"
		def htmlContent1 = pageService.getHTMLContent(page)
		
		page = params.id + File.separator + "content_2_fr.txt"
		def htmlContent2 = pageService.getHTMLContent(page)
		
		def titleId = params.id + File.separator + "title_fr.txt"
		def title = pageService.getWikiContent(titleId)
		
		render(view:"/administrator/page/viewColumn", model:[htmlContent1: htmlContent1, htmlContent2: htmlContent2,  title: title, id: params.id])
	}
	
	def previewPage = {
		def htmlContent = pageService.getPreviewHTMLContent(params.wikiContent)
		render(view:"/administrator/page/view", model:[htmlContent: htmlContent, id: params.id])
	}
	
	def initAddSpecialCondition = {
		render(view:"/administrator/member/addSpecialCondition", model:[memberId:params.id])
	}
	
	def createSpecialCondition = {
		def sp = new SpecialCondition()
		sp.properties = params
		def validate = sp.validate()
		sp.startDate = DateUtils.parseDate(params.startDate)
		sp.endDate = DateUtils.parseDate(params.endDate)
		validate = sp.validate()
		if(validate){
			def o = Member.get(params.memberId.toLong())
			sp.save()
			o.specialeConditions.add(sp)
			o.save()
			redirect(controller:"administrator",action:"showProfile", id:params.memberId)
		}else{
			render(view:"/administrator/member/addSpecialCondition", model:[memberId:params.memberId, specialCondition: sp])
		}
	}
	
	def backToCustomerProfile = {
		redirect(controller:"administrator",action:"showProfile", id:params.memberId)
	}
}
