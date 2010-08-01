package com.transceo.exception

import com.transceo.Member;

class InvalidSponsorException extends Exception{
	def Member member
	
	public InvalidSponsorException(Member member){
		this.member = member 
	}
}
