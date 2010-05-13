package com.transceo

class Adress {
	String adresse
	String city
	Integer postal
	
	static constraints = {
		adresse(nullable: false, blank: false)
		city(nullable: false, blank: false)
		postal(nullable: false, blank: false)
	}
}
