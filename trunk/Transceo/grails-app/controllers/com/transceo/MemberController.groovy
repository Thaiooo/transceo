package com.transceo

import groovy.util.Expando;

import org.apache.commons.lang.StringUtils;

class MemberController {
	def memberService
	
	def init = {
		render(view:"/subscribe/register", model:[])		
	}
	
	def initSponsor = {
		render(view:"/sponsoring/create", model:[])		
	}
	
	
	def search = {
		def criteria = new Member(params)		
		session["criteria"] = criteria
		searchMember(criteria, params)	
	}
	
	def sort = {
		def criteria = session["criteria"]		
		searchMember(criteria, params)		
	}
	
	private searchMember(criteria, params) {
		def members = memberService.search(params)
		render(view:"/member/list", model:[criteria:criteria, members: members])
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
		def mails = []
		if(StringUtils.isNotBlank(params.email)){
			mails.add(params.email)
		}
		def sponsor = Member.get(1)
		
		if(mails.size() > 0){
			memberService.sendMessageToFriends(mails, params.message, sponsor)
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
