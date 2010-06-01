package com.transceo

import java.util.HashSet;

class Member extends Customer {
	String code
	String password
	boolean active
	int miles = 0
	int friendMiles = 0
	Date subscribeDate
	Long activationId
	Member sponsor
	Set<Member> friends = new HashSet<Member>()
	
	static hasMany = [ friends: Member]
	
	static mapping = {
		version true
	}
	
	static constraints = {
		password(nullable: false, blank:false, validator: {
			if (it.size() < 5) return ['invalid.size']
		})
		subscribeDate(nullable: false)
		activationId(nullable: false)
		miles(nullable: false, blank:false)
		friendMiles(nullable: false, blank:false)
		code(nullable: false, blank:false, unique:true)
		
		sponsor(nullable: true)
	}	                   
}
