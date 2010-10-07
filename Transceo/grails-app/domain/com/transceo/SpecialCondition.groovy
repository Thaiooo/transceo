package com.transceo

class SpecialCondition {
	String label
	Date startDate
	Date endDate
	Double value
	SpecialConditionType type
	Member member
	
	static constraints = {
		label(nullable: false, blank: false)
		startDate(nullable: false, blank: false)
		endDate(nullable: true)
		value(nullable: false, blank: false)
		type(nullable: false, blank: false)
	}
}
