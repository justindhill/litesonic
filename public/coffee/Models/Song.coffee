define ["Models/LiteSonicModel", "Models/Star"], (LiteSonicModel, Star) ->
	class Song extends LiteSonicModel
		readAPICall: "getSong"

		defaults:
			album: null
			albumId: null
			artist: null
			artistId: null
			bitRate: null
			contentType: null
			coverArt: null
			created: null
			discNumber: null
			duration: null
			genre: null
			id: null
			isDir: null
			isVideo: null
			parent: null
			path: null
			size: null
			suffix: null
			title: null
			track: null
			type: null

		parse: (response, options) ->
			song = response['subsonic-response'].song
			return song

		star: ->
			s = new Star(id: @id)
			s.save()

		unstar: ->
			s = new Star(id: @id)
			s.destroy()
