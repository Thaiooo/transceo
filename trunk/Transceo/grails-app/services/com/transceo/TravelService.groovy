package com.transceo

class TravelService {
	static transactional = true
	
	def create(Travel travel){
		travel.customer.save()
		travel.depart.save()
		travel.destination.save()
		travel.customer.travels.add(travel)
		travel.save()
	}
}
