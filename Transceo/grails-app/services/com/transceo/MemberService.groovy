package com.transceo

import java.util.Calendar;

import org.apache.commons.lang.StringUtils;
import org.codehaus.groovy.grails.commons.ConfigurationHolder;

import com.transceo.exception.InvalidConfirmationPasswordException;
import com.transceo.exception.InvalidMemberException;
import com.transceo.exception.InvalidSponsorException;

class MemberService {
	static transactional = true
	def mailService
	def config = ConfigurationHolder.config
	def max = config.transeo.pagination.size.toInteger()
	
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
	
	def Member register(aSponsor, params) throws InvalidSponsorException, 
	InvalidConfirmationPasswordException, InvalidMemberException  {
		
		def sponsor
		def Member member = new Member(params)
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Europe/Paris"))
		member.subscribeDate = cal.getTime()
		member.activationId = member.subscribeDate.getTime()
		member.code = "0"
		member.miles = config.transeo.subscribe.point.toInteger()
		
		if(null != aSponsor){
			sponsor = aSponsor
		}else if(StringUtils.isNotBlank(params.sponsorCode)){
			sponsor = Member.findByCode(params.sponsorCode)
			if(sponsor == null){
				throw new InvalidSponsorException(member)
			}
		}
		
		if(params.password != params.confirmPassword){
			throw new InvalidConfirmationPasswordException(member)
		}
		
		// ==========================================
		
		def code = CodeSequence.get(1)
		code.sequence = code.sequence + 1
		code.save()
		def memberCode = code.sequence.toString()
		member.code = memberCode.padLeft (4, "0")
		
		if(null != sponsor){
			member.sponsor = sponsor
			sponsor.friends.add(member)
			sponsor.friendMiles = sponsor.friendMiles + config.transeo.friend.subscribe.point.toInteger()
		}
		
		if(member.validate()){
			member.save()
			// Send mail
			mailService.sendMail {
				to member.eMail
				from "no-reply@transceo.com"
				subject "Activate your account"
				body( view:"/client/mail/subscribe", 
						plugin:"email-confirmation", 
						model:[member:member])
			}
		}else{
			throw new InvalidMemberException(member)
		}
		return member
	}
	
	def createInvitation(invitation){
		invitation.save()
		mailService.sendMail {
			to invitation.eMail
			from "no-reply@transceo.com"
			subject "Join Transceo"
			body( view:"/client/mail/invitation", 
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
			body( view:"/client/mail/password", 
					plugin:"email-confirmation", 
					model:[member:member])
		}
		return true
	}
	
	def deleteExpireActivation () {
		
		def maxDay = config.transeo.customer.purge.day.toInteger()
		
		def gc = new GregorianCalendar()
		gc.add(Calendar.DAY_OF_YEAR, (maxDay * -1))
		
		def c = Member.createCriteria()
		def results = c { 
			eq("active", false) 
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
		
		def c = Customer.createCriteria()
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
				if(StringUtils.isNotBlank(params.postal) && params.postal.isInteger()){
					eq("postal", params.postal.toInteger())
				}
				if(StringUtils.isNotBlank(params.country)){
					ilike("country", params.country)
				}
			}
			firstResult(offset)
			maxResults(max)
			order(sortCriteria, orderCriteria)
		}
		return results
	}
	
	def int countMax(params){
		def c = Customer.createCriteria()
		def results = c.get {
			projections { countDistinct('id') }
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
				if(StringUtils.isNotBlank(params.postal) && params.postal.isInteger()){
					eq("postal", params.postal.toInteger())
				}
				if(StringUtils.isNotBlank(params.country)){
					ilike("country", params.country)
				}
			}
		}
		return results
	}
	
	def findUser(code, password){
		def c = Member.createCriteria()
		def result = c.get {
			eq("code", code)
			eq("password", password)
			eq("active", true)
		}
		return result
	}
}
