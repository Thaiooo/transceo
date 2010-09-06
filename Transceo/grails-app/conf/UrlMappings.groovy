class UrlMappings {
    static mappings = {
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
      "/administrate_transceo" {
          controller = "administrator"
          action = "login"
       }
	  "500"(view:'/error')
	  "/" {
		  controller = "page"
		  action = "home"
	  }
	}
}