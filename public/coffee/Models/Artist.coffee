define ["Models/LiteSonicModel"], (LiteSonicModel) ->
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
				name: artist.name
				coverArt: artist.coverArt
				albumCount: artist.albumCount
