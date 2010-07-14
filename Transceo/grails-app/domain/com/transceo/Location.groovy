package com.transceo

class Location extends Adresse {
	String label
	
	static constraints = {
		label(nullable: false, blank: false)
	}
}
