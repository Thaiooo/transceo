package com.transceo

import org.hsqldb.lib.HashSet;

class Member extends Customer {
	String password
	boolean active
	String eMail
	Integer number
	String street
	String city
	Integer postal
	Date subscribeDate
	Long activationId
	Set<Member> sponsorships
	
	static hasMany = [ sponsorships: Member]
	
	static mapping = {
		version true
	}
	
	static constraints = {
		password(nullable: false, blank:false)
		eMail(nullable: false, blank:false, email:true)
		street(nullable: false, blank:false)
		city(nullable: false, blank:false)
		postal(nullable: false)
		number(nullable: false)
		subscribeDate(nullable: false)
		sponsorships(nullable: true)
		activationId(nullable: false)
	}	                   
}
