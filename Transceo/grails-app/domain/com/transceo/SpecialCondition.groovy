package com.transceo

class SpecialCondition {
	String label
	Date startDate
	Date endDate
	Double value
	String type
	
	static constraints = {
		label(nullable: false, blank: false)
		startDate(nullable: false, blank: false)
		endDate(nullable: true)
		value(nullable: false, blank: false)
		type(nullable: false, blank: false)
	}
}
