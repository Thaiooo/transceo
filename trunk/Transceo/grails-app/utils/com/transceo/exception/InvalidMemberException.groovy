package com.transceo.exception

import com.transceo.Member;

class InvalidMemberException extends Exception{
	def Member member
	
	public InvalidMemberException(Member member){
		this.member = member
	}
}
