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
	}
}