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
	Set<Member> sponsorships
	
	static hasMany = [ sponsorships: Member]
	
	static constraints = {
		password(nullable: false, blank:false)
		eMail(nullable: false, blank:false, email:true)
		street(nullable: false, blank:false)
		city(nullable: false, blank:false)
		postal(nullable: false, blank:false)
		number(nullable: false, blank:false)
		sponsorships(nullable: true)
	}	                   
}
