define ["Views/CoverItem"], (CoverItem) ->
	class CoverSection extends Backbone.View
		tagName: "div"
		className: "cover-section"
		initialize: (options) ->
			super(options)
			@title = options.title
			@listenTo(@collection, "add", @render)
			@listenTo(@collection, "remove", @render)

		render: ->
			$temp = $("<div>")
			if @title?
				$temp.append("<h1>#{@title}</h1>")

			@collection.each (item, index) ->
				view = new CoverItem(model: item)
				$temp.append(view.render().el)

			@$el.empty().append($temp.children())
			this


