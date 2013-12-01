define ["Views/ArtistListView", "Views/AlbumView", "Views/ArtistView"], (ArtistListView, AlbumView, ArtistView) ->
	class AppRouter extends Backbone.Router
		routes:
			"artist(/:artistId)":		"artist"
			"album(/:albumId)":			"album"
			"song/:songId":				"song"
			"*path":					"default"

		artist: (artistId) ->
			view = null
			if artistId?
				view = new ArtistView(id: artistId)
			else
				view = new ArtistListView

			LiteSonic.contentView.$center.empty().append(view.render().el)

		album: (albumId) ->
			if albumId?
				view = new AlbumView(id: albumId)
				LiteSonic.contentView.$center.empty().append(view.render().el)
			console.log "Album view not implemented"

		song: (songId) ->
			console.log "Song handler not implemented"

		default: ->
			@artist()
