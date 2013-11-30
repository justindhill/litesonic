require ["Models/Artist"], (Artist) ->
	console.log "woot"
	localStorage.setItem("LSSSHost", "http://localhost:4040")
	localStorage.setItem("LSUsername", "justin")
	localStorage.setItem("LSPassword", "elizabeth")
	window.Artist = Artist
