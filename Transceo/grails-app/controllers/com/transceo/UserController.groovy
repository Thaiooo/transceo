package com.transceo

class UserController {
	def list = {
		render(view:"/administrator/user/list", model:[])
	}
	
	def initAdd = {
		render(view:"/administrator/user/create", model:[])
	}
	
	def initUpdate = {
		render(view:"/administrator/user/update", model:[])
	}
	
	def create = {
		redirect(action: "list")	
	}
	
	def update = {
		redirect(action: "list")	
	}
}
