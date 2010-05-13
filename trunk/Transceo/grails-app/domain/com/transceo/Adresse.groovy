package com.transceo

class Adresse {
	String adresse
	String city
	Integer postal
	String country
	
	static constraints = {
		adresse(nullable: false, blank: false)
		city(nullable: false, blank: false)
		postal(nullable: false, blank: false)
		country(nullable: false, blank: false)
	}
}
