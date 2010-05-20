package com.transceo

import groovy.util.Expando;

import org.apache.commons.lang.StringUtils;

class MemberController {
	def memberService
	def mailService
	
	def init = {
		render(view:"/member/register", model:[])		
	}
	
	def initAddFriend = {
		def user = session["USER"]
		render(view:"/member/addFriend", model:[user:user])		
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
	
	def back = {
		def criteria = session["criteria"]		
		searchMember(criteria, params)		
	}
	
	def paginate = {
		def criteria = session["criteria"]		
		searchMember(criteria, params)		
	}
	
	private searchMember(criteria, params) {
		def members = memberService.search(params)
		render(view:"/member/search", model:[criteria:criteria, members: members])
	}
	
	def activate = {
		if(StringUtils.isBlank(params.id)){
			redirect(uri:"/")
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
			redirect(
			controller: "common", 
			action: "displayMessage", 
			params:[codeMessage:"message.activate.confirmation", codeTitle:"title.activate.confirmation"]
			)
			break;
		}
	}
	
	def register = {
		def Member member = memberService.register(null, params)
		
		if(member.validate()){
			if(params.password == params.confirmPassword){
				redirect(uri:"/")
			}else{
				flash.message = "member.confirmpassword.invalidate"
				render(view:"/member/register", model:[member: member])
			}
		}else{
			render(view:"/member/register", model:[member: member])
		}
	}
	
	def registerFriend = {
		def invitation = Invitation.get(params.invitationId)
		def Member member = memberService.register(invitation.author, params)
		
		if(member.validate()){
			if(params.password == params.confirmPassword){
				redirect(uri:"/")
			}else{
				flash.message = "member.confirmpassword.invalidate"
				render(view:"/member/registerFriend", model:[invitation: invitation, member: member])
			}
		}else{
			render(view:"/member/registerFriend", model:[invitation: invitation, member: member])
		}
	}
	
	def addFriend = {
		def invitation = new Invitation(params)
		invitation.author = session["USER"]	
		invitation.code = new Date().getTime()	
		
		if(invitation.validate()){
			memberService.createInvitation(invitation)
			redirect(
			controller: "common", 
			action: "displayMessage", 
			params:[codeMessage:"message.add.friend.confirmation", codeTitle:"title.add.friend.confirmation"]
			)
		}else{
			render(view:"/member/addFriend", model:[invitation: invitation, user: session["USER"]])
		}
	}
	
	def update = {
		def o = Member.get(params.id.toLong())
		o.properties = params
		if(o.validate()){
			o.save()
			redirect(controller:"member",action:"show", id:o.id)
		} else {
			render(view:"/member/update", model:[member: o])
		}
	}
	
	def show = {
		def o = Member.get(params.id.toLong()) 
		render(view:"/member/view", model:[member: o])		
	}
	
	def initUpdate = {
		def o = Member.get(params.id.toLong()) 
		render(view:"/member/update", model:[member: o])		
	}
	
	def delete = {
		def o = Member.get(params.id.toLong())
		o.delete()
		redirect(controller:"member",action:"list")
	}
	
	def sendPassword = {
		def status = memberService.sendPasswordByMail(params.code)
		if(!status){
			flash.message = "member.code.invalidate"
			render(view:"/member/sendPassword", model:[code: params.code])
		}else{
			redirect(
			controller: "common", 
			action: "displayMessage", 
			params:[codeMessage:"message.send.password.confirmation", codeTitle:"title.send.password.confirmation"]
			)
		}
	}
	
	def initRegisterFriend = {
		def invitation = Invitation.findByIdAndCode(params.id, params.code)
		def member = new Member()
		member.eMail = invitation.eMail
		render(view:"/member/registerFriend", model:[invitation: invitation, member: member])
	}
}
