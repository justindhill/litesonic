define ->
	class SongTableItem extends Backbone.View
		tagName: "tr"
		template: Handlebars.compile($("#template-song-table-item").html())

		render: ->
			@$el.append @template
				trackNumber: @model.get("track")
				title: @model.get("title")
				artistName: @model.get("artist")
				albumName: @model.get("album")
				duration: @model.get("duration")
			this
