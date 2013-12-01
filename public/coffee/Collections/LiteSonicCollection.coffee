define ["APIClient"], (APIClient) ->
	class LiteSonicCollection extends Backbone.Collection
		sync: (method, model, options) ->
			callName = null
			if method is "read"
				callName = @readAPICall
			else if method is "create"
				callName = @createAPICall
			else if method is "update"
				callName = @updateAPICall
			else if method is "delete"
				callName = @deleteAPICall

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
					@reset(@parse(data))
				error: options.error

		fetch: ->
			if (@id?)
				super(params: id: @id)
			else
				super()

		save: ->
			super(null, params: id: @id)

		destroy: ->
			super(params: id: @id)
