package com.transceo

class Invitation {
	Member author
	Long code
	String eMail
	String message
	
	static mapping = {
		version false
	}
	
	static constraints = {
		eMail(nullable: false, blank:false, email:true)
		code(nullable: false)
		author(nullable: false)
		message(nullable: true, blank: true)
	}
}
