import java.util.Date;
import java.util.Set;

import com.transceo.Member;

class BootStrap {
	
	def init = { servletContext ->
		def com.transceo.Member m = new com.transceo.Member()
		m.firstName = "Quoc Thai"
		m.lastName = "PHAN"
		m.phoneNumber = "+33 6 09 70 30 74"
		
		m.password = "myPassword"
		m.active = true
		m.eMail = "my-mail4@gmail.com"
		m.subscribeDate = new Date()
		m.activationId = 1234
		
		m.save()
	}
	def destroy = {
	}
} 