package com.transceo.exception

import com.transceo.Member;

class InvalidConfirmationPasswordException extends Exception{
	def Member member
	
	public InvalidConfirmationPasswordException(Member member){
		this.member = member
	}
}
