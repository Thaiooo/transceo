package com.transceo

class ConfirmationCode{
	Travel travel
	String code
	
	static constraints = {
		travel(nullable: false)
		code(nullable: false)
	}	
}
