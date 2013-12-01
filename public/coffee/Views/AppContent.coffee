define ->
	class AppContent extends Backbone.View
		el: "#app-content"

		initialize: ->
			@$left = @$el.find(".app-sidebar")
			@$center = @$el.find(".app-center-content")
