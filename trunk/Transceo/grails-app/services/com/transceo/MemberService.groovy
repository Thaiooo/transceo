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
	
	def Member register(params){
		def Member member = new Member(params)
		member.subscribeDate = new Date()
		member.activationId = member.subscribeDate.getTime()
		
		if(member.validate()){
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
		return member
	}
	
	def sendMessageToFriends(emails, message, sponsor){
		emails.each{
			def email = it
			mailService.sendMail {
				to email
				from "no-reply@transceo.com"
				subject "Sponsor"
				body( view:"/mail/sponsor", 
						plugin:"email-confirmation", 
						model:[message:message, sponsor:sponsor])
			}
		}
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
		def offset = params.offset
		if(offset == null){
			offset = 0	
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
			}
			firstResult(offset)
			maxResults(max)
			order(sortCriteria, orderCriteria)
		}
		
		return results
		
	}
}
