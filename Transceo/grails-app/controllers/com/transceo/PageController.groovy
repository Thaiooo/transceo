package com.transceo

class PageController {
	def home = {
		redirect(uri:"/#ancre")			
	}
	
	def prestation = {
		render(view:"/client/prestation")
	}
	
	def vehicule = {
		render(view:"/client/vehicule")
	}
}
