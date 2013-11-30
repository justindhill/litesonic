define ["Views/ArtistListView", "Views/AlbumView"], (ArtistListView, AlbumView) ->
	class AppRouter extends Backbone.Router
		routes:
			"artist(/:artistId)":		"artist"
			"album(/:albumId)":			"album"
			"song/:songId":				"song"
			"*path":					"default"

		artist: (artistId) ->
			console.log "ARTIST ARTIST ARTIST"
			if artistId?
				console.log "Artist page not implemented yet"
			else
				view = new ArtistListView
				LiteSonic.contentView.$el.empty().append(view.render().el)

		album: (albumId) ->
			if albumId?
				view = new AlbumView(id: albumId)
				LiteSonic.contentView.$el.empty().append(view.render().el)
			console.log "Album view not implemented"

		song: (songId) ->
			console.log "Song handler not implemented"

		default: ->
			@artist()
