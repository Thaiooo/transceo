package com.transceo

class SpecialCondition {
	Date startDate
	Date endDate
	String description
	double rate
	
	static constraints = {
		startDate(nullable: false)
		endDate(nullable: true)
		description(nullable: true)
		rate(nullable: false)
	}
}
