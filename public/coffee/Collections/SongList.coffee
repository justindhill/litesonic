define ["Models/Song"], (Song) ->
	class SongList extends Backbone.Collection
		model: Song
