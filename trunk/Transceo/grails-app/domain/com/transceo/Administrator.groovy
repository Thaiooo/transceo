package com.transceo

class Administrator {
	String login
	String passwword
	
	static constraints = {
		login(nullable: true, blank: true)
		password(nullable: true, blank: true)
	}
}
