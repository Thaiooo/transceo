package com.transceo

import org.apache.commons.lang.StringUtils;
import org.codehaus.groovy.grails.commons.ConfigurationHolder;

class TravelService {
	static transactional = true
	def mailService
	def config = ConfigurationHolder.config
	def max = config.transeo.pagination.size.toInteger()
	
	def create(Travel travel){
		// Send mail
		if(travel.class.name == 'com.transceo.TravelQuotation'){
			mailService.sendMail {
				to travel.customer.eMail
				from "no-reply@transceo.com"
				subject config.transeo.notification.mail.client.subject
				body( view:"/client/mail/reservationResume", 
						plugin:"email-confirmation", 
						model:[travel:travel])
			}
		}
		mailService.sendMail {
			to config.transeo.notification.mail.adr
			from "no-reply@transceo.com"
			subject config.transeo.notification.mail.admin.subject
			body( view:"/client/mail/reservationNotification", 
					plugin:"email-confirmation", 
					model:[travel:travel])
		}
		
		travel.customer.save()
		travel.depart.save()
		if(null != travel.destination){
			travel.destination.save()	
		}
		travel.customer.travels.add(travel)
		travel.save()
	}
	
	def findReservation(params){
		def sortCriteria = params.sort
		if(sortCriteria == null){
			sortCriteria = "creationDate"
		}
		def orderCriteria = params.order
		if(orderCriteria == null){
			orderCriteria = "asc"
		}
		def offset = 0
		if(params.offset != null){
			offset = params.offset.toInteger()	
		}
		def c = Travel.createCriteria()
		def results = c.list {
			customer{
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
			if(params.status != null && params.status.size > 0){
				'in'("status", params.status)
			}
			
			if(params.reservationDate != null){
				switch (params.reservationDateCriteria){
					case DateCriteria.EQUALS.name():
						ge("travelDate", params.reservationDate)
						le("travelDate", params.reservationDate + 1) 
						break;
					case DateCriteria.BEFORE.name():
						le("travelDate", params.reservationDate + 1)
						break;
					case DateCriteria.AFTER.name():
						ge("travelDate", params.reservationDate)
						break;
					default:
						ge("travelDate", params.reservationDate)
						le("travelDate", params.reservationDate + 1)
						break;
				}
			}
			if(params.creationDate != null){
				switch (params.creationDateCriteria){
					case DateCriteria.EQUALS.name():
						ge("travelDate", params.creationDate)
						le("travelDate", params.creationDate + 1) 
						break;
					case DateCriteria.BEFORE.name():
						le("travelDate", params.creationDate + 1)
						break;
					case DateCriteria.AFTER.name():
						ge("travelDate", params.creationDate)
						break;
					default:
						ge("travelDate", params.creationDate)
						le("travelDate", params.creationDate + 1)
						break;
				}
			}
			if(params.handicap){
				eq("handicap", true)
			}
			
			firstResult(offset)
			if(params.max != -1){
				maxResults(max)	
			}
			
			order(sortCriteria, orderCriteria)
		}
		return results
	}
	
	def countMax(params){
		def c = Travel.createCriteria()
		def results = c.get {
			projections { countDistinct('id') }
			and {
				customer{
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
				if(params.status != null && params.status.size > 0){
					'in'("status", params.status)
				}
				if(params.reservationDate != null){
					switch (params.reservationDateCriteria){
						case DateCriteria.EQUALS.name():
							ge("travelDate", params.reservationDate)
							le("travelDate", params.reservationDate + 1) 
							break;
						case DateCriteria.BEFORE.name():
							le("travelDate", params.reservationDate + 1)
							break;
						case DateCriteria.AFTER.name():
							ge("travelDate", params.reservationDate)
							break;
						default:
							ge("travelDate", params.reservationDate)
							le("travelDate", params.reservationDate + 1)
							break;
					}
				}
				if(params.creationDate != null){
					switch (params.creationDateCriteria){
						case DateCriteria.EQUALS.name():
							ge("travelDate", params.creationDate)
							le("travelDate", params.creationDate + 1) 
							break;
						case DateCriteria.BEFORE.name():
							le("travelDate", params.creationDate + 1)
							break;
						case DateCriteria.AFTER.name():
							ge("travelDate", params.creationDate)
							break;
						default:
							ge("travelDate", params.creationDate)
							le("travelDate", params.creationDate + 1)
							break;
					}
				}
				if(params.handicap){
					eq("handicap", true)
				}
			}
		}
		return results
	}
	
	def cancel(id){
		def travel = Travel.get(id)
		travel.status = TravelStatus.CANCEL
		travel.save()
	}
	def customerConfirm(Travel travel){
		travel.status = TravelStatus.QUOTATION_CONFIRM
		travel.save()
		
		// Send mail
		mailService.sendMail {
			to config.transeo.notification.mail.adr
			from "no-reply@transceo.com"
			subject "Transceo - Confirmation Notification"
			body( view:"/client/mail/reservationConfirmationNotification",
					plugin:"email-confirmation",
					model:[travel:travel])
		}
	}
	
	def confirm(id){
		def travel = Travel.get(id)
		travel.status = TravelStatus.QUOTATION_CONFIRM
		travel.save()
	}
	
	def confirm(id, price){
		def travel = Travel.get(id)
		travel.status = TravelStatus.QUOTATION_CONFIRM
		travel.price = price
		travel.save()
	}
	
	def validate(id, price){		
		def travel = Travel.get(id)
		travel.status = TravelStatus.QUOTATION_TO_CONFIRM
		travel.price = price
		travel.save()
		
		def code = new ConfirmationCode()
		code.code = Math.round(Math.random() * 10000)
		code.travel = travel
		code.save()
		
		// Send mail
		mailService.sendMail {
			to travel.customer.eMail
			from "no-reply@transceo.com"
			subject "Transceo - Rservation Price"
			body( view:"/client/mail/reservationPrice", 
					plugin:"email-confirmation", 
					model:[travel:travel, code:code])
		}
	}
	
	def close(id){		
		def travel = Travel.get(id)
		travel.status = TravelStatus.SUCCESS
		
		// Distrubuer les miles
		if(travel.customer.class.name == Member.class.name){
			setMiles(travel.customer, 0, travel.price)
		}
		
		travel.save()
	}
	
	private void setMiles(customer, level, price){
		if (null != customer){
			def rateMile = RateMile.findByLevel(level)
			if(null != rateMile){
				def miles = price * (rateMile.rate / 100)
				if(level == 0){
					customer.miles += miles	
				}else{
					customer.friendMiles += miles	
				}
				
				setMiles(customer.sponsor, (level + 1), price)	
			}
		}
	}
	
	def findTravelByIdAndCustomerId(travelId, customerId){
		def c = Travel.createCriteria()
		def results = c.get {
			eq("id", travelId)
			customer{ eq("id", customerId) }
		}
		return results
	}
	
	def deleteExpireReservation() {
		def maxHour = config.transeo.reservation.purge.hour.toInteger()
		
		def gc = new GregorianCalendar()
		gc.add(Calendar.HOUR_OF_DAY, (maxHour * -1))
		
		def c = Travel.createCriteria()
		def results = c {
			'in'("status",[TravelStatus.QUOTATION_ASK, TravelStatus.QUOTATION_TO_CONFIRM, TravelStatus.QUOTATION_CONFIRM, TravelStatus.BOOK_ASK])
			le ("travelDate", gc.time)
		}
		
		results.each(){ 
			it.status =  TravelStatus.CANCEL
		}
	}
}
