package com.transceo

class Customer{
	String firstName
	String lastName
	String firm
	String phoneNumber
	String eMail
	String adresse
	String city
	Integer postal
	String country
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
		phoneNumber(nullable: false, blank: false)
		eMail(nullable: false, blank:false, email:true)
		adresse(nullable: false, blank: false)
		city(nullable: false, blank: false)
		postal(nullable: false, blank: false)
		country(nullable: false, blank: false)
	}
}
