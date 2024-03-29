package com.transceo

import org.apache.commons.lang.StringUtils;

import com.transceo.exception.InvalidConfirmationPasswordException;
import com.transceo.exception.InvalidMemberException;
import com.transceo.exception.InvalidSponsorException;

class MemberController {
	def memberService
	def mailService
	
	def initRegister = {
		render(view:"/client/member/register", model:[])
	}
	
	def initAddFriend = {
		def user = session[SessionConstant.USER.name()]
		render(template:"/client/member/addFriend", model:[user:user])
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
		
		try{
			def Member member = memberService.register(null, params)
			redirect(
			controller: "common",
			action: "displayMessage",
			params:[codeMessage:"message.register.confirmation", codeTitle:"title.register.confirmation"]
			)
		} catch (InvalidSponsorException e) {
			flash.message = "member.sponsor.invalidate"
			render(view:"/client/member/register", model:[member: e.getMember(), sponsorCode:params.sponsorCode])
		} catch (InvalidConfirmationPasswordException e) {
			flash.message = "member.confirmpassword.invalidate"
			render(view:"/client/member/register", model:[member: e.getMember(), sponsorCode:params.sponsorCode])
		} catch (InvalidMemberException e) {
			render(view:"/client/member/register", model:[member: e.getMember(), sponsorCode:params.sponsorCode])
		}
	}
	
	def registerFriend = {
		def invitation = Invitation.get(params.invitationId)
		try{
			def Member member = memberService.register(invitation.author, params)
			redirect(
			controller: "common",
			action: "displayMessage",
			params:[codeMessage:"message.register.confirmation", codeTitle:"title.register.confirmation"]
			)
		} catch (InvalidSponsorException e) {
			flash.message = "member.sponsor.invalidate"
			render(view:"/client/member/registerFriend", model:[member: e.getMember(), invitation: invitation])
		} catch (InvalidConfirmationPasswordException e) {
			flash.message = "member.confirmpassword.invalidate"
			render(view:"/client/member/registerFriend", model:[member: e.getMember(), invitation: invitation])
		} catch (InvalidMemberException e) {
			render(view:"/client/member/registerFriend", model:[member: e.getMember(), invitation: invitation])
		}
	}
	
	def addFriend = {
		def invitation = new Invitation(params)
		invitation.author = session[SessionConstant.USER.name()]	
		invitation.code = new Date().getTime()	
		
		if(invitation.validate()){
			memberService.createInvitation(invitation)
			def message = g.message(code:"message.add.friend.confirmation")
			render(message)
		}else{
			render(template:"/client/member/addFriend", model:[invitation: invitation, user: session[SessionConstant.USER.name()]])
		}
	}
	
	def updateCustomerInformation = {
		def o = Member.get(params.id.toLong())
		o.properties = params
		if(o.validate()){
			o.save()
			redirect(controller:"member",action:"showMyProfile", id:o.id)
		} else {
			render(view:"/client/member/edit", model:[member: o])
		}
	}
	
	def updateCustomerInformation2 = {
		def o = Member.get(params.id.toLong())
		o.properties = params
		if(o.validate()){
			o.save()
			render("")
		} else {
			render(view:"/client/member/_edit", model:[member: o])
		}
	}
	
	def showMyProfile = {
		def o = Member.get(session[SessionConstant.USER.name()].id)
		render(view:"/client/member/view", model:[member: o])
	}
	
	def initUpdateCustomerInformation = {
		def o = Member.get(session[SessionConstant.USER.name()].id)
		render(template:"/client/member/edit", model:[member: o])
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
		if(invitation == null){
			redirect(uri:"/")
		}else{
			def member = new Member()
			member.eMail = invitation.eMail
			render(view:"/client/member/registerFriend", model:[invitation: invitation, member: member])
		}
	}
	
	def initChangePassword = {
		render(template:"/client/member/changePassword", model:[])
	}
	
	def changePassword = {
		def success = true
		if(params.oldPassword == ''){
			flash.message = "message.old.password.required"
			success = false
		}else if(params.password == ''){
			flash.message = "message.password.required"
			success = false
		} else if(params.confirmPassword == ''){
			flash.message = "message.confirm.password.required"
			success = false
		} else if (params.confirmPassword != params.password){
			flash.message = "message.confirm.password.invalidate"
			success = false
		} else if (params.password.size() < 5){
			flash.message = "message.password.invalidate"
			success = false
		}
		if(success){
			def currentMember = session[SessionConstant.USER.name()]
			def user = memberService.findUser(currentMember.code, params.oldPassword)
			if (user == null){
				flash.message = "message.old.password.error"
				success = false
			}else{
				user.password = params.password
				user.save()
			}
		}
		
		if(success){
			redirect(
			controller: "common", 
			action: "displayMessage", 
			params:[codeMessage:"message.change.password.confirmation", codeTitle:"title.change.password.confirmation"]
			)
		}else{
			render(view:"/client/member/changePassword", model:[password: params.password, oldPassword: params.oldPassword])
		}
	}
	
	def changePassword2 = {
		def success = true
		if(params.oldPassword == ''){
			flash.message = "message.old.password.required"
			success = false
		}else if(params.password == ''){
			flash.message = "message.password.required"
			success = false
		} else if(params.confirmPassword == ''){
			flash.message = "message.confirm.password.required"
			success = false
		} else if (params.confirmPassword != params.password){
			flash.message = "message.confirm.password.invalidate"
			success = false
		} else if (params.password.size() < 5){
			flash.message = "message.password.invalidate"
			success = false
		}
		if(success){
			def currentMember = session[SessionConstant.USER.name()]
			def user = memberService.findUser(currentMember.code, params.oldPassword)
			if (user == null){
				flash.message = "message.old.password.error"
				success = false
			}else{
				user.password = params.password
				user.save()
			}
		}
		
		if(success){
			def message = g.message(code:"message.change.password.confirmation")
			render message
		}else{
			render(template:"/client/member/changePassword", model:[password: params.password, oldPassword: params.oldPassword])
		}
	}
}
