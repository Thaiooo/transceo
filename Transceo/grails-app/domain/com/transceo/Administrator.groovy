package com.transceo

class Administrator {
	String login
	String password
	
	static mapping = {
        version true
    }
	
	static constraints = {
		login(nullable: false, blank:false, unique:true)
		password(nullable: false, blank:false)
	}
}
