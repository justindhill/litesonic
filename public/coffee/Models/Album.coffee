define ["Models/LiteSonicModel"], (LiteSonicModel) ->
	class Album extends LiteSonicModel
		readAPICall: "getAlbum"

		defaults:
			artist: null
			artistId: null
			coverArt: null
			created: null
			duration: null
			id: null
			name: null
			songs: null
			songCount: null

		parse: (response, options) ->
			album = response['subsonic-response'].album
			hash =
				artist: album.artist
				artistId: album.artistId
				coverArt: album.coverArt
				created: album.created
				duration: album.duration
				id: album.id
				name: album.name
				songCount: album.songCount
