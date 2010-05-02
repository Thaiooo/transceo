package com.transceo

import java.util.HashSet;


class Member extends Customer {
	String password
	boolean active
	String eMail
	int miles 
	Date subscribeDate
	Long activationId
	Member sponsor
	Set<Member> friends = new HashSet<Member>()
	
	static hasMany = [ friends: Member]
	
	static mapping = {
		version true
	}
	
	static constraints = {
		password(nullable: false, blank:false)
		eMail(nullable: false, blank:false, email:true)
		subscribeDate(nullable: false)
		activationId(nullable: false)
		miles(nullable: false, blank:false)
		
		sponsor(nullable: true)
	}	                   
}
