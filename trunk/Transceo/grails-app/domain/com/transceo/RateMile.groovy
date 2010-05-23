package com.transceo

class RateMile {
	Integer level
	Integer rate
	
	static mapping = {
		version true
	}
	
	static constraints = {
		rate(nullable: false, max:100)
		level(nullable: false, unique: true)
	}	    
}
