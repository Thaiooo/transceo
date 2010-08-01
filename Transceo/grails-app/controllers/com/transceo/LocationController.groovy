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
		def adresse = Location.get(params.id)
		render(view:"/administrator/location/update", model:[adresse:adresse])
	}
	
	def create = {
		def location = new Location(params)
		if(!location.validate()){
			render(view:"/administrator/location/create", model:[adresse:location])
		}else{
			location.save()
			redirect(action: "list")
		}
	}
	
	def update = {
		def adresse = Location.get(params.id)
		adresse.properties = params
		
		if(!adresse.validate()){
			render(view:"/administrator/location/update", model:[adresse:adresse])
		}else{
			adresse.save()
			redirect(action: "list")
		}
	}
	
	def delete = {
		def adresse = Location.get(params.id)
		def nbTravel = Travel.countByDepart(adresse)
		if(nbTravel > 0){
			flash.message = "message.localisation.delete.invalidate"
			render(view:"/administrator/location/update", model:[adresse:adresse])
		}else{
			nbTravel = Travel.countByDestination(adresse)
			if(nbTravel > 0){
				flash.message = "message.localisation.delete.invalidate"
				render(view:"/administrator/location/update", model:[adresse:adresse])
			}else{
				adresse.delete()
				redirect(action: "list")
			}
		}
	}
}
