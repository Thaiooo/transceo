package com.transceo

class Customer{
	String firstName
	String lastName
	String firm
	String phoneNumber
	List<Travel> travels = new ArrayList<Travel>()
	static hasMany = [travels:Travel]
	
	static mapping = {
		tablePerSubclass true
		version true
	}
	
	static constraints = {
		firstName(nullable: false, blank: false)
		lastName(nullable: false, blank: false)
		firm(nullable: true, blank: true)
		phoneNumber(nullable: true, blank: true)
	}
}
