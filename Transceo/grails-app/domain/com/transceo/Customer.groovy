package com.transceo

class Customer{
	String firstName
	String lastName
	String phoneNumber
	String adresse
	String city
	Integer postal
	List<Travel> travels = new ArrayList<Travel>()
	
	static hasMany = [travels:Travel]
	
	static mapping = {
		//tablePerHierarchy false
		tablePerSubclass true
		version true
	}
	
	static constraints = {
		firstName(nullable: false, blank: false)
		lastName(nullable: false, blank: false)
		phoneNumber(nullable: false, blank: false)
		adresse(nullable: false, blank: false)
		city(nullable: false, blank: false)
		postal(nullable: false, blank: false)
	}
}
