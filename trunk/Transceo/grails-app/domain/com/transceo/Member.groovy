package com.transceo

import java.util.HashSet;

class Member extends CustomerQuotation {
	String adresse
	String city
	Integer postal
	String country
	String code
	String password
	boolean active
	int miles = 0
	int friendMiles = 0
	Date subscribeDate
	Long activationId
	Member sponsor
	Set<Member> friends = new HashSet<Member>()
	Set<SpecialCondition> specialeConditions = new HashSet<SpecialCondition>()
	
	static hasMany = [ friends: Member, specialeConditions: SpecialCondition]
	static mappedBy = [specialeConditions: "member"]
	
	static mapping = {
		version true
	}
	
	static constraints = {
		phoneNumber(nullable: false, blank: false)
		adresse(nullable: false, blank: false)
		city(nullable: false, blank: false)
		postal(nullable: false, blank: false)
		country(nullable: false, blank: false)
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
