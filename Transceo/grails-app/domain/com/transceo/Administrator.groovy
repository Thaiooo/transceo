package com.transceo

class Administrator {
	String login
	String password
	String firstName
	String lastName
	
	static mapping = {
        version true
    }
	
	static constraints = {
		login(nullable: false, blank:false, unique:true)
		password(nullable: false, blank:false)
		firstName(nullable: false, blank:false)
		lastName(nullable: false, blank:false)
	}
}
