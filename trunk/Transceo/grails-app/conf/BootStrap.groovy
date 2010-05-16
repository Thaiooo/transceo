import java.sql.Time;
import java.util.Date;
import java.util.Set;

import com.transceo.Administrator;
import com.transceo.Adresse;
import com.transceo.Member;
import com.transceo.Travel;
import com.transceo.TravelStatus;

class BootStrap {
	
	def init = { servletContext ->
		
		// =================================================
		def admin = new Administrator()
		admin.login = "admin"
		admin.password = "passsword"
		admin.save()
		
		// =================================================
		def Member m1 = new Member()
		m1.firstName = "QUOC THAI"
		m1.lastName = "PHAN"
		m1.phoneNumber = "+33609703074"
		m1.adresse="46 RUE AFFORTY"
		m1.city="VILLEPINTE"
		m1.postal=93420
		m1.country="FRANCE"
		m1.eMail = "MY-MAIL1@GMAIL.COM"
		
		m1.code = "C00001"			
		m1.password = "myPassword"
		m1.active = true
		m1.subscribeDate = new Date()
		m1.activationId = 1234
		
		m1.save()
		
		// =================================================
		def depart = new Adresse()
		depart.adresse = "46 RUE AFFORTY"
		depart.city = "VILLEPINTE"
		depart.postal = 93420
		depart.country="FRANCE"
		depart.save()
		
		def destination = new Adresse()
		destination.adresse = "127 AVENUE DES CHAMPS ELYSEES"
		destination.city = "PARIS"
		destination.postal = 75000
		destination.country="FRANCE"
		destination.save()
		
		def travel = new Travel()
		travel.status = TravelStatus.SUCCESS
		travel.creationDate = new Date()
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
		m2.adresse="46 RUE AFFORTY"
		m2.city="VILLEPINTE"		
		m2.postal=93420
		m2.country="FRANCE"
		m2.eMail = "MY-MAIL2@GMAIL.COM"
				
		m2.code = "C00002"			
		m2.password = "myPassword"
		m2.active = true
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
		m3.adresse="46 RUE AFFORTY"
		m3.city="VILLEPINTE"
		m3.postal=93420
		m3.country="FRANCE"
		m3.eMail = "MY-MAIL3@GMAIL.COM"
				
		m3.code = "C00003"			
		m3.password = "myPassword"
		m3.active = true
		m3.subscribeDate = new Date()
		m3.activationId = 1234
		m1.friends.add(m3)
		m3.sponsor = m1
		
		m3.save()
	}
	def destroy = {
	}
} 