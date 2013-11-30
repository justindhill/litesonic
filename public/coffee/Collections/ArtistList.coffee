define ["Collections/LiteSonicCollection", "Models/Artist"], (LiteSonicCollection, Artist) ->
	class ArtistList extends LiteSonicCollection
		model: Artist
		readAPICall: "getArtists"

		parse: (response, options) ->
			# For now, we don't care about the index data, so throw it out because it
			# will make things harder for us at the moment.
			artists = []
			alpha = response['subsonic-response'].artists.index

			for letter in alpha
				if letter.artist.constructor.name is "Array"
					for artist in letter.artist
						artists.push(artist)
				else
					artists.push(letter.artist)

			return artists
