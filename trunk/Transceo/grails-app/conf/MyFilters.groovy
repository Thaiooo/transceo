class MyFilters {
	def filters = {
		admin(controller:'administrator', action:'*') {
			before = {
				if(actionName != "login"){
					if (session.USER == null) {
						redirect(controller:"administrator" ,action:"login")
						return false
					}else{
						return true
					}
				}
			}
		}
		
		user(controller:'member', action:'*') {
			before = {
				if(actionName == "initAddFriend"){
					if (session.USER == null) {
						redirect(controller:"login" ,action:"login")
						return false
					} else {
						return true
					}
				}else{
					return true
				}
			}
		}
	}
}