package com.transceo

class Customer{
	String firstName
	String lastName
	String phoneNumber
	List<Travel> travels = new ArrayList<Travel>()
	
	static hasMany = [travels:Travel]
	
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
