package com.transceo

class TravelService {
	static transactional = true
	def mailService
	
	def create(Travel travel){
		// Send mail
		mailService.sendMail {
			to travel.customer.eMail
			from "no-reply@transceo.com"
			subject "Transceo - Rservation resume"
			body( view:"/mail/reservationResume", 
					plugin:"email-confirmation", 
					model:[travel:travel])
		}
		
		travel.customer.save()
		travel.depart.save()
		travel.destination.save()
		travel.customer.travels.add(travel)
		travel.save()
	}
	
	def findReservationToProcess(){
		def c = Travel.createCriteria()
		def results = c.list {
			eq("status", TravelStatus.RESERVE_ASK)
		}
		return results
	}
	
	def cancel(id){
		def travel = Travel.get(id)
		travel.status = TravelStatus.CANCEL
		travel.save()
	}
	
	def confirm(id, price){
		def travel = Travel.get(id)
		travel.status = TravelStatus.RESERVE_CONFIRM
		travel.price = price
		travel.save()
	}
	
	def validate(id, price){		
		def travel = Travel.get(id)
		travel.status = TravelStatus.RESERVE_TO_CONFIRM
		travel.price = price
		
		// Send mail
		mailService.sendMail {
			to travel.customer.eMail
			from "no-reply@transceo.com"
			subject "Transceo - Rservation Price"
			body( view:"/mail/reservationPrice", 
					plugin:"email-confirmation", 
					model:[travel:travel])
		}
		
		travel.save()
	}
	
	def close(id){		
		def travel = Travel.get(id)
		//travel.status = TravelStatus.SUCCESS
		
		// Distrubuer les miles
		if(travel.customer.class.name == Member.class.name){
			setMiles(travel.customer, 0, travel.price)
		}
		
		travel.save()
	}
	
	private void setMiles(customer, level, price){
		if (null != customer){
			def rateMile = RateMile.findByLevel(level)
			if(null != rateMile){
				def miles = price * (rateMile.rate / 100)
				customer.miles += miles
				setMiles(customer.sponsor, (level + 1), price)	
			}
		}
	}
	
	def findTravelToProcess(){
		def c = Travel.createCriteria()
		def results = c.list {
			eq("status", TravelStatus.RESERVE_CONFIRM)
		}
		return results
	}
}
