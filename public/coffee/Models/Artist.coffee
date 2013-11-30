define ["Models/LiteSonicModel", "Collections/AlbumList"], (LiteSonicModel, AlbumList) ->
	class Artist extends LiteSonicModel
		defaults:
			id: null
			albums: null
			name: null
			coverArt: null
			albumCount: null

		readAPICall: "getArtist"

		parse: (response, options) ->
			artist = response['subsonic-response'].artist
			# once we create the Album model, we need to parse the
			# albums array here and create their models
			hash =
				id: artist.id
				albums: new AlbumList(artist.album)
				name: artist.name
				coverArt: artist.coverArt
				albumCount: artist.albumCount

		coverViewFields: =>
			title: @get("name")
			imageUrl: @artUrl()
