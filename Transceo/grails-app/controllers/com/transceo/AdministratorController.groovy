package com.transceo

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
				redirect(uri:"/")
			}
		}
	}
	
	def showProfile = {
		def o = Member.get(params.id.toLong()) 
		session[SessionConstant.ADMIN_VIEW.name()] = true
		render(view:"/member/view", model:[member: o])		
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
		commonSearchMember(criteria)		
	}
	
	private commonSearchMember(criteria) {
		def members = memberService.search(criteria)
		def total = memberService.countMax(criteria)
		params.offset=criteria.offset
		params.max=criteria.max
		render(view:"/member/search", model:[criteria:criteria, members: members, total: total])
	}
	
	def initCustomerReservation = {
		render(view:"/travel/customerReservation", model:[])		
	}
	
	def initMemberReservation = {
		def member = Member.get(params.id)
		render(view:"/travel/memberReservation", model:[member: member])
	}
	
	def travelToProcess = {
		def travels = travelService.findTravelToProcess()
		render(view:"/travel/travelPending", model:[travels: travels])			
	}
	
	def closeTravel = {
		travelService.close(params.id)
		redirect(action:"travelToProcess", controller:"administrator")		
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
	
}
