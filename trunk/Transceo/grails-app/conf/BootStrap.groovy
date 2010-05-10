import java.util.Date;
import java.util.Set;

import com.transceo.Adress;
import com.transceo.Member;
import com.transceo.Travel;
import com.transceo.TravelStatus;

class BootStrap {
	
	def init = { servletContext ->
		
		// =================================================
		def Member m1 = new Member()
		m1.firstName = "QUOC THAI"
		m1.lastName = "PHAN"
		m1.phoneNumber = "+33609703074"
		
		m1.code = "C00001"			
		m1.password = "myPassword"
		m1.active = true
		m1.eMail = "MY-MAIL1@GMAIL.COM"
		m1.subscribeDate = new Date()
		m1.activationId = 1234
		
		m1.save()
		
		// =================================================
		def depart = new Adress()
		depart.number = "46"
		depart.street = "RUE AFFORTY"
		depart.city = "VILLEPINTE"
		depart.country = "FRANCE"
		depart.save()
		
		def destination = new Adress()
		destination.number = "127"
		destination.street = "AVENUE DES CHAMPS ELYSEES"
		destination.city = "PARIS"
		destination.country = "FRANCE"
		destination.save()
		
		def travel = new Travel()
		travel.status = TravelStatus.SUCCESS
		travel.travelDate = new Date()
		travel.depart = depart
		travel.destination = destination
		travel.price = 100
		travel.customer = m1
		m1.travels.add(travel)
		
		travel.save()
		
		
		// =================================================
		def Member m2 = new Member()
		m2.firstName = "PERE TOTO"
		m2.lastName = "TUTU"
		m2.phoneNumber = "+33609703074"
		
		m2.code = "C00002"			
		m2.password = "myPassword"
		m2.active = true
		m2.eMail = "MY-MAIL2@GMAIL.COM"
		m2.subscribeDate = new Date()
		m2.activationId = 1234
		m2.friends.add(m1)
		m1.sponsor = m2
		
		m2.save()
		
		// =================================================
		def Member m3 = new Member()
		m3.firstName = "POTO"
		m3.lastName = "TUTU"
		m3.phoneNumber = "+33609703074"
		
		m3.code = "C00003"			
		m3.password = "myPassword"
		m3.active = true
		m3.eMail = "MY-MAIL3@GMAIL.COM"
		m3.subscribeDate = new Date()
		m3.activationId = 1234
		m1.friends.add(m3)
		m3.sponsor = m1
		
		m3.save()
	}
	def destroy = {
	}
} 