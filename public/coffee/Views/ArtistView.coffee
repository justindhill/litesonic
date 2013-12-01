define ["Views/CoverSection", "Views/SongTable", "Models/Artist"], (CoverSection, SongTable, Artist) ->
	class ArtistView extends Backbone.View
		initialize: (options) ->
			if options? and options.id?
				@model = new Artist(id: options.id)
				@model.fetch()
			@listenTo(@model, "change", @render)

		render: ->
			@$el.empty()
			@$el.append("<h3>Albums</h3>")
			if @model.get("albums")?
				albumsSection = new CoverSection(collection: @model.get("albums"))
				@$el.append(albumsSection.render().el)
			this

