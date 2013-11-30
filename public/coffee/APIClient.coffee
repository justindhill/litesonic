define ->
	class APIClient
		@SSAPIVERSION: "1.8.0"
		@CLIENTNAME: "litesonic-0.1"
		@USERNAME: ->
			localStorage.getItem("LSUsername")
		@PASSWORD: ->
			localStorage.getItem("LSPassword")
		@SSHOST: ->
			localStorage.getItem("LSSSHost")
		@requiredParameters:
			u: @USERNAME
			p: @PASSWORD
			c: @CLIENTNAME
			v: @SSAPIVERSION
			f: "jsonp"
		@createUrl: (methodName) ->
			if not methodName?
				return null
			"#{@SSHOST()}/rest/#{methodName}.view"
