package com.transceo

class Administrator {
	String login
	String passwword
	
	static constraints = {
		login(nullable: false, blank:false)
		passwword(nullable: false, blank:false)
	}
}
