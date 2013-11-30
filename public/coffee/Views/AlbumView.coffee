define ["Views/SongTable", "Models/Album"], (SongTable, Album) ->
	class AlbumView extends Backbone.View
		tagName: "div"
		className: "app-center-content"
		template: Handlebars.compile($("#template-album-page-header").html())

		initialize: (options) ->
			if options? and options.id?
				@model = new Album(id: options.id)
			@listenTo(@model, "change:songs", @render)
			@model.fetch()

		render: ->
			$temp = $("<div>")

			# add the header
			$temp.append @template
				title: @model.get("name")
				subtitle: @model.get("artist")
				imageUrl: @model.artUrl(150)

			if @model.get("songs")?
				songTable = new SongTable(collection: @model.get("songs"))
				$temp.append(songTable.render().el)

			@$el.empty().append($temp.children())
			this
