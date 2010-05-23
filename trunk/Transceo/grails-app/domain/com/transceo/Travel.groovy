package com.transceo

class Travel {
	Customer customer
	Date creationDate
	Date travelDate
	Integer travelHour
	Integer travelMinute
	Adresse depart
	Adresse destination
	TravelStatus status
	double price
	String comment
	Integer numberOfPersonne
	boolean handicap = false
	
	static constraints = {	
		travelDate(nullable: false)
		travelHour(nullable: false, max:23)
		travelMinute(nullable: false, max:59)
		depart(nullable: false)
		destination(nullable: false)
		price(nullable: false)
		customer(nullable: false)
		comment(nullable: true)
		numberOfPersonne(nullable: true)		
	}	
}
