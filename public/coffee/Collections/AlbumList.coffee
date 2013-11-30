define ["Models/Album"], (Album) ->
	class AlbumList extends Backbone.Collection
		model: Album
