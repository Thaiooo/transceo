package com.transceo

class CustomerQuotation extends Customer{
	String eMail
	
	static constraints = {
		eMail(email:true, nullable: false, blank: false)
	}
}
