# Models that wish to be displayed using CoverItem must implement
# the coverItemFields function, returning a hash of fields to be
# used in the cover item.
#
# Required fields:
# • title
# • imageUrl
#
# Optional fields:
# • subtitle

define ->
	class CoverItem extends Backbone.View
		tagName: "div"
		className: "cover-item"
		template: Handlebars.compile($("#template-cover-view-item").html())

		events:
			"click": ->
				console.log @model.constructor.name.toLowerCase()
				LiteSonic.router.navigate("#{@model.constructor.name.toLowerCase()}/#{@model.get("id")}", trigger: yes)

		render: ->
			if @model? && typeof @model.coverViewFields is "function"
				@$el.html(@template(@model.coverViewFields()))

			else if @model? && typeof @model.coverViewFields is "undefined"
				console.log("#{@model.constructor.name} does not implement coverViewFields. See CoverItem.coffee for more information.")
			this
