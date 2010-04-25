package com.transceo

class Customer{
	String firstName
	String lastName
	String phoneNumber
	
	static mapping = {
		//tablePerHierarchy false
		tablePerSubclass true
		version true
	}
	
	static constraints = {
		firstName(nullable: false, blank:false)
		lastName(nullable: false, blank:false)
		phoneNumber(nullable: false, blank:false)
	}
}
