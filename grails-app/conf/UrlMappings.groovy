class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		"/error"(view:"/error")
        "/"(view:"/index")
		"/authenticate"(controller:"google", action:"getAuthention")
		"/error"(view:"/error")
        "500"(view:'/error')
		"404"(view:'/notFound')
	}
}
