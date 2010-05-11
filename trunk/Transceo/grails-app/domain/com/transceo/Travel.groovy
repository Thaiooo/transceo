package com.transceo

class Travel {
	Customer customer
	Date creationDate
	Date travelDate
	Adress depart
	Adress destination
	TravelStatus status
	double price
	String comment
	Integer numberOfPersonne
	boolean handicap = false
	
	static constraints = {	
		travelDate(nullable: false)
		depart(nullable: false)
		destination(nullable: false)
		price(nullable: false)
		customer(nullable: false)
		comment(nullable: true)
		numberOfPersonne(nullable: true)		
	}	
}
