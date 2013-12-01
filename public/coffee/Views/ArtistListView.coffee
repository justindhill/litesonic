define ["Views/CoverSection", "Collections/ArtistList"], (CoverSection, ArtistList) ->
	class ArtistListView extends Backbone.View
		tagName: "div"
		initialize: ->
			@collection = new ArtistList
			@collection.fetch()
		render: ->
			if not @coverList?
				@coverList = new CoverSection(collection: @collection)
			@$el.append(@coverList.render().$el)
			this
