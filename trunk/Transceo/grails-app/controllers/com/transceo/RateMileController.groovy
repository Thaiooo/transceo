package com.transceo

class RateMileController {
	def list = {
		def rates = RateMile.list(sort:"level", order:"asc")
		render(view:"/rateMile/list", model:[rates: rates])
	}
	
	def initAdd = {
		def rates = RateMile.list()
		render(view:"/rateMile/create", model:[level: rates.size()])
	}
	
	def initUpdate = {
		def rate = RateMile.get(params.id)
		render(view:"/rateMile/update", model:[rate: rate])
	}
	
	def create = {
		def rate = new RateMile(params)
		if(!rate.validate()){
			render(view:"/rateMile/create", model:[level: rate.level, rate: rate])
		}else{
			rate.save()
			redirect(action: "list")	
		}
	}
	
	def update = {
		def rate = RateMile.get(params.id)
		rate.properties = params
		if(!rate.validate()){
			render(view:"/rateMile/create", model:[level: rate.level, rate: rate])
		}else{
			rate.save()
			redirect(action: "list")	
		}
	}
}