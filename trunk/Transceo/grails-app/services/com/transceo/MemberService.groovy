package com.transceo

import org.apache.commons.lang.StringUtils;

class MemberService {
	static transactional = true
	def mailService
	def max = 2
	
	def int activate(Long activationId) {
		def member = Member.findByActivationId(activationId)
		if(null == member){
			return -1
		}
		if(!member.active){
			member.active = true
			member.save()
			return 1
		}
		return 0
	}
	
	def Member register(sponsor, params){
		def code = CodeSequence.get(1)
		code.sequence = code.sequence + 1
		code.save()
		def memberCode = code.sequence.toString()
		
		def Member member = new Member(params)
		member.subscribeDate = new Date()
		member.activationId = member.subscribeDate.getTime()
		member.code = memberCode.padLeft (4, "0")
		
		if(null != sponsor){
			member.sponsor = sponsor
			sponsor.friends.add(member)
		}
		
		if(member.validate()){
			if(params.password == params.confirmPassword){
				member.save()
				// Send mail
				mailService.sendMail {
					to member.eMail
					from "no-reply@transceo.com"
					subject "Activate your account"
					body( view:"/mail/subscribe", 
							plugin:"email-confirmation", 
							model:[member:member])
				}
			}
		}
		return member
	}
	
	def createInvitation(invitation){
		invitation.save()
		mailService.sendMail {
			to invitation.eMail
			from "no-reply@transceo.com"
			subject "Join Transceo"
			body( view:"/mail/invitation", 
					plugin:"email-confirmation", 
					model:[invitation:invitation])
		}
	}
	
	def sendPasswordByMail(code){
		def member = Member.findByCode(code)
		if(member == null){
			return false
		}
		mailService.sendMail {
			to member.eMail
			from "no-reply@transceo.com"
			subject "Transceo - Your password"
			body( view:"/mail/password", 
					plugin:"email-confirmation", 
					model:[member:member])
		}
		return true
	}
	
	def deleteExpireActivation () {
		def gc = new GregorianCalendar()
		gc.add(Calendar.DAY_OF_YEAR, -30)
		
		def c = Member.createCriteria()
		def results = c { 
			eq("active", true) 
			le ("subscribeDate", gc.time)
		}
		
		results.each(){ it.delete() }	
	}
	
	def List<Member> search(params){
		def sortCriteria = params.sort
		if(sortCriteria == null){
			sortCriteria = "firstName"
		}
		def orderCriteria = params.order
		if(orderCriteria == null){
			orderCriteria = "asc"
		}
		def offset = 0
		if(params.offset != null){
			offset = params.offset.toInteger()	
		}		
		
		def c = Member.createCriteria()
		def results = c.list {
			and {
				if(StringUtils.isNotBlank(params.code)){
					ilike("code", params.code)
				}
				if(StringUtils.isNotBlank(params.firstName)){
					ilike("firstName", params.firstName)
				}
				if(StringUtils.isNotBlank(params.lastName)){
					ilike("lastName", params.lastName)
				}
				if(StringUtils.isNotBlank(params.phoneNumber)){
					ilike("phoneNumber", params.phoneNumber)
				}
				if(StringUtils.isNotBlank(params.eMail)){
					ilike("eMail", params.eMail)
				}
				if(StringUtils.isNotBlank(params.adresse)){
					ilike("adresse", params.adresse)
				}
				if(StringUtils.isNotBlank(params.city)){
					ilike("city", params.city)
				}
				if(StringUtils.isNotBlank(params.postal)){
					ilike("postal", params.postal)
				}
				if(StringUtils.isNotBlank(params.postal)){
					ilike("country", params.country)
				}
			}
			firstResult(offset)
			maxResults(max)
			order(sortCriteria, orderCriteria)
		}
		return results
	}
}
