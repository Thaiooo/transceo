package com.transceo

class TravelController {
	
	def travelService
	
	def show = {
		def o = Travel.get(params.id.toLong()) 
		render(view:"/travel/view", model:[travel: o])		
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
		travel.travelDate = DateUtils.parseDate(params.date)
		travel.customer = customer
		travel.status = TravelStatus.RESERVE
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
		travel.travelDate = DateUtils.parseDate(params.date)
		travel.customer = member
		travel.status = TravelStatus.RESERVE
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
}
