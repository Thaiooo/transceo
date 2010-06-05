package com.transceo


import org.apache.commons.lang.StringUtils;

class MemberController {
	def memberService
	def mailService
	
	def initRegister = {
		render(view:"/client/member/register", model:[])		
	}
	
	def initAddFriend = {
		def user = session[SessionConstant.USER.name()]
		render(view:"/client/member/addFriend", model:[user:user])		
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
				render(view:"/client/member/register", model:[member: member])
			}
		}else{
			render(view:"/client/member/register", model:[member: member])
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
				render(view:"/client/member/registerFriend", model:[invitation: invitation, member: member])
			}
		}else{
			render(view:"/client/member/registerFriend", model:[invitation: invitation, member: member])
		}
	}
	
	def addFriend = {
		def invitation = new Invitation(params)
		invitation.author = session[SessionConstant.USER.name()]	
		invitation.code = new Date().getTime()	
		
		if(invitation.validate()){
			memberService.createInvitation(invitation)
			redirect(
			controller: "common", 
			action: "displayMessage", 
			params:[codeMessage:"message.add.friend.confirmation", codeTitle:"title.add.friend.confirmation"]
			)
		}else{
			render(view:"/client/member/addFriend", model:[invitation: invitation, user: session[SessionConstant.USER.name()]])
		}
	}
	
	def update = {
		def o = Member.get(params.id.toLong())
		o.properties = params
		if(o.validate()){
			o.save()
			if(session[SessionConstant.ADMIN_VIEW.name()]){
				redirect(controller:"administrator",action:"showProfile", id:o.id)
			}else{
				redirect(controller:"member",action:"showMyProfile", id:o.id)	
			}
		} else {
			render(view:"/common/member/edit", model:[member: o])
		}
	}
	
	def showMyProfile = {
		def o = Member.get(session[SessionConstant.USER.name()].id)
		session[SessionConstant.ADMIN_VIEW.name()] = false
		render(view:"/client/member/view", model:[member: o])		
	}
	
	def initUpdateCustomerInformation = {
		def o = Member.get(params.id.toLong()) 
		render(view:"/client/member/edit", model:[member: o])		
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
			render(view:"/client/member/sendPassword", model:[code: params.code])
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
