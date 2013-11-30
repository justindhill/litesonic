define ["Views/SongTableItem"], (SongTableItem) ->
	class SongTable extends Backbone.View
		tagName: "table"
		className: "song-table"

		# no dynamic content, so not compiling with Handlebars
		template: $("#template-song-table-header").html()

		render: ->
			$temp = $("<tbody>")

			@$el.empty()

			# add the header
			@$el.append(@template)

			# create the rows
			@collection.each (item, index) ->
				view = new SongTableItem(model: item)
				$temp.append(view.render().el)

			@$el.append($temp.children())
			this
