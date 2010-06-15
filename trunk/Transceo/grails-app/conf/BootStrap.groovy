import java.util.Date;

import com.transceo.Administrator;
import com.transceo.Adresse;
import com.transceo.CodeSequence 
import com.transceo.Customer;
import com.transceo.DateUtils;
import com.transceo.Member;
import com.transceo.RateMile;
import com.transceo.Travel;
import com.transceo.TravelStatus;

class BootStrap {
	
	def init = { servletContext ->
		insertData()
	}
	def destroy = {
	}
	
	private void insertData() {
		// =================================================
		// =================================================
		def sequence = new CodeSequence(sequence: 3)
		sequence.save()
		
		/*
		// =================================================
		// =================================================
		def admin = new Administrator()
		admin.login = "admin"
		admin.password = "password"
		admin.lastName = "PHAN"
		admin.firstName = "QUOC THAI"
		admin.save()
		
		// =================================================
		// =================================================
		def Member m1 = new Member()
		m1.firstName = "QUOC THAI"
		m1.lastName = "PHAN"
		m1.phoneNumber = "+33609703074"
		m1.adresse="46 RUE AFFORTY"
		m1.city="VILLEPINTE"
		m1.postal=93420
		m1.country="FRANCE"
		m1.eMail = "QUOC.THAI.PHAN@GMAIL.COM"
		
		m1.code = "0001"			
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
		travel.creationDate = DateUtils.parseDateTime("01/01/2009", 14, 0)
		travel.travelDate = DateUtils.parseDateTime("01/01/2009", 14, 30)
		travel.travelHour = 14
		travel.travelMinute = 30
		travel.depart = depart
		travel.destination = destination
		travel.price = 100
		travel.handicap = true
		travel.numberOfPersonne = 2
		travel.comment = "Bla bla"
		travel.customer = m1
		m1.travels.add(travel)
		travel.save()
		
		depart = new Adresse()
		depart.adresse = "46 RUE AFFORTY"
		depart.city = "VILLEPINTE"
		depart.postal = 93420
		depart.country="FRANCE"
		depart.save()
		
		destination = new Adresse()
		destination.adresse = "127 AVENUE DES CHAMPS ELYSEES"
		destination.city = "PARIS"
		destination.postal = 75000
		destination.country="FRANCE"
		destination.save()
		
		travel = new Travel()
		travel.status = TravelStatus.RESERVE_ASK
		travel.creationDate = DateUtils.parseDateTime("02/01/2009", 15, 0)
		travel.travelDate = DateUtils.parseDateTime("02/01/2009", 15, 30)
		travel.travelHour = 15
		travel.travelMinute = 30
		travel.depart = depart
		travel.destination = destination
		//travel.price = 100
		travel.handicap = true
		travel.numberOfPersonne = 1
		travel.comment = "Bla bla"
		travel.customer = m1
		m1.travels.add(travel)
		travel.save()
		
		depart = new Adresse()
		depart.adresse = "46 RUE AFFORTY"
		depart.city = "VILLEPINTE"
		depart.postal = 93420
		depart.country="FRANCE"
		depart.save()
		
		destination = new Adresse()
		destination.adresse = "127 AVENUE DES CHAMPS ELYSEES"
		destination.city = "PARIS"
		destination.postal = 75000
		destination.country="FRANCE"
		destination.save()
		
		travel = new Travel()
		//travel.status = TravelStatus.RESERVE_TO_CONFIRM
		travel.status = TravelStatus.RESERVE_ASK
		travel.creationDate = DateUtils.parseDateTime("03/01/2009", 14, 0)
		travel.travelDate = DateUtils.parseDateTime("03/01/2009", 14, 30)
		travel.travelHour = 14
		travel.travelMinute = 30
		travel.depart = depart
		travel.destination = destination
		travel.price = 100
		travel.handicap = false
		travel.numberOfPersonne = 2
		travel.comment = "Bla bla"
		travel.customer = m1
		m1.travels.add(travel)
		travel.save()
		
		depart = new Adresse()
		depart.adresse = "46 RUE AFFORTY"
		depart.city = "VILLEPINTE"
		depart.postal = 93420
		depart.country="FRANCE"
		depart.save()
		
		destination = new Adresse()
		destination.adresse = "127 AVENUE DES CHAMPS ELYSEES"
		destination.city = "PARIS"
		destination.postal = 75000
		destination.country="FRANCE"
		destination.save()
		
		travel = new Travel()
		travel.status = TravelStatus.RESERVE_CONFIRM
		travel.creationDate = new Date()
		travel.travelDate = new Date()
		travel.travelHour = 1
		travel.travelMinute = 10
		travel.depart = depart
		travel.destination = destination
		travel.price = 100
		travel.handicap = true
		travel.numberOfPersonne = 2
		travel.comment = null
		travel.customer = m1
		m1.travels.add(travel)
		travel.save()
		
		// =================================================
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
		
		m2.code = "0002"			
		m2.password = "myPassword"
		m2.active = true
		m2.subscribeDate = new Date()
		m2.activationId = 1234
		m2.friends.add(m1)
		m1.sponsor = m2
		m2.save()
		
		// =================================================
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
		
		m3.code = "0003"			
		m3.password = "myPassword"
		m3.active = true
		m3.subscribeDate = new Date()
		m3.activationId = 1234
		m1.friends.add(m3)
		m3.sponsor = m1
		m3.save()
		
		// =================================================
		// =================================================
		def Customer c1 = new Customer()
		c1.firstName = "POTO"
		c1.lastName = "TUTU"
		c1.phoneNumber = "+33609703074"
		c1.adresse="46 RUE AFFORTY"
		c1.city="VILLEPINTE"
		c1.postal=93420
		c1.country="FRANCE"
		c1.eMail = "MY-MAIL3@GMAIL.COM"
		c1.save()
		
		depart = new Adresse()
		depart.adresse = "46 RUE AFFORTY"
		depart.city = "VILLEPINTE"
		depart.postal = 93420
		depart.country="FRANCE"
		depart.save()
		
		destination = new Adresse()
		destination.adresse = "127 AVENUE DES CHAMPS ELYSEES"
		destination.city = "PARIS"
		destination.postal = 75000
		destination.country="FRANCE"
		destination.save()
		
		travel = new Travel()
		travel.status = TravelStatus.RESERVE_ASK
		travel.creationDate = new Date()
		travel.travelDate = new Date()
		travel.travelHour = 1
		travel.travelMinute = 10
		travel.depart = depart
		travel.destination = destination
		travel.price = 100
		travel.handicap = true
		travel.numberOfPersonne = 2
		travel.comment = null
		travel.customer = c1
		c1.travels.add(travel)
		travel.save()
		
		// =================================================
		// =================================================
		def r1 = new RateMile()
		r1.level = 0
		r1.rate = 100
		r1.save()
		
		// =================================================
		def r2 = new RateMile()
		r2.level = 1
		r2.rate = 75
		r2.save()
		
		// =================================================
		def r3 = new RateMile()
		r3.level = 2
		r3.rate = 50
		r3.save()
		*/
	}
} 