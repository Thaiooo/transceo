import com.transceo.SessionConstant;

class MyFilters {
	def filters = {
		admin(controller:'*', action:'*') {
			before = {
				switch (controllerName) {
					case 'administrator':
					if(actionName != "login"){
						if (session[SessionConstant.ADMIN.name()] == null) {
							redirect(controller:"administrator" ,action:"login")
							return false
						}else{
							return true
						}
					} else{
						return true
					}
					break
					
					case 'location':
					if (session[SessionConstant.ADMIN.name()] == null) {
						redirect(controller:"administrator" ,action:"login")
						return false
					}else{
						return true
					}
					break
					
					case 'member':
					if(actionName == "searchMember"){
						if (session[SessionConstant.ADMIN.name()] == null) {
							redirect(controller:"administrator" ,action:"login")
							return false
						}else{
							return true
						}
					} else{
						return true
					}
					break
					
					case 'rateMile':
					if (session[SessionConstant.ADMIN.name()] == null) {
						redirect(controller:"administrator" ,action:"login")
						return false
					}else{
						return true
					}
					
					default:
					return true
					break
				}
			}
		}
		
		user(controller:'*', action:'*') {
			before = {
				switch (controllerName) {
					case 'member':
					if(actionName == "initAddFriend" || 
					actionName == "showMyProfile" || 
					actionName == "initAddFriend" ||
					actionName == "addFriend" ||
					actionName == "initUpdateCustomerInformation" ||
					actionName == "updateCustomerInformation" ||
					actionName == "initChangePassword" ||							
					actionName == "changePassword"								
					){
						if (session[SessionConstant.USER.name()] == null) {
							redirect(controller:"login" ,action:"login")
							return false
						} else {
							return true
						}
					}else{
						return true
					}
					break
					
					case 'travel':
					if(actionName == "initQuoteATravelForMember" ||
					actionName == "initBookATravelForMember" ||
					actionName == "show"
					){
						if (session[SessionConstant.USER.name()] == null) {
							redirect(controller:"login" ,action:"login")
							return false
						} else {
							return true
						}
					}else{
						return true
					}
					break
					
					default:
					return true
					break
				}
			}
		}
	}
}