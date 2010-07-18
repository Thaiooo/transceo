package com.transceo

class LocationController {
	def list = {
		def adresses = Location.list()
		render(view:"/administrator/location/list", model:[adresses: adresses])
	}
	
	def initAdd = {
		render(view:"/administrator/location/create", model:[])
	}
	
	def initUpdate = {
		render(view:"/administrator/location/update", model:[])
	}
	
	def create = {
		redirect(action: "list")	
	}
	
	def update = {
		redirect(action: "list")	
	}
}
