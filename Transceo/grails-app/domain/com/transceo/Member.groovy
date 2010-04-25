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
	Set<Member> sponsorships = new HashSet<Member>()
	
	static hasMany = [ sponsorships: Member]
	
	static constraints = {
		password(nullable: false)		
		eMail(nullable: false, blank: false, email:true, unique: true)
		number(nullable: true, blank: true)
		street(nullable: true, blank: true)
		city(nullable: true, blank: true)
		postal(nullable: true, blank: true)
	}
}
