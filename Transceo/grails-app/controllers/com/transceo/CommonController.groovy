package com.transceo

class CommonController {
	def displayMessage = {
		render(view:"/common/message", model:[codeTitle: params.codeTitle, codeMessage: params.codeMessage])
	}
}
