package com.transceo

import org.apache.commons.lang.StringUtils;

class MemberController {
	def mailService
	def memberService
	
	def init = {
		render(view:"/subscribe/register", model:[])		
	}
	
	def activate = {
		if(StringUtils.isBlank(params.id)){
			edirect(uri:"/")
		}
		
		def code = memberService.activate(params.id.toLong())
		switch (code) {
			case -1:
			// Id incorrecte
			redirect(uri:"/")
			break;
			case 0:
			// Deja active
			redirect(uri:"/")
			break;
			default:			
			redirect (action:"showConfirmationMessage")
			break;
		}
	}
	
	def showConfirmationMessage = {
		render(view:"/subscribe/confirmation", model:[])
	}
	
	def register = {
		def Member member = memberService.register(params)
		
		if(member.validate()){
			redirect(uri:"/")
		}else{
			render(view:"/subscribe/register", model:[member: member])
		}
	}
}
