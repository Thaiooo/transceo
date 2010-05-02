package com.transceo

import org.apache.commons.lang.StringUtils;

class MemberController {
	def memberService
	
	def init = {
		render(view:"/subscribe/register", model:[])		
	}
	
	def initSponsor = {
		render(view:"/sponsoring/create", model:[])		
	}
	
	def list = {
		def sort = params.sort
		if(sort == null){
			sort = "firstName"
		}
		def order = params.order
		if(order == null){
			order = "asc"
		}
		def offset = params.offset
		if(offset == null){
			offset = 0	
		}		
		def max=2
		
		def members = Member.list(sort:sort, order:order, offset:offset, max:max)
		render(view:"/member/list", model:[members: members])		
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
	
	def addFriends = {
		flash.message = "You can only edit yourself"
		
		def mails = []
		if(StringUtils.isNotBlank(params.email1)){
			mails.add(params.email1)
		}
		if(StringUtils.isNotBlank(params.email2)){
			mails.add(params.email2)
		}
		if(StringUtils.isNotBlank(params.email3)){
			mails.add(params.email3)
		}
		if(StringUtils.isNotBlank(params.email4)){
			mails.add(params.email4)
		}
		
		if(mails.size() > 0){
			memberService.sendMessageToFriends(mails, params.message)
		}
		
		render(view:"/sponsoring/create", model:[])
		//redirect(uri:"/")
	}
	
	def update = {
		def o = Member.get(params.id.toLong())
		o.properties = params
		if(o.validate()){
			o.save()
			redirect(controller:"member",action:"list")
		} else {
			render(view:"/member/view", model:[member: o])
		}
	}
	
	def show = {
		def o = Member.get(params.id.toLong()) 
		render(view:"/member/view", model:[member: o])		
	}
	
	def delete = {
		def o = Member.get(params.id.toLong())
		o.delete()
		redirect(controller:"member",action:"list")
	}
	
}
