package com.transceo

import java.sql.Time 

class Travel {
	Customer customer
	Date creationDate
	Date travelDate
	Time travelTime
	Adress depart
	Adress destination
	TravelStatus status
	double price
	String comment
	Integer numberOfPersonne
	boolean handicap = false
	
	static constraints = {	
		travelDate(nullable: false)
		travelTime(nullable: false)
		depart(nullable: false)
		destination(nullable: false)
		price(nullable: false)
		customer(nullable: false)
		comment(nullable: true)
		numberOfPersonne(nullable: true)		
	}	
}
