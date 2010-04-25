package com.transceo

class Customer {
	String firstName
	String lastName
	String phoneNumber
	
	static constraints = {
		firstName(nullable: true, blank: true)
		lastName(nullable: true, blank: true)
		phoneNumber(nullable: true, blank: true)
	}
}
