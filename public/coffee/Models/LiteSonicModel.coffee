define ["APIClient"], (APIClient) ->
	class LiteSonicModel extends Backbone.Model
		sync: (method, model, options) ->
			callName = switch method
				when "read" then @readAPICall
				when "create" then @createAPICall
				when "update" then @updateAPICall
				when "delete" then @deleteAPICall

			if not callName? then return null

			params =
				if options.params?
					$.extend(options.params, APIClient.requiredParameters)
				else
					APIClient.requiredParameters

			url = APIClient.createUrl(callName)

			$.ajax
				url: url
				data: params
				crossDomain: yes
				dataType: "jsonp"
				success: (data, status, xhr) =>
					console.log data
					if data['subsonic-response'].error?
						if options.error?
							options.error()
						console.log "LiteSonic: Error in #{@constructor.name} model: #{data['subsonic-response'].error.message}"
					else
						@set(@parse(data))
				error: options.error

		fetch: ->
			super(params: id: @id)

		save: ->
			super(null, params: id: @id)

		destroy: ->
			super(params: id: @id)

		artUrl: (size) ->
			actual = if size? then "&size=#{size * window.devicePixelRatio}" else ""
			url = "#{APIClient.createUrl("getCoverArt")}?id=#{@get("coverArt")}#{actual}"

			for key in _.keys(APIClient.requiredParameters)
				val = APIClient.requiredParameters[key]

				url += "&#{key}=#{val?() or val}"

			return url
