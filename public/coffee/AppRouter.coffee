define ["Views/ArtistListView"], (ArtistListView) ->
	class AppRouter extends Backbone.Router
		routes:
			"artist(/:artistId)":		"artist"
			"album(/:albumId)":			"album"
			"song/:songId":				"song"
			"*path":					"default"

		artist: (artistId) ->
			console.log "ARTIST ARTIST ARTIST"
			if not artistId?
				view = new ArtistListView
				LiteSonic.contentView.$el.empty().append(view.render().$el)
			else
				console.log "Artist page not implemented yet"

		album: (albumId) ->
			console.log "Album view not implemented"

		song: (songId) ->
			console.log "Song handler not implemented"

		default: ->
			@artist()
